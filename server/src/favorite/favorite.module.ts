import { Module ,NestModule, MiddlewareConsumer} from '@nestjs/common';
import { Favorite } from 'src/entities/favorite';
import { User } from 'src/entities/user';
import { TypeOrmModule } from '@nestjs/typeorm';
import { login } from '../middleware/token';
import { FavoriteController } from './favorite.controller';
import { FavoriteService } from './favorite.service';
import { JwtModule } from '@nestjs/jwt';
import { jwtConstants } from '../auth/constants';

@Module({
    imports:[TypeOrmModule.forFeature([Favorite,User]), JwtModule.register({
        secret: jwtConstants.secret,
        signOptions: { expiresIn: '7200s' },
      }),],
    providers:[FavoriteService],
    exports:[FavoriteService]
})
export class FavoriteModule 
    implements NestModule{
        configure(consumer: MiddlewareConsumer) {
          consumer.apply(login) 
            .forRoutes(FavoriteController);
        }
}
