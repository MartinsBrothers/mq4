# p r o p e r t y   c o p y r i g h t       " T r a d e   C i t y   D 1   M A   5   v . 1 "  
 # p r o p e r t y   l i n k                 " T r a d e o f c i t y . b l o g s p o t . c o m "  
 # p r o p e r t y   d e s c r i p t i o n   " <��B l o g   h t t p s : / / t r a d e o f c i t y . b l o g s p o t . c o m \ n =،�I G   h t t p s : / / w w w . i n s t a g r a m . c o m / t r a d e _ c i t y / . . . \ n <��  T e l e g r a m   h t t p s : / / t . m e / T r a d e _ C i t y F x "  
 # p r o p e r t y   v e r s i o n           " 0 0 0 . 0 0 1 "  
 # p r o p e r t y   s t r i c t  
  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / /   |                                               I N P U T   P A R A M E T E R S ,   G L O B A L   V A R I A B L E S ,   C O N S T A N T S ,   I M P O R T S   a n d   I N C L U D E S                                                 |   / /  
 / /   |                                             S y s t e m   a n d   C u s t o m   v a r i a b l e s   a n d   o t h e r   d e f i n i t i o n s   u s e d   i n   t h e   p r o j e c t                                               |   / /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   S y s t e m   c o n s t a n t s   ( p r o j e c t   s e t t i n g s )   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 / / - -  
 # d e f i n e   P R O J E C T _ I D   " m t 4 - 5 3 7 3 "  
 / / - -  
 / /   P o i n t   F o r m a t   R u l e s  
 # d e f i n e   P O I N T _ F O R M A T _ R U L E S   " 0 . 0 0 1 = 0 . 0 1 , 0 . 0 0 0 0 1 = 0 . 0 0 0 1 , 0 . 0 0 0 0 0 1 = 0 . 0 0 0 1 "   / /   t h i s   i s   d e s e r i a l i z e d   i n   a   s p e c i a l   f u n c t i o n   l a t e r  
 # d e f i n e   E N A B L E _ S P R E A D _ M E T E R   t r u e  
 # d e f i n e   E N A B L E _ S T A T U S   t r u e  
 # d e f i n e   E N A B L E _ T E S T _ I N D I C A T O R S   f a l s e  
 / / - -  
 / /   E v e n t s   O n / O f f  
 # d e f i n e   E N A B L E _ E V E N T _ T I C K   1   / /   e n a b l e   " T i c k "   e v e n t  
 # d e f i n e   E N A B L E _ E V E N T _ T R A D E   0   / /   e n a b l e   " T r a d e "   e v e n t  
 # d e f i n e   E N A B L E _ E V E N T _ T I M E R   0   / /   e n a b l e   " T i m e r "   e v e n t  
 / / - -  
 / /   V i r t u a l   S t o p s  
 # d e f i n e   V I R T U A L _ S T O P S _ E N A B L E D   0   / /   e n a b l e   v i r t u a l   s t o p s  
 # d e f i n e   V I R T U A L _ S T O P S _ T I M E O U T   0   / /   v i r t u a l   s t o p s   t i m e o u t  
 # d e f i n e   U S E _ E M E R G E N C Y _ S T O P S   " n o "   / /   " y e s "   t o   u s e   e m e r g e n c y   ( h a r d   s t o p s )   w h e n   v i r t u a l   s t o p s   a r e   i n   u s e .   " a l w a y s "   t o   u s e   E M E R G E N C Y _ S T O P S _ A D D   a s   e m e r g e n c y   s t o p s   w h e n   t h e r e   i s   n o   v i r t u a l   s t o p .  
 # d e f i n e   E M E R G E N C Y _ S T O P S _ R E L   0   / /   u s e   0   t o   d i s a b l e   h a r d   s t o p s   w h e n   v i r t u a l   s t o p s   a r e   e n a b l e d .   U s e   a   v a l u e   > = 0   t o   a u t o m a t i c a l l y   s e t   h a r d   s t o p s   w i t h   v i r t u a l .   E x a m p l e :   i f   2   i s   u s e d ,   t h e n   h a r d   s t o p s   w i l l   b e   2   t i m e s   b i g g e r   t h a n   v i r t u a l   o n e s .  
 # d e f i n e   E M E R G E N C Y _ S T O P S _ A D D   0   / /   a d d   p i p s   t o   r e l a t i v e   s i z e   o f   e m e r g e n c y   s t o p s   ( h a r d   s t o p s )  
 / / - -  
 / /   S e t t i n g s   f o r   e v e n t s  
 # d e f i n e   O N _ T R A D E _ R E A L T I M E   0   / /  
 # d e f i n e   O N _ T I M E R _ P E R I O D   6 0   / /   T i m e r   e v e n t   p e r i o d   ( i n   s e c o n d s )  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   S y s t e m   c o n s t a n t s   ( p r e d e f i n e d   c o n s t a n t s )   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 / / - -  
 / /   B l o c k s   L o o k u p   F u n c t i o n s  
 s t r i n g   f x d B l o c k s L o o k u p T a b l e [ ] ;  
  
 # d e f i n e   T L O B J P R O P _ T I M E 1   8 0 1  
 # d e f i n e   O B J P R O P _ T L _ P R I C E _ B Y _ S H I F T   8 0 2  
 # d e f i n e   O B J P R O P _ T L _ S H I F T _ B Y _ P R I C E   8 0 3  
 # d e f i n e   O B J P R O P _ F I B O V A L U E   8 0 4  
 # d e f i n e   O B J P R O P _ F I B O P R I C E V A L U E   8 0 5  
 # d e f i n e   O B J P R O P _ B A R S H I F T 1   8 0 7  
 # d e f i n e   O B J P R O P _ B A R S H I F T 2   8 0 8  
 # d e f i n e   O B J P R O P _ B A R S H I F T 3   8 0 9  
 # d e f i n e   S E L _ C U R R E N T   0  
 # d e f i n e   S E L _ I N I T I A L   1  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   E n u m e r a t i o n s ,   I m p o r t s ,   C o n s t a n t s ,   V a r i a b l e s   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
  
  
  
  
  
 / / - -  
 / /   C o n s t a n t s   ( I n p u t   P a r a m e t e r s )  
 i n p u t   i n t   M a g i c S t a r t   =   5 3 7 3 ;   / /   M a g i c   N u m b e r ,   k i n d   o f . . .  
 c l a s s   c  
 {  
 	 	 p u b l i c :  
 	 s t a t i c   i n t   M a g i c S t a r t ;  
 } ;  
 i n t   c : : M a g i c S t a r t ;  
  
  
 / / - -  
 / /   V a r i a b l e s   ( G l o b a l   V a r i a b l e s )  
 c l a s s   v  
 {  
 	 	 p u b l i c :  
 } ;  
  
  
  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   S y s t e m   g l o b a l   v a r i a b l e s   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 / / - -  
 i n t   F X D _ C U R R E N T _ F U N C T I O N _ I D   =   0 ;  
 d o u b l e   F X D _ M I L S _ I N I T _ E N D         =   0 ;  
 i n t   F X D _ T I C K S _ F R O M _ S T A R T         =   0 ;  
 i n t   F X D _ M O R E _ S H I F T                     =   0 ;  
 b o o l   F X D _ D R A W _ S P R E A D _ I N F O       =   f a l s e ;  
 b o o l   F X D _ F I R S T _ T I C K _ P A S S E D     =   f a l s e ;  
 b o o l   F X D _ B R E A K                             =   f a l s e ;  
 b o o l   F X D _ C O N T I N U E                       =   f a l s e ;  
 b o o l   F X D _ C H A R T _ I S _ O F F L I N E       =   f a l s e ;  
 b o o l   F X D _ O N T I M E R _ T A K E N             =   f a l s e ;  
 b o o l   F X D _ O N T I M E R _ T A K E N _ I N _ M I L L I S E C O N D S   =   f a l s e ;  
 d o u b l e   F X D _ O N T I M E R _ T A K E N _ T I M E   =   0 ;  
 b o o l   U S E _ V I R T U A L _ S T O P S   =   V I R T U A L _ S T O P S _ E N A B L E D ;  
 s t r i n g   F X D _ C U R R E N T _ S Y M B O L       =   " " ;  
 i n t   F X D _ B L O C K S _ C O U N T                 =   1 0 ;  
 d a t e t i m e   F X D _ T I C K S K I P _ U N T I L   =   0 ;  
  
 / / -   f o r   u s e   i n   O n C h a r t ( )   e v e n t  
 s t r u c t   f x d _ o n c h a r t  
 {  
 	 i n t   i d ;  
 	 l o n g   l p a r a m ;  
 	 d o u b l e   d p a r a m ;  
 	 s t r i n g   s p a r a m ;  
 } ;  
 f x d _ o n c h a r t   F X D _ O N C H A R T ;  
  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / /   |                                                                                                   E V E N T   F U N C T I O N S                                                                                                     |   / /  
 / /   |                                                       T h e s e   a r e   t h e   m a i n   f u n c t i o n s   t h a t   c o n t r o l s   t h e   w h o l e   p r o j e c t                                                       |   / /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   T h i s   f u n c t i o n   i s   e x e c u t e d   o n c e   w h e n   t h e   p r o g r a m   s t a r t s   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 i n t   O n I n i t ( )  
 {  
  
 	 / /   I n i t i a t e   C o n s t a n t s  
 	 c : : M a g i c S t a r t   =   M a g i c S t a r t ;  
  
  
  
  
 	 / /   d o   o r   d o   n o t   n o t   i n i t i l i a l i z e   o n   r e l o a d  
 	 i f   ( U n i n i t i a l i z e R e a s o n ( )   ! =   0 )  
 	 {  
 	 	 i f   ( U n i n i t i a l i z e R e a s o n ( )   = =   R E A S O N _ C H A R T C H A N G E )  
 	 	 {  
 	 	 	 / /   i f   t h e   s y m b o l   i s   t h e   s a m e ,   d o   n o t   r e l o a d ,   o t h e r w i s e   c o n t i n u e   b e l o w  
 	 	 	 i f   ( F X D _ C U R R E N T _ S Y M B O L   = =   S y m b o l ( ) )   { r e t u r n   I N I T _ S U C C E E D E D ; }  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 r e t u r n   I N I T _ S U C C E E D E D ;  
 	 	 }  
 	 }  
 	 F X D _ C U R R E N T _ S Y M B O L   =   S y m b o l ( ) ;  
  
 	 C u r r e n t S y m b o l ( F X D _ C U R R E N T _ S Y M B O L ) ;   / /   C u r r e n t S y m b o l ( )   h a s   i n t e r n a l   m e m o r y   t h a t   s h o u l d   b e   s e t   f r o m   h e r e   w h e n   t h e   s y m b o l l   i s   c h a n g e d  
 	 C u r r e n t T i m e f r a m e ( P E R I O D _ C U R R E N T ) ;  
  
  
  
  
 	 i f   ( T i m e C u r r e n t ( )   >   D ' 2 0 2 0 . 0 5 . 2 1 '   | |   T i m e L o c a l ( )   >   D ' 2 0 2 0 . 0 5 . 2 1 ' )  
 	 {  
 	 	 A l e r t   ( " T h e   t r i a l   v e r s i o n   h a s   e x p i r e d   a t   " + T i m e T o S t r i n g ( D ' 2 0 2 0 . 0 5 . 2 1 ' ,   T I M E _ D A T E ) + " " ) ;  
 	 	 E x p e r t R e m o v e ( ) ;  
 	 }  
  
  
 	 C o m m e n t ( " " ) ;  
 	 f o r   ( i n t   i = O b j e c t s T o t a l ( C h a r t I D ( ) ) ;   i > = 0 ;   i - - )  
 	 {  
 	 	 s t r i n g   n a m e   =   O b j e c t N a m e ( C h a r t I D ( ) ,   i ) ;  
 	 	 i f   ( S t r i n g S u b s t r ( n a m e , 0 , 8 )   = =   " f x d _ c m n t " )   { O b j e c t D e l e t e ( C h a r t I D ( ) ,   n a m e ) ; }  
 	 }  
 	 C h a r t R e d r a w ( ) ;  
  
  
  
 	 / / - -   d i s a b l e   v i r t u a l   s t o p s   i n   o p t i m i z a t i o n ,   b e c a u s e   g r a p h i c a l   o b j e c t s   d o e s   n o t   w o r k  
 	 / /   h t t p : / / d o c s . m q l 4 . c o m / r u n t i m e / t e s t i n g  
 	 i f   ( M Q L I n f o I n t e g e r ( M Q L _ O P T I M I Z A T I O N )   | |   ( M Q L I n f o I n t e g e r ( M Q L _ T E S T E R )   & &   ! M Q L I n f o I n t e g e r ( M Q L _ V I S U A L _ M O D E ) ) )   {  
 	 	 U S E _ V I R T U A L _ S T O P S   =   f a l s e ;  
 	 }  
  
 	 / / - -   s e t   i n i t i a l   l o c a l   a n d   s e r v e r   t i m e  
 	 T i m e A t S t a r t ( " s e t " ) ;  
  
 	 / / - -   s e t   i n i t i a l   b a l a n c e  
 	 A c c o u n t B a l a n c e A t S t a r t ( ) ;  
  
 	 / / - -   d r a w   t h e   i n i t i a l   s p r e a d   i n f o   m e t e r  
 	 i f   ( E N A B L E _ S P R E A D _ M E T E R   = =   f a l s e )   {  
 	 	 F X D _ D R A W _ S P R E A D _ I N F O   =   f a l s e ;  
 	 }  
 	 e l s e   {  
 	 	 F X D _ D R A W _ S P R E A D _ I N F O   =   ! ( M Q L I n f o I n t e g e r ( M Q L _ T E S T E R )   & &   ! M Q L I n f o I n t e g e r ( M Q L _ V I S U A L _ M O D E ) ) ;  
 	 }  
 	 i f   ( F X D _ D R A W _ S P R E A D _ I N F O )   D r a w S p r e a d I n f o ( ) ;  
  
 	 / / - -   d r a w   i n i t i a l   s t a t u s  
 	 i f   ( E N A B L E _ S T A T U S )   D r a w S t a t u s ( " w a i t i n g   f o r   t i c k . . . " ) ;  
  
 	 / / - -   d r a w   i n d i c a t o r s   a f t e r   t e s t  
 	 T e s t e r H i d e I n d i c a t o r s ( ! E N A B L E _ T E S T _ I N D I C A T O R S ) ;  
  
 	 / / - -   w o r k i n g   w i t h   o f f l i n e   c h a r t s  
 	 i f   ( M Q L I n f o I n t e g e r ( M Q L _ P R O G R A M _ T Y P E )   = =   P R O G R A M _ E X P E R T )  
 	 {  
 	 	 F X D _ C H A R T _ I S _ O F F L I N E   =   C h a r t G e t I n t e g e r ( 0 ,   C H A R T _ I S _ O F F L I N E ) ;  
 	 }  
  
 	 i f   ( M Q L I n f o I n t e g e r ( M Q L _ P R O G R A M _ T Y P E )   ! =   P R O G R A M _ S C R I P T )  
 	 {  
 	 	 i f   ( F X D _ C H A R T _ I S _ O F F L I N E   = =   t r u e   | |   ( E N A B L E _ E V E N T _ T R A D E   = =   1   & &   O N _ T R A D E _ R E A L T I M E   = =   1 ) )  
 	 	 {  
 	 	 	 F X D _ O N T I M E R _ T A K E N   =   t r u e ;  
 	 	 	 E v e n t S e t M i l l i s e c o n d T i m e r ( 1 ) ;  
 	 	 }  
 	 	 i f   ( E N A B L E _ E V E N T _ T I M E R )   {  
 	 	 	 O n T i m e r S e t ( O N _ T I M E R _ P E R I O D ) ;  
 	 	 }  
 	 }  
  
 	 i f   ( E N A B L E _ E V E N T _ T R A D E )   O n T r a d e L i s t e n e r ( ) ;   / /   t o   l o a d   i n i t i a l   d a t a b a s e   o f   o r d e r s  
  
  
 	 / / - -   I n i t i a l i z e   b l o c k s   c l a s s e s  
 	 A r r a y R e s i z e ( _ b l o c k s _ ,   1 0 ) ;  
  
 	 _ b l o c k s _ [ 0 ]   =   n e w   B l o c k 0 ( ) ;  
 	 _ b l o c k s _ [ 1 ]   =   n e w   B l o c k 1 ( ) ;  
 	 _ b l o c k s _ [ 2 ]   =   n e w   B l o c k 2 ( ) ;  
 	 _ b l o c k s _ [ 3 ]   =   n e w   B l o c k 3 ( ) ;  
 	 _ b l o c k s _ [ 4 ]   =   n e w   B l o c k 4 ( ) ;  
 	 _ b l o c k s _ [ 5 ]   =   n e w   B l o c k 5 ( ) ;  
 	 _ b l o c k s _ [ 6 ]   =   n e w   B l o c k 6 ( ) ;  
 	 _ b l o c k s _ [ 7 ]   =   n e w   B l o c k 7 ( ) ;  
 	 _ b l o c k s _ [ 8 ]   =   n e w   B l o c k 8 ( ) ;  
 	 _ b l o c k s _ [ 9 ]   =   n e w   B l o c k 9 ( ) ;  
  
 	 / /   f i l l   t h e   l o o k u p   t a b l e  
 	 A r r a y R e s i z e ( f x d B l o c k s L o o k u p T a b l e ,   A r r a y S i z e ( _ b l o c k s _ ) ) ;  
 	 f o r   ( i n t   i = 0 ;   i < A r r a y S i z e ( _ b l o c k s _ ) ;   i + + )  
 	 {  
 	 	 f x d B l o c k s L o o k u p T a b l e [ i ]   =   _ b l o c k s _ [ i ] . _ _ b l o c k _ u s e r _ n u m b e r ;  
 	 }  
  
 	 / /   f i l l   t h e   l i s t   o f   i n b o u n d   b l o c k s   f o r   e a c h   B l o c k C a l l s   i n s t a n c e  
 	 f o r   ( i n t   i = 0 ;   i < A r r a y S i z e ( _ b l o c k s _ ) ;   i + + )  
 	 {  
 	 	 _ b l o c k s _ [ i ] . _ _ a n n o u n c e T h i s B l o c k ( ) ;  
 	 }  
  
 	 / /   L i s t   o f   i n i t i a l l y   d i s a b l e d   b l o c k s  
 	 i n t   d i s a b l e d _ b l o c k s _ l i s t [ ]   =   { } ;  
 	 f o r   ( i n t   l   =   0 ;   l   <   A r r a y S i z e ( d i s a b l e d _ b l o c k s _ l i s t ) ;   l + + )   {  
 	 	 _ b l o c k s _ [ d i s a b l e d _ b l o c k s _ l i s t [ l ] ] . _ _ d i s a b l e d   =   t r u e ;  
 	 }  
  
  
  
 	 F X D _ M I L S _ I N I T _ E N D           =   ( d o u b l e ) G e t T i c k C o u n t ( ) ;  
 	 F X D _ F I R S T _ T I C K _ P A S S E D   =   f a l s e ;   / /   r e s e t   i s   n e e d e d   w h e n   c h a n g i n g   i n p u t s  
  
 	 r e t u r n ( I N I T _ S U C C E E D E D ) ;  
 }  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   T h i s   f u n c t i o n   i s   e x e c u t e d   o n   e v e r y   i n c o m i n g   t i c k   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 v o i d   O n T i c k ( )  
 {  
 	 F X D _ T I C K S _ F R O M _ S T A R T + + ;  
  
 	 i f   ( E N A B L E _ S T A T U S   & &   F X D _ T I C K S _ F R O M _ S T A R T   = =   1 )   D r a w S t a t u s ( " w o r k i n g " ) ;  
  
 	 / / - -   s p e c i a l   s y s t e m   a c t i o n s  
 	 i f   ( F X D _ D R A W _ S P R E A D _ I N F O )   D r a w S p r e a d I n f o ( ) ;  
 	 T i c k s D a t a ( " " ) ;   / /   C o l l e c t   t i c k s   ( i f   n e e d e d )  
 	 T i c k s P e r S e c o n d ( f a l s e ,   t r u e ) ;   / /   C o l l e c t   t i c k s   p e r   s e c o n d  
 	 i f   ( U S E _ V I R T U A L _ S T O P S )   { V i r t u a l S t o p s D r i v e r ( ) ; }  
  
 	 i f   ( O r d e r s T o t a l ( ) )   / /   t h i s   m a k e s   t h i n g s   f a s t e r  
 	 {  
 	 	 E x p i r a t i o n D r i v e r ( ) ;  
 	 	 O C O D r i v e r ( ) ;   / /   C h e c k   a n d   c l o s e   O C O   o r d e r s  
 	 }  
 	 i f   ( E N A B L E _ E V E N T _ T R A D E )   { O n T r a d e L i s t e n e r ( ) ; }  
  
  
 	 / /   s k i p   t i c k s  
 	 i f   ( T i m e L o c a l ( )   <   F X D _ T I C K S K I P _ U N T I L )   { r e t u r n ; }  
  
 	 / / - -   r u n   b l o c k s  
 	 i n t   b l o c k s _ t o _ r u n [ ]   =   { 1 , 4 } ;  
 	 f o r   ( i n t   i = 0 ;   i < A r r a y S i z e ( b l o c k s _ t o _ r u n ) ;   i + + )   {  
 	 	 _ b l o c k s _ [ b l o c k s _ t o _ r u n [ i ] ] . r u n ( ) ;  
 	 }  
  
  
 	 r e t u r n ;  
 }  
  
  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   T h i s   f u n c t i o n   i s   e x e c u t e d   o n   t r a d e   e v e n t s   -   o p e n ,   c l o s e ,   m o d i f y   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 v o i d   E v e n t T r a d e ( )  
 {  
  
  
 	 O n T r a d e Q u e u e ( - 1 ) ;  
 }  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   T h i s   f u n c t i o n   i s   e x e c u t e d   o n   a   p e r i o d   b a s i s   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 v o i d   O n T i m e r ( )  
 {  
 	 / / - -   t o   s i m u l a t e   t i c k s   i n   o f f l i n e   c h a r t s ,   T i m e r   i s   u s e d   i n s t e a d   o f   i n f i n i t e   l o o p  
 	 / / - -   t h e   n e x t   f u n c t i o n   c h e c k s   f o r   c h a n g e s   i n   p r i c e   a n d   c a l l s   O n T i c k ( )   m a n u a l l y  
 	 i f   ( F X D _ C H A R T _ I S _ O F F L I N E   & &   R e f r e s h R a t e s ( ) )   {  
 	 	 O n T i c k ( ) ;  
 	 }  
 	 i f   ( O N _ T R A D E _ R E A L T I M E   = =   1 )   {  
 	 	 O n T r a d e L i s t e n e r ( ) ;  
 	 }  
  
 	 s t a t i c   d a t e t i m e   t 0   =   0 ;  
 	 d a t e t i m e   t   =   0 ;  
 	 b o o l   o k   =   f a l s e ;  
  
 	 i f   ( F X D _ O N T I M E R _ T A K E N )  
 	 {  
 	 	 i f   ( F X D _ O N T I M E R _ T A K E N _ T I M E   >   0 )  
 	 	 {  
 	 	 	 i f   ( F X D _ O N T I M E R _ T A K E N _ I N _ M I L L I S E C O N D S   = =   t r u e )  
 	 	 	 {  
 	 	 	 	 t   =   G e t T i c k C o u n t ( ) ;  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 t   =   T i m e L o c a l ( ) ;  
 	 	 	 }  
 	 	 	 i f   ( ( t   -   t 0 )   > =   F X D _ O N T I M E R _ T A K E N _ T I M E )  
 	 	 	 {  
 	 	 	 	 t 0   =   t ;  
 	 	 	 	 o k   =   t r u e ;  
 	 	 	 }  
 	 	 }  
  
 	 	 i f   ( o k   = =   f a l s e )   {  
 	 	 	 r e t u r n ;  
 	 	 }  
 	 }  
  
 }  
  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   T h i s   f u n c t i o n   i s   e x e c u t e d   w h e n   c h a r t   e v e n t   h a p p e n s   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 v o i d   O n C h a r t E v e n t (  
 	 c o n s t   i n t   i d ,                   / /   E v e n t   I D  
 	 c o n s t   l o n g &   l p a r a m ,       / /   P a r a m e t e r   o f   t y p e   l o n g   e v e n t  
 	 c o n s t   d o u b l e &   d p a r a m ,   / /   P a r a m e t e r   o f   t y p e   d o u b l e   e v e n t  
 	 c o n s t   s t r i n g &   s p a r a m     / /   P a r a m e t e r   o f   t y p e   s t r i n g   e v e n t s  
 )  
 {  
 	 / / - -   w r i t e   p a r a m e t e r   t o   t h e   s y s t e m   g l o b a l   v a r i a b l e s  
 	 F X D _ O N C H A R T . i d           =   i d ;  
 	 F X D _ O N C H A R T . l p a r a m   =   l p a r a m ;  
 	 F X D _ O N C H A R T . d p a r a m   =   d p a r a m ;  
 	 F X D _ O N C H A R T . s p a r a m   =   s p a r a m ;  
  
  
 	 r e t u r n ;  
 }  
  
 / / V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V V / /  
 / /   T h i s   f u n c t i o n   i s   e x e c u t e d   o n c e   w h e n   t h e   p r o g r a m   e n d s   / /  
 / / ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ / /  
 v o i d   O n D e i n i t ( c o n s t   i n t   r e a s o n )  
 {  
 	 i n t   r e s o n   =   U n i n i t i a l i z e R e a s o n ( ) ;  
 	 i f   ( r e s o n   = =   R E A S O N _ C H A R T C H A N G E   | |   r e s o n   = =   R E A S O N _ P A R A M E T E R S   | |   r e a s o n   = =   R E A S O N _ T E M P L A T E )   { r e t u r n ; }  
  
 	 / / - -   i f   T i m e r   w a s   s e t ,   k i l l   i t   h e r e  
 	 E v e n t K i l l T i m e r ( ) ;  
  
 	 i f   ( E N A B L E _ S T A T U S )   D r a w S t a t u s ( " s t o p p e d " ) ;  
 	 i f   ( E N A B L E _ S P R E A D _ M E T E R )   D r a w S p r e a d I n f o ( ) ;  
  
  
  
 	 i f   ( M Q L I n f o I n t e g e r ( M Q L _ T E S T E R ) )   {  
 	 	 P r i n t ( " B a c k t e s t e d   i n   " + D o u b l e T o S t r i n g ( ( G e t T i c k C o u n t ( ) - F X D _ M I L S _ I N I T _ E N D ) / 1 0 0 0 ,   2 ) + "   s e c o n d s " ) ;  
 	 	 d o u b l e   t c   =   G e t T i c k C o u n t ( ) - F X D _ M I L S _ I N I T _ E N D ;  
 	 	 i f   ( t c   >   0 )  
 	 	 {  
 	 	 	 P r i n t ( " A v e r a g e   t i c k s   p e r   s e c o n d :   " + D o u b l e T o S t r i n g ( F X D _ T I C K S _ F R O M _ S T A R T / t c ,   0 ) ) ;  
 	 	 }  
 	 }  
  
 	 i f   ( M Q L I n f o I n t e g e r ( M Q L _ P R O G R A M _ T Y P E )   = =   P R O G R A M _ E X P E R T )  
 	 {  
 	 	 s w i t c h ( U n i n i t i a l i z e R e a s o n ( ) )  
 	 	 {  
 	 	 	 c a s e   R E A S O N _ P R O G R A M           :   P r i n t ( " E x p e r t   A d v i s o r   s e l f   t e r m i n a t e d " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ R E M O V E             :   P r i n t ( " E x p e r t   A d v i s o r   r e m o v e d   f r o m   t h e   c h a r t " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ R E C O M P I L E       :   P r i n t ( " E x p e r t   A d v i s o r   h a s   b e e n   r e c o m p i l e d " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ C H A R T C H A N G E   :   P r i n t ( " S y m b o l   o r   c h a r t   p e r i o d   h a s   b e e n   c h a n g e d " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ C H A R T C L O S E     :   P r i n t ( " C h a r t   h a s   b e e n   c l o s e d " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ P A R A M E T E R S     :   P r i n t ( " I n p u t   p a r a m e t e r s   h a v e   b e e n   c h a n g e d   b y   a   u s e r " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ A C C O U N T           :   P r i n t ( " A n o t h e r   a c c o u n t   h a s   b e e n   a c t i v a t e d   o r   r e c o n n e c t i o n   t o   t h e   t r a d e   s e r v e r   h a s   o c c u r r e d   d u e   t o   c h a n g e s   i n   t h e   a c c o u n t   s e t t i n g s " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ T E M P L A T E         :   P r i n t ( " A   n e w   t e m p l a t e   h a s   b e e n   a p p l i e d " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ I N I T F A I L E D     :   P r i n t ( " O n I n i t ( )   h a n d l e r   h a s   r e t u r n e d   a   n o n z e r o   v a l u e " ) ;   b r e a k ;  
 	 	 	 c a s e   R E A S O N _ C L O S E               :   P r i n t ( " T e r m i n a l   h a s   b e e n   c l o s e d " ) ;   b r e a k ;  
 	 	 }  
 	 }  
  
 	 / /   d e l e t e   d y n a m i c   p o i n t e r s  
 	 f o r   ( i n t   i = 0 ;   i < A r r a y S i z e ( _ b l o c k s _ ) ;   i + + )  
 	 {  
 	 	 d e l e t e   _ b l o c k s _ [ i ] ;  
 	 	 _ b l o c k s _ [ i ]   =   N U L L ;  
 	 }  
 	 A r r a y R e s i z e ( _ b l o c k s _ ,   0 ) ;  
  
 	 r e t u r n ;  
 }  
  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / /   | 	                                                                                   C l a s s e s   o f   b l o c k s                                                                                                         |   / /  
 / /   |                             C l a s s e s   t h a t   c o n t a i n   t h e   a c t u a l   c o d e   o f   t h e   b l o c k s   a n d   t h e i r   i n p u t   p a r a m e t e r s   a s   w e l l                               |   / /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
  
 / * *  
 	 T h e   b a s e   c l a s s   f o r   a l l   b l o c k   c a l l s  
       * /  
 c l a s s   B l o c k C a l l s  
 {  
 	 p u b l i c :  
 	 	 b o o l   _ _ d i s a b l e d ;   / /   w h e t h e r   o r   n o t   t h e   b l o c k   i s   d i s a b l e d  
  
 	 	 s t r i n g   _ _ b l o c k _ u s e r _ n u m b e r ;  
                 i n t   _ _ b l o c k _ n u m b e r ;  
 	 	 i n t   _ _ b l o c k _ w a i t i n g ;  
 	 	 i n t   _ _ p a r e n t _ n u m b e r ;  
 	 	 i n t   _ _ i n b o u n d _ b l o c k s [ ] ;  
 	 	 i n t   _ _ o u t b o u n d _ b l o c k s [ ] ;  
  
 	 	 v o i d   _ _ a d d I n b o u n d B l o c k ( i n t   i d   =   0 )   {  
 	 	 	 i n t   s i z e   =   A r r a y S i z e ( _ _ i n b o u n d _ b l o c k s ) ;  
 	 	 	 f o r   ( i n t   i   =   0 ;   i   <   s i z e ;   i + + )   {  
 	 	 	 	 i f   ( _ _ i n b o u n d _ b l o c k s [ i ]   = =   i d )   {  
 	 	 	 	 	 r e t u r n ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 A r r a y R e s i z e ( _ _ i n b o u n d _ b l o c k s ,   s i z e   +   1 ) ;  
 	 	 	 _ _ i n b o u n d _ b l o c k s [ s i z e ]   =   i d ;  
 	 	 }  
  
 	 	 v o i d   B l o c k C a l l s ( )   {  
 	 	 	 _ _ d i s a b l e d                     =   f a l s e ;  
 	 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " " ;  
 	 	 	 _ _ b l o c k _ n u m b e r             =   0 ;  
 	 	 	 _ _ b l o c k _ w a i t i n g           =   0 ;  
 	 	 	 _ _ p a r e n t _ n u m b e r           =   0 ;  
 	 	 }  
  
 	 	 / * *  
 	 	       A n n o u n c e   t h i s   b l o c k   t o   t h e   l i s t   o f   i n b o u n d   c o n n e c t i o n s   o f   a l l   t h e   b l o c k s   t o   w h i c h   t h i s   b l o c k   i s   c o n n e c t e d   t o  
 	 	       * /  
 	 	 v o i d   _ _ a n n o u n c e T h i s B l o c k ( )  
 	 	 {  
 	 	       / /   a d d   t h e   c u r r e n t   b l o c k   n u m b e r   t o   t h e   l i s t   o f   i n b o u n d   b l o c k s  
 	 	       / /   f o r   e a c h   o u t b o u n d   b l o c k   t h a t   i s   p r o v i d e d  
 	 	 	 f o r   ( i n t   i   =   0 ;   i   <   A r r a y S i z e ( _ _ o u t b o u n d _ b l o c k s ) ;   i + + )  
 	 	 	 {  
 	 	 	 	 i n t   b l o c k   =   _ _ o u t b o u n d _ b l o c k s [ i ] ;   / /   o u t b o u n d   b l o c k   n u m b e r  
 	 	 	 	 i n t   s i z e     =   A r r a y S i z e ( _ b l o c k s _ [ b l o c k ] . _ _ i n b o u n d _ b l o c k s ) ;   / /   t h e   s i z e   o f   i t s   i n b o u n d   l i s t  
  
 	 	 	 	 / /   s k i p   i f   t h e   c u r r e n t   b l o c k   w a s   a l r e a d y   a d d e d  
 	 	 	 	 f o r   ( i n t   j   =   0 ;   j   <   s i z e ;   j + + )   {  
 	 	 	 	 	 i f   ( _ b l o c k s _ [ b l o c k ] . _ _ i n b o u n d _ b l o c k s [ j ]   = =   _ _ b l o c k _ n u m b e r )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 r e t u r n ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
  
 	 	 	 	 / /   a d d   t h e   c u r r e n t   b l o c k   n u m b e r   t o   t h e   l i s t   o f   i n b o u n d   b l o c k s   o f   t h e   o t h e r   b l o c k  
 	 	 	 	 A r r a y R e s i z e ( _ b l o c k s _ [ b l o c k ] . _ _ i n b o u n d _ b l o c k s ,   s i z e   +   1 ) ;  
 	 	 	 	 _ b l o c k s _ [ b l o c k ] . _ _ i n b o u n d _ b l o c k s [ s i z e ]   =   _ _ b l o c k _ n u m b e r ;  
 	 	 	 }  
 	 	 }  
  
 	 	 / /   t h i s   i s   h e r e ,   b e c a u s e   i t   i s   u s e d   i n   t h e   " r u n "   f u n c t i o n  
 	 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )   =   0 ;  
  
 	 	 / * *  
 	 	 	 I n   t h e   d e r i v e d   c l a s s   t h i s   m e t h o d   s h o u l d   b e   u s e d   t o   s e t   d y n a m i c   p a r a m e t e r s   o r   o t h e r   s t u f f   b e f o r e   t h e   m a i n   e x e c u t e .  
 	 	 	 T h i s   m e t h o d   i s   a u t o m a t i c a l l y   c a l l e d   w i t h i n   t h e   m a i n   " r u n "   m e t h o d   b e l o w ,   b e f o r e   t h e   e x e c u t i o n   o f   t h e   m a i n   c l a s s .  
 	 	 	 * /  
 	 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )   { r e t u r n ; } ;  
 	 	 b o o l   _ b e f o r e E x e c u t e E n a b l e d ;   / /   f o r   s p e e d  
  
 	 	 / * *  
 	 	 	 S a m e   a s   _ b e f o r e E x e c u t e _ ,   b u t   t o   w o r k   a f t e r   t h e   e x e c u t e   m e t h o d .  
 	 	 	 * /  
 	 	 v i r t u a l   v o i d   _ a f t e r E x e c u t e _ ( )   { r e t u r n ; } ;  
 	 	 b o o l   _ a f t e r E x e c u t e E n a b l e d ;   / /   f o r   s p e e d  
  
 	 	 / * *  
 	 	 	 T h i s   i s   t h e   m e t h o d   t h a t   i s   u s e d   t o   r u n   t h e   b l o c k  
 	 	 	 * /  
 	 	 v i r t u a l   v o i d   r u n ( i n t   _ p a r e n t _ = 0 )   {  
 	 	 	 _ _ p a r e n t _ n u m b e r   =   _ p a r e n t _ ;  
 	 	 	 i f   ( _ _ d i s a b l e d   | |   F X D _ B R E A K )   { r e t u r n ; }  
 	 	 	 F X D _ C U R R E N T _ F U N C T I O N _ I D   =   _ _ b l o c k _ n u m b e r ;  
  
 	 	 	 i f   ( _ b e f o r e E x e c u t e E n a b l e d )   { _ b e f o r e E x e c u t e _ ( ) ; }  
 	 	 	 _ e x e c u t e _ ( ) ;  
 	 	 	 i f   ( _ a f t e r E x e c u t e E n a b l e d )   { _ a f t e r E x e c u t e _ ( ) ; }  
  
 	 	 	 i f   ( _ _ b l o c k _ w a i t i n g   & &   F X D _ C U R R E N T _ F U N C T I O N _ I D   = =   _ _ b l o c k _ n u m b e r )   { f x d W a i t . A c c u m u l a t e ( F X D _ C U R R E N T _ F U N C T I O N _ I D ) ; }  
 	 	 }  
 } ;  
  
 B l o c k C a l l s   * _ b l o c k s _ [ ] ;  
  
  
 / /   " C o n d i t i o n "   m o d e l  
 t e m p l a t e < t y p e n a m e   T 1 , t y p e n a m e   _ T 1 _ , t y p e n a m e   T 2 , t y p e n a m e   T 3 , t y p e n a m e   _ T 3 _ , t y p e n a m e   T 4 >  
 c l a s s   M D L _ C o n d i t i o n :   p u b l i c   B l o c k C a l l s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 T 1   L o ;   v i r t u a l   _ T 1 _   _ L o _ ( ) { r e t u r n ( _ T 1 _ ) 0 ; }  
 	 T 2   c o m p a r e ;  
 	 T 3   R o ;   v i r t u a l   _ T 3 _   _ R o _ ( ) { r e t u r n ( _ T 3 _ ) 0 ; }  
 	 T 4   c r o s s w i d t h ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L _ C o n d i t i o n ( )  
 	 {  
 	 	 c o m p a r e   =   ( s t r i n g ) " > " ;  
 	 	 c r o s s w i d t h   =   ( i n t ) 1 ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )  
 	 {  
 	 	 b o o l   o u t p u t 1   =   f a l s e ,   o u t p u t 2   =   f a l s e ;   / /   o u t p u t   1   a n d   o u t p u t   2  
 	 	 i n t   c r o s s o v e r   =   0 ;  
 	 	  
 	 	 i f   ( c o m p a r e   = =   " x > "   | |   c o m p a r e   = =   " x < " )   { c r o s s o v e r   =   1 ; }  
 	 	  
 	 	 f o r   ( i n t   i   =   0 ;   i   < =   c r o s s o v e r ;   i + + )  
 	 	 {  
 	 	 	 / /   i = 0   -   n o r m a l   p a s s ,   i = 1   -   c r o s s o v e r   p a s s  
 	 	  
 	 	 	 / /   L e f t   o p e r a n d   o f   t h e   c o n d i t i o n  
 	 	 	 F X D _ M O R E _ S H I F T   =   i   *   c r o s s w i d t h ;  
 	 	 	 _ T 1 _   l o   =   _ L o _ ( ) ;  
 	 	 	 i f   ( M a t h A b s ( l o )   = =   E M P T Y _ V A L U E )   { r e t u r n ; }  
 	 	  
 	 	 	 / /   R i g h t   o p e r a n d   o f   t h e   c o n d i t i o n  
 	 	 	 F X D _ M O R E _ S H I F T   =   i   *   c r o s s w i d t h ;  
 	 	 	 _ T 3 _   r o   =   _ R o _ ( ) ;  
 	 	 	 i f   ( M a t h A b s ( r o )   = =   E M P T Y _ V A L U E )   { r e t u r n ; }  
 	 	  
 	 	 	 / /   C o n d i t i o n s  
 	 	 	 i f   ( C o m p a r e V a l u e s ( c o m p a r e ,   l o ,   r o ) )  
 	 	 	 {  
 	 	 	 	 i f   ( i   = =   0 )  
 	 	 	 	 {  
 	 	 	 	 	 o u t p u t 1   =   t r u e ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 i f   ( i   = =   0 )  
 	 	 	 	 {  
 	 	 	 	 	 o u t p u t 2   =   t r u e ;  
 	 	 	 	 }  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 o u t p u t 2   =   f a l s e ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	  
 	 	 	 i f   ( c r o s s o v e r   = =   1 )  
 	 	 	 {  
 	 	 	 	 i f   ( C o m p a r e V a l u e s ( c o m p a r e ,   r o ,   l o ) )  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( i   = =   0 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 o u t p u t 2   =   t r u e ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( i   = =   1 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 o u t p u t 1   =   f a l s e ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	 F X D _ M O R E _ S H I F T   =   0 ;   / /   r e s e t  
 	 	  
 	 	 	     i f   ( o u t p u t 1   = =   t r u e )   { _ c a l l b a c k _ ( 1 ) ; }  
 	 	 e l s e   i f   ( o u t p u t 2   = =   t r u e )   { _ c a l l b a c k _ ( 0 ) ; }  
 	 }  
 } ;  
  
 / /   " N o   t r a d e "   m o d e l  
 t e m p l a t e < t y p e n a m e   T 1 , t y p e n a m e   T 2 , t y p e n a m e   T 3 , t y p e n a m e   T 4 , t y p e n a m e   T 5 >  
 c l a s s   M D L _ N o O p e n e d O r d e r s :   p u b l i c   B l o c k C a l l s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 T 1   G r o u p M o d e ;  
 	 T 2   G r o u p ;  
 	 T 3   S y m b o l M o d e ;  
 	 T 4   S y m b o l ;  
 	 T 5   B u y s O r S e l l s ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L _ N o O p e n e d O r d e r s ( )  
 	 {  
 	 	 G r o u p M o d e   =   ( s t r i n g ) " g r o u p " ;  
 	 	 G r o u p   =   ( s t r i n g ) " " ;  
 	 	 S y m b o l M o d e   =   ( s t r i n g ) " s y m b o l " ;  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 B u y s O r S e l l s   =   ( s t r i n g ) " b o t h " ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )  
 	 {  
 	 	 b o o l   e x i s t   =   f a l s e ;  
 	 	  
 	 	 f o r   ( i n t   i n d e x   =   T r a d e s T o t a l ( ) - 1 ;   i n d e x   > =   0 ;   i n d e x - - )  
 	 	 {  
 	 	 	 i f   ( T r a d e S e l e c t B y I n d e x ( i n d e x ,   G r o u p M o d e ,   G r o u p ,   S y m b o l M o d e ,   S y m b o l ,   B u y s O r S e l l s ) )  
 	 	 	 {  
 	 	 	 	 e x i s t   =   t r u e ;  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	 i f   ( e x i s t   = =   f a l s e )   { _ c a l l b a c k _ ( 1 ) ; }   e l s e   { _ c a l l b a c k _ ( 0 ) ; }  
 	 }  
 } ;  
  
 / /   " C l o s e   t r a d e s "   m o d e l  
 t e m p l a t e < t y p e n a m e   T 1 , t y p e n a m e   T 2 , t y p e n a m e   T 3 , t y p e n a m e   T 4 , t y p e n a m e   T 5 , t y p e n a m e   T 6 , t y p e n a m e   T 7 , t y p e n a m e   T 8 >  
 c l a s s   M D L _ C l o s e O p e n e d :   p u b l i c   B l o c k C a l l s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 T 1   G r o u p M o d e ;  
 	 T 2   G r o u p ;  
 	 T 3   S y m b o l M o d e ;  
 	 T 4   S y m b o l ;  
 	 T 5   B u y s O r S e l l s ;  
 	 T 6   O r d e r M i n u t e s ;  
 	 T 7   S l i p p a g e ;  
 	 T 8   A r r o w C o l o r ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L _ C l o s e O p e n e d ( )  
 	 {  
 	 	 G r o u p M o d e   =   ( s t r i n g ) " g r o u p " ;  
 	 	 G r o u p   =   ( s t r i n g ) " " ;  
 	 	 S y m b o l M o d e   =   ( s t r i n g ) " s y m b o l " ;  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 B u y s O r S e l l s   =   ( s t r i n g ) " b o t h " ;  
 	 	 O r d e r M i n u t e s   =   ( i n t ) 0 ;  
 	 	 S l i p p a g e   =   ( u l o n g ) 4 ;  
 	 	 A r r o w C o l o r   =   ( c o l o r ) c l r D e e p P i n k ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )  
 	 {  
 	 	 i n t   c l o s e d _ c o u n t   =   0 ;  
 	 	 b o o l   f i n i s h e d         =   f a l s e ;  
 	 	  
 	 	 w h i l e   ( f i n i s h e d   = =   f a l s e )  
 	 	 {  
 	 	 	 i n t   c o u n t   =   0 ;  
 	 	  
 	 	 	 f o r   ( i n t   i n d e x   =   T r a d e s T o t a l ( ) - 1 ;   i n d e x   > =   0 ;   i n d e x - - )  
 	 	 	 {  
 	 	 	 	 i f   ( T r a d e S e l e c t B y I n d e x ( i n d e x ,   G r o u p M o d e ,   G r o u p ,   S y m b o l M o d e ,   S y m b o l ,   B u y s O r S e l l s ) )  
 	 	 	 	 {  
 	 	 	 	 	 d a t e t i m e   t i m e _ d i f f   =   T i m e C u r r e n t ( )   -   O r d e r O p e n T i m e ( ) ;  
 	 	  
 	 	 	 	 	 i f   ( t i m e _ d i f f   <   0 )   { t i m e _ d i f f   =   0 ; }   / /   t h i s   a c t u a l l y   h a p p e n s   s o m e t i m e s  
 	 	  
 	 	 	 	 	 i f   ( t i m e _ d i f f   > =   6 0   *   O r d e r M i n u t e s )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 i f   ( C l o s e T r a d e ( O r d e r T i c k e t ( ) ,   S l i p p a g e ,   A r r o w C o l o r ) )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 c l o s e d _ c o u n t + + ;  
 	 	 	 	 	 	 }  
 	 	  
 	 	 	 	 	 	 c o u n t + + ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	  
 	 	 	 i f   ( c o u n t   = =   0 )   { f i n i s h e d   =   t r u e ; }  
 	 	 }  
 	 	  
 	 	 _ c a l l b a c k _ ( 1 ) ;  
 	 }  
 } ;  
  
 / /   " B u y   n o w "   m o d e l  
 t e m p l a t e < t y p e n a m e   T 1 , t y p e n a m e   T 2 , t y p e n a m e   T 3 , t y p e n a m e   T 4 , t y p e n a m e   T 5 , t y p e n a m e   T 6 , t y p e n a m e   T 7 , t y p e n a m e   T 8 , t y p e n a m e   T 9 , t y p e n a m e   _ T 9 _ , t y p e n a m e   T 1 0 , t y p e n a m e   T 1 1 , t y p e n a m e   T 1 2 , t y p e n a m e   T 1 3 , t y p e n a m e   T 1 4 , t y p e n a m e   T 1 5 , t y p e n a m e   T 1 6 , t y p e n a m e   T 1 7 , t y p e n a m e   T 1 8 , t y p e n a m e   T 1 9 , t y p e n a m e   T 2 0 , t y p e n a m e   T 2 1 , t y p e n a m e   T 2 2 , t y p e n a m e   T 2 3 , t y p e n a m e   T 2 4 , t y p e n a m e   T 2 5 , t y p e n a m e   T 2 6 , t y p e n a m e   T 2 7 , t y p e n a m e   T 2 8 , t y p e n a m e   T 2 9 , t y p e n a m e   T 3 0 , t y p e n a m e   T 3 1 , t y p e n a m e   T 3 2 , t y p e n a m e   T 3 3 , t y p e n a m e   T 3 4 , t y p e n a m e   T 3 5 , t y p e n a m e   T 3 6 , t y p e n a m e   _ T 3 6 _ , t y p e n a m e   T 3 7 , t y p e n a m e   _ T 3 7 _ , t y p e n a m e   T 3 8 , t y p e n a m e   _ T 3 8 _ , t y p e n a m e   T 3 9 , t y p e n a m e   T 4 0 , t y p e n a m e   T 4 1 , t y p e n a m e   T 4 2 , t y p e n a m e   T 4 3 , t y p e n a m e   _ T 4 3 _ , t y p e n a m e   T 4 4 , t y p e n a m e   _ T 4 4 _ , t y p e n a m e   T 4 5 , t y p e n a m e   _ T 4 5 _ , t y p e n a m e   T 4 6 , t y p e n a m e   T 4 7 , t y p e n a m e   T 4 8 , t y p e n a m e   T 4 9 , t y p e n a m e   T 5 0 , t y p e n a m e   _ T 5 0 _ , t y p e n a m e   T 5 1 , t y p e n a m e   T 5 2 , t y p e n a m e   T 5 3 >  
 c l a s s   M D L _ B u y N o w :   p u b l i c   B l o c k C a l l s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 T 1   G r o u p ;  
 	 T 2   S y m b o l ;  
 	 T 3   V o l u m e M o d e ;  
 	 T 4   V o l u m e S i z e ;  
 	 T 5   V o l u m e S i z e R i s k ;  
 	 T 6   V o l u m e R i s k ;  
 	 T 7   V o l u m e P e r c e n t ;  
 	 T 8   V o l u m e B l o c k P e r c e n t ;  
 	 T 9   d V o l u m e S i z e ;   v i r t u a l   _ T 9 _   _ d V o l u m e S i z e _ ( ) { r e t u r n ( _ T 9 _ ) 0 ; }  
 	 T 1 0   F i x e d R a t i o U n i t S i z e ;  
 	 T 1 1   F i x e d R a t i o D e l t a ;  
 	 T 1 2   m m M g I n i t i a l L o t s ;  
 	 T 1 3   m m M g M u l t i p l y O n L o s s ;  
 	 T 1 4   m m M g M u l t i p l y O n P r o f i t ;  
 	 T 1 5   m m M g A d d L o t s O n L o s s ;  
 	 T 1 6   m m M g A d d L o t s O n P r o f i t ;  
 	 T 1 7   m m M g R e s e t O n L o s s ;  
 	 T 1 8   m m M g R e s e t O n P r o f i t ;  
 	 T 1 9   m m 1 3 2 6 I n i t i a l L o t s ;  
 	 T 2 0   m m 1 3 2 6 R e v e r s e ;  
 	 T 2 1   m m F i b o I n i t i a l L o t s ;  
 	 T 2 2   m m D a l e m b e r t I n i t i a l L o t s ;  
 	 T 2 3   m m D a l e m b e r t R e v e r s e ;  
 	 T 2 4   m m L a b o u c h e r e I n i t i a l L o t s ;  
 	 T 2 5   m m L a b o u c h e r e L i s t ;  
 	 T 2 6   m m L a b o u c h e r e R e v e r s e ;  
 	 T 2 7   m m S e q B a s e L o t s ;  
 	 T 2 8   m m S e q O n L o s s ;  
 	 T 2 9   m m S e q O n P r o f i t ;  
 	 T 3 0   m m S e q R e v e r s e ;  
 	 T 3 1   V o l u m e U p p e r L i m i t ;  
 	 T 3 2   S t o p L o s s M o d e ;  
 	 T 3 3   S t o p L o s s P i p s ;  
 	 T 3 4   S t o p L o s s P e r c e n t P r i c e ;  
 	 T 3 5   S t o p L o s s P e r c e n t T P ;  
 	 T 3 6   d l S t o p L o s s ;   v i r t u a l   _ T 3 6 _   _ d l S t o p L o s s _ ( ) { r e t u r n ( _ T 3 6 _ ) 0 ; }  
 	 T 3 7   d p S t o p L o s s ;   v i r t u a l   _ T 3 7 _   _ d p S t o p L o s s _ ( ) { r e t u r n ( _ T 3 7 _ ) 0 ; }  
 	 T 3 8   d d S t o p L o s s ;   v i r t u a l   _ T 3 8 _   _ d d S t o p L o s s _ ( ) { r e t u r n ( _ T 3 8 _ ) 0 ; }  
 	 T 3 9   T a k e P r o f i t M o d e ;  
 	 T 4 0   T a k e P r o f i t P i p s ;  
 	 T 4 1   T a k e P r o f i t P e r c e n t P r i c e ;  
 	 T 4 2   T a k e P r o f i t P e r c e n t S L ;  
 	 T 4 3   d l T a k e P r o f i t ;   v i r t u a l   _ T 4 3 _   _ d l T a k e P r o f i t _ ( ) { r e t u r n ( _ T 4 3 _ ) 0 ; }  
 	 T 4 4   d p T a k e P r o f i t ;   v i r t u a l   _ T 4 4 _   _ d p T a k e P r o f i t _ ( ) { r e t u r n ( _ T 4 4 _ ) 0 ; }  
 	 T 4 5   d d T a k e P r o f i t ;   v i r t u a l   _ T 4 5 _   _ d d T a k e P r o f i t _ ( ) { r e t u r n ( _ T 4 5 _ ) 0 ; }  
 	 T 4 6   E x p M o d e ;  
 	 T 4 7   E x p D a y s ;  
 	 T 4 8   E x p H o u r s ;  
 	 T 4 9   E x p M i n u t e s ;  
 	 T 5 0   d E x p ;   v i r t u a l   _ T 5 0 _   _ d E x p _ ( ) { r e t u r n ( _ T 5 0 _ ) 0 ; }  
 	 T 5 1   S l i p p a g e ;  
 	 T 5 2   M y C o m m e n t ;  
 	 T 5 3   A r r o w C o l o r B u y ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L _ B u y N o w ( )  
 	 {  
 	 	 G r o u p   =   ( s t r i n g ) " " ;  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 V o l u m e M o d e   =   ( s t r i n g ) " f i x e d " ;  
 	 	 V o l u m e S i z e   =   ( d o u b l e ) 0 . 1 ;  
 	 	 V o l u m e S i z e R i s k   =   ( d o u b l e ) 5 0 . 0 ;  
 	 	 V o l u m e R i s k   =   ( d o u b l e ) 2 . 5 ;  
 	 	 V o l u m e P e r c e n t   =   ( d o u b l e ) 1 0 0 . 0 ;  
 	 	 V o l u m e B l o c k P e r c e n t   =   ( d o u b l e ) 3 . 0 ;  
 	 	 F i x e d R a t i o U n i t S i z e   =   ( d o u b l e ) 0 . 0 1 ;  
 	 	 F i x e d R a t i o D e l t a   =   ( d o u b l e ) 2 0 . 0 ;  
 	 	 m m M g I n i t i a l L o t s   =   ( d o u b l e ) 0 . 1 ;  
 	 	 m m M g M u l t i p l y O n L o s s   =   ( d o u b l e ) 2 . 0 ;  
 	 	 m m M g M u l t i p l y O n P r o f i t   =   ( d o u b l e ) 1 . 0 ;  
 	 	 m m M g A d d L o t s O n L o s s   =   ( d o u b l e ) 0 . 0 ;  
 	 	 m m M g A d d L o t s O n P r o f i t   =   ( d o u b l e ) 0 . 0 ;  
 	 	 m m M g R e s e t O n L o s s   =   ( i n t ) 0 ;  
 	 	 m m M g R e s e t O n P r o f i t   =   ( i n t ) 1 ;  
 	 	 m m 1 3 2 6 I n i t i a l L o t s   =   ( d o u b l e ) 0 . 1 ;  
 	 	 m m 1 3 2 6 R e v e r s e   =   ( b o o l ) f a l s e ;  
 	 	 m m F i b o I n i t i a l L o t s   =   ( d o u b l e ) 0 . 1 ;  
 	 	 m m D a l e m b e r t I n i t i a l L o t s   =   ( d o u b l e ) 0 . 1 ;  
 	 	 m m D a l e m b e r t R e v e r s e   =   ( b o o l ) f a l s e ;  
 	 	 m m L a b o u c h e r e I n i t i a l L o t s   =   ( d o u b l e ) 0 . 1 ;  
 	 	 m m L a b o u c h e r e L i s t   =   ( s t r i n g ) " 1 , 2 , 3 , 4 , 5 , 6 " ;  
 	 	 m m L a b o u c h e r e R e v e r s e   =   ( b o o l ) f a l s e ;  
 	 	 m m S e q B a s e L o t s   =   ( d o u b l e ) 0 . 1 ;  
 	 	 m m S e q O n L o s s   =   ( s t r i n g ) " 3 , 2 , 6 " ;  
 	 	 m m S e q O n P r o f i t   =   ( s t r i n g ) " 1 " ;  
 	 	 m m S e q R e v e r s e   =   ( b o o l ) f a l s e ;  
 	 	 V o l u m e U p p e r L i m i t   =   ( d o u b l e ) 0 . 0 ;  
 	 	 S t o p L o s s M o d e   =   ( s t r i n g ) " f i x e d " ;  
 	 	 S t o p L o s s P i p s   =   ( d o u b l e ) 5 0 . 0 ;  
 	 	 S t o p L o s s P e r c e n t P r i c e   =   ( d o u b l e ) 0 . 5 5 ;  
 	 	 S t o p L o s s P e r c e n t T P   =   ( d o u b l e ) 1 0 0 . 0 ;  
 	 	 T a k e P r o f i t M o d e   =   ( s t r i n g ) " f i x e d " ;  
 	 	 T a k e P r o f i t P i p s   =   ( d o u b l e ) 5 0 . 0 ;  
 	 	 T a k e P r o f i t P e r c e n t P r i c e   =   ( d o u b l e ) 0 . 5 5 ;  
 	 	 T a k e P r o f i t P e r c e n t S L   =   ( d o u b l e ) 1 0 0 . 0 ;  
 	 	 E x p M o d e   =   ( s t r i n g ) " G T C " ;  
 	 	 E x p D a y s   =   ( i n t ) 0 ;  
 	 	 E x p H o u r s   =   ( i n t ) 1 ;  
 	 	 E x p M i n u t e s   =   ( i n t ) 0 ;  
 	 	 S l i p p a g e   =   ( u l o n g ) 4 ;  
 	 	 M y C o m m e n t   =   ( s t r i n g ) " " ;  
 	 	 A r r o w C o l o r B u y   =   ( c o l o r ) c l r B l u e ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )  
 	 {  
 	 	 / / - -   s t o p s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 d o u b l e   s l l   =   0 ,   s l p   =   0 ,   t p l   =   0 ,   t p p   =   0 ;  
 	 	  
 	 	           i f   ( S t o p L o s s M o d e   = =   " f i x e d " )                   { s l p   =   S t o p L o s s P i p s ; }  
 	 	 e l s e   i f   ( S t o p L o s s M o d e   = =   " d y n a m i c P i p s " )       { s l p   =   _ d p S t o p L o s s _ ( ) ; }  
 	 	 e l s e   i f   ( S t o p L o s s M o d e   = =   " d y n a m i c D i g i t s " )   { s l p   =   t o P i p s ( _ d d S t o p L o s s _ ( ) , S y m b o l ) ; }  
 	 	 e l s e   i f   ( S t o p L o s s M o d e   = =   " d y n a m i c L e v e l " )     { s l l   =   _ d l S t o p L o s s _ ( ) ; }  
 	 	 e l s e   i f   ( S t o p L o s s M o d e   = =   " p e r c e n t P r i c e " )     { s l l   =   S y m b o l A s k ( S y m b o l )   -   ( S y m b o l A s k ( S y m b o l )   *   S t o p L o s s P e r c e n t P r i c e   /   1 0 0 ) ; }  
 	 	  
 	 	           i f   ( T a k e P r o f i t M o d e   = =   " f i x e d " )                   { t p p   =   T a k e P r o f i t P i p s ; }  
 	 	 e l s e   i f   ( T a k e P r o f i t M o d e   = =   " d y n a m i c P i p s " )       { t p p   =   _ d p T a k e P r o f i t _ ( ) ; }  
 	 	 e l s e   i f   ( T a k e P r o f i t M o d e   = =   " d y n a m i c D i g i t s " )   { t p p   =   t o P i p s ( _ d d T a k e P r o f i t _ ( ) , S y m b o l ) ; }  
 	 	 e l s e   i f   ( T a k e P r o f i t M o d e   = =   " d y n a m i c L e v e l " )     { t p l   =   _ d l T a k e P r o f i t _ ( ) ; }  
 	 	 e l s e   i f   ( T a k e P r o f i t M o d e   = =   " p e r c e n t P r i c e " )     { t p l   =   S y m b o l A s k ( S y m b o l )   +   ( S y m b o l A s k ( S y m b o l )   *   T a k e P r o f i t P e r c e n t P r i c e   /   1 0 0 ) ; }  
 	 	  
 	 	 i f   ( S t o p L o s s M o d e   = =   " p e r c e n t T P " )   {  
 	 	       i f   ( t p p   >   0 )   { s l p   =   t p p * S t o p L o s s P e r c e n t T P / 1 0 0 ; }  
 	 	       i f   ( t p l   >   0 )   { s l p   =   t o P i p s ( M a t h A b s ( S y m b o l A s k ( S y m b o l )   -   t p l ) ,   S y m b o l ) * S t o p L o s s P e r c e n t T P / 1 0 0 ; }  
 	 	 }  
 	 	 i f   ( T a k e P r o f i t M o d e   = =   " p e r c e n t S L " )   {  
 	 	       i f   ( s l p   >   0 )   { t p p   =   s l p * T a k e P r o f i t P e r c e n t S L / 1 0 0 ; }  
 	 	       i f   ( s l l   >   0 )   { t p p   =   t o P i p s ( M a t h A b s ( S y m b o l A s k ( S y m b o l )   -   s l l ) ,   S y m b o l ) * T a k e P r o f i t P e r c e n t S L / 1 0 0 ; }  
 	 	 }  
 	 	  
 	 	 / / - -   l o t s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 d o u b l e   l o t s   =   0 ;  
 	 	 d o u b l e   p r e _ s l l   =   s l l ;  
 	 	  
 	 	 i f   ( p r e _ s l l   = =   0 )   {  
 	 	 	 p r e _ s l l   =   S y m b o l A s k ( S y m b o l ) ;  
 	 	 }  
 	 	  
 	 	 d o u b l e   p r e _ s l _ p i p s   =   t o P i p s ( S y m b o l A s k ( S y m b o l ) - ( p r e _ s l l - t o D i g i t s ( s l p , S y m b o l ) ) ,   S y m b o l ) ;  
 	 	  
 	 	           i f   ( V o l u m e M o d e   = =   " f i x e d " )                         { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e S i z e ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " b l o c k - e q u i t y " )           { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e B l o c k P e r c e n t ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " b l o c k - b a l a n c e " )         { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e B l o c k P e r c e n t ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " b l o c k - f r e e m a r g i n " )   { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e B l o c k P e r c e n t ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " e q u i t y " )                       { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e P e r c e n t ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " b a l a n c e " )                     { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e P e r c e n t ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " f r e e m a r g i n " )               { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e P e r c e n t ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " e q u i t y R i s k " )               { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e R i s k ,   p r e _ s l _ p i p s ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " b a l a n c e R i s k " )             { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e R i s k ,   p r e _ s l _ p i p s ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " f r e e m a r g i n R i s k " )       { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e R i s k ,   p r e _ s l _ p i p s ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " f i x e d R i s k " )                 { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e S i z e R i s k ,   p r e _ s l _ p i p s ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " f i x e d R a t i o " )               { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   F i x e d R a t i o U n i t S i z e ,   F i x e d R a t i o D e l t a ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " d y n a m i c " )                     { l o t s   =   _ d V o l u m e S i z e _ ( ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " 1 3 2 6 " )                           { l o t s   =   B e t 1 3 2 6 ( G r o u p ,   S y m b o l ,   m m 1 3 2 6 I n i t i a l L o t s ,   m m 1 3 2 6 R e v e r s e ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " f i b o n a c c i " )                 { l o t s   =   B e t F i b o n a c c i ( G r o u p ,   S y m b o l ,   m m F i b o I n i t i a l L o t s ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " d a l e m b e r t " )                 { l o t s   =   B e t D a l e m b e r t ( G r o u p ,   S y m b o l ,   m m D a l e m b e r t I n i t i a l L o t s ,   m m D a l e m b e r t R e v e r s e ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " l a b o u c h e r e " )               { l o t s   =   B e t L a b o u c h e r e ( G r o u p ,   S y m b o l ,   m m L a b o u c h e r e I n i t i a l L o t s ,   m m L a b o u c h e r e L i s t ,   m m L a b o u c h e r e R e v e r s e ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " m a r t i n g a l e " )               { l o t s   =   B e t M a r t i n g a l e ( G r o u p ,   S y m b o l ,   m m M g I n i t i a l L o t s ,   m m M g M u l t i p l y O n L o s s ,   m m M g M u l t i p l y O n P r o f i t ,   m m M g A d d L o t s O n L o s s ,   m m M g A d d L o t s O n P r o f i t ,   m m M g R e s e t O n L o s s ,   m m M g R e s e t O n P r o f i t ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " s e q u e n c e " )                   { l o t s   =   B e t S e q u e n c e ( G r o u p ,   S y m b o l ,   m m S e q B a s e L o t s ,   m m S e q O n L o s s ,   m m S e q O n P r o f i t ,   m m S e q R e v e r s e ) ; }  
 	 	  
 	 	 l o t s   =   A l i g n L o t s ( S y m b o l ,   l o t s ,   0 ,   V o l u m e U p p e r L i m i t ) ;  
 	 	  
 	 	 d a t e t i m e   e x p   =   E x p i r a t i o n T i m e ( E x p M o d e , E x p D a y s , E x p H o u r s , E x p M i n u t e s , _ d E x p _ ( ) ) ;  
 	 	  
 	 	 / / - -   s e n d   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 l o n g   t i c k e t   =   B u y N o w ( S y m b o l ,   l o t s ,   s l l ,   t p l ,   s l p ,   t p p ,   S l i p p a g e ,   ( M a g i c S t a r t + ( i n t ) G r o u p ) ,   M y C o m m e n t ,   A r r o w C o l o r B u y ,   e x p ) ;  
 	 	  
 	 	 i f   ( t i c k e t   >   0 )   { _ c a l l b a c k _ ( 1 ) ; }   e l s e   { _ c a l l b a c k _ ( 0 ) ; }  
 	 }  
 } ;  
  
 / /   " S e l l   n o w "   m o d e l  
 t e m p l a t e < t y p e n a m e   T 1 , t y p e n a m e   T 2 , t y p e n a m e   T 3 , t y p e n a m e   T 4 , t y p e n a m e   T 5 , t y p e n a m e   T 6 , t y p e n a m e   T 7 , t y p e n a m e   T 8 , t y p e n a m e   T 9 , t y p e n a m e   _ T 9 _ , t y p e n a m e   T 1 0 , t y p e n a m e   T 1 1 , t y p e n a m e   T 1 2 , t y p e n a m e   T 1 3 , t y p e n a m e   T 1 4 , t y p e n a m e   T 1 5 , t y p e n a m e   T 1 6 , t y p e n a m e   T 1 7 , t y p e n a m e   T 1 8 , t y p e n a m e   T 1 9 , t y p e n a m e   T 2 0 , t y p e n a m e   T 2 1 , t y p e n a m e   T 2 2 , t y p e n a m e   T 2 3 , t y p e n a m e   T 2 4 , t y p e n a m e   T 2 5 , t y p e n a m e   T 2 6 , t y p e n a m e   T 2 7 , t y p e n a m e   T 2 8 , t y p e n a m e   T 2 9 , t y p e n a m e   T 3 0 , t y p e n a m e   T 3 1 , t y p e n a m e   T 3 2 , t y p e n a m e   T 3 3 , t y p e n a m e   T 3 4 , t y p e n a m e   T 3 5 , t y p e n a m e   T 3 6 , t y p e n a m e   _ T 3 6 _ , t y p e n a m e   T 3 7 , t y p e n a m e   _ T 3 7 _ , t y p e n a m e   T 3 8 , t y p e n a m e   _ T 3 8 _ , t y p e n a m e   T 3 9 , t y p e n a m e   T 4 0 , t y p e n a m e   T 4 1 , t y p e n a m e   T 4 2 , t y p e n a m e   T 4 3 , t y p e n a m e   _ T 4 3 _ , t y p e n a m e   T 4 4 , t y p e n a m e   _ T 4 4 _ , t y p e n a m e   T 4 5 , t y p e n a m e   _ T 4 5 _ , t y p e n a m e   T 4 6 , t y p e n a m e   T 4 7 , t y p e n a m e   T 4 8 , t y p e n a m e   T 4 9 , t y p e n a m e   T 5 0 , t y p e n a m e   _ T 5 0 _ , t y p e n a m e   T 5 1 , t y p e n a m e   T 5 2 , t y p e n a m e   T 5 3 >  
 c l a s s   M D L _ S e l l N o w :   p u b l i c   B l o c k C a l l s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 T 1   G r o u p ;  
 	 T 2   S y m b o l ;  
 	 T 3   V o l u m e M o d e ;  
 	 T 4   V o l u m e S i z e ;  
 	 T 5   V o l u m e S i z e R i s k ;  
 	 T 6   V o l u m e R i s k ;  
 	 T 7   V o l u m e P e r c e n t ;  
 	 T 8   V o l u m e B l o c k P e r c e n t ;  
 	 T 9   d V o l u m e S i z e ;   v i r t u a l   _ T 9 _   _ d V o l u m e S i z e _ ( ) { r e t u r n ( _ T 9 _ ) 0 ; }  
 	 T 1 0   F i x e d R a t i o U n i t S i z e ;  
 	 T 1 1   F i x e d R a t i o D e l t a ;  
 	 T 1 2   m m M g I n i t i a l L o t s ;  
 	 T 1 3   m m M g M u l t i p l y O n L o s s ;  
 	 T 1 4   m m M g M u l t i p l y O n P r o f i t ;  
 	 T 1 5   m m M g A d d L o t s O n L o s s ;  
 	 T 1 6   m m M g A d d L o t s O n P r o f i t ;  
 	 T 1 7   m m M g R e s e t O n L o s s ;  
 	 T 1 8   m m M g R e s e t O n P r o f i t ;  
 	 T 1 9   m m 1 3 2 6 I n i t i a l L o t s ;  
 	 T 2 0   m m 1 3 2 6 R e v e r s e ;  
 	 T 2 1   m m F i b o I n i t i a l L o t s ;  
 	 T 2 2   m m D a l e m b e r t I n i t i a l L o t s ;  
 	 T 2 3   m m D a l e m b e r t R e v e r s e ;  
 	 T 2 4   m m L a b o u c h e r e I n i t i a l L o t s ;  
 	 T 2 5   m m L a b o u c h e r e L i s t ;  
 	 T 2 6   m m L a b o u c h e r e R e v e r s e ;  
 	 T 2 7   m m S e q B a s e L o t s ;  
 	 T 2 8   m m S e q O n L o s s ;  
 	 T 2 9   m m S e q O n P r o f i t ;  
 	 T 3 0   m m S e q R e v e r s e ;  
 	 T 3 1   V o l u m e U p p e r L i m i t ;  
 	 T 3 2   S t o p L o s s M o d e ;  
 	 T 3 3   S t o p L o s s P i p s ;  
 	 T 3 4   S t o p L o s s P e r c e n t P r i c e ;  
 	 T 3 5   S t o p L o s s P e r c e n t T P ;  
 	 T 3 6   d l S t o p L o s s ;   v i r t u a l   _ T 3 6 _   _ d l S t o p L o s s _ ( ) { r e t u r n ( _ T 3 6 _ ) 0 ; }  
 	 T 3 7   d p S t o p L o s s ;   v i r t u a l   _ T 3 7 _   _ d p S t o p L o s s _ ( ) { r e t u r n ( _ T 3 7 _ ) 0 ; }  
 	 T 3 8   d d S t o p L o s s ;   v i r t u a l   _ T 3 8 _   _ d d S t o p L o s s _ ( ) { r e t u r n ( _ T 3 8 _ ) 0 ; }  
 	 T 3 9   T a k e P r o f i t M o d e ;  
 	 T 4 0   T a k e P r o f i t P i p s ;  
 	 T 4 1   T a k e P r o f i t P e r c e n t P r i c e ;  
 	 T 4 2   T a k e P r o f i t P e r c e n t S L ;  
 	 T 4 3   d l T a k e P r o f i t ;   v i r t u a l   _ T 4 3 _   _ d l T a k e P r o f i t _ ( ) { r e t u r n ( _ T 4 3 _ ) 0 ; }  
 	 T 4 4   d p T a k e P r o f i t ;   v i r t u a l   _ T 4 4 _   _ d p T a k e P r o f i t _ ( ) { r e t u r n ( _ T 4 4 _ ) 0 ; }  
 	 T 4 5   d d T a k e P r o f i t ;   v i r t u a l   _ T 4 5 _   _ d d T a k e P r o f i t _ ( ) { r e t u r n ( _ T 4 5 _ ) 0 ; }  
 	 T 4 6   E x p M o d e ;  
 	 T 4 7   E x p D a y s ;  
 	 T 4 8   E x p H o u r s ;  
 	 T 4 9   E x p M i n u t e s ;  
 	 T 5 0   d E x p ;   v i r t u a l   _ T 5 0 _   _ d E x p _ ( ) { r e t u r n ( _ T 5 0 _ ) 0 ; }  
 	 T 5 1   S l i p p a g e ;  
 	 T 5 2   M y C o m m e n t ;  
 	 T 5 3   A r r o w C o l o r S e l l ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L _ S e l l N o w ( )  
 	 {  
 	 	 G r o u p   =   ( s t r i n g ) " " ;  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 V o l u m e M o d e   =   ( s t r i n g ) " f i x e d " ;  
 	 	 V o l u m e S i z e   =   ( d o u b l e ) 0 . 1 ;  
 	 	 V o l u m e S i z e R i s k   =   ( d o u b l e ) 5 0 . 0 ;  
 	 	 V o l u m e R i s k   =   ( d o u b l e ) 2 . 5 ;  
 	 	 V o l u m e P e r c e n t   =   ( d o u b l e ) 1 0 0 . 0 ;  
 	 	 V o l u m e B l o c k P e r c e n t   =   ( d o u b l e ) 3 . 0 ;  
 	 	 F i x e d R a t i o U n i t S i z e   =   ( d o u b l e ) 0 . 0 1 ;  
 	 	 F i x e d R a t i o D e l t a   =   ( d o u b l e ) 2 0 . 0 ;  
 	 	 m m M g I n i t i a l L o t s   =   ( d o u b l e ) 0 . 1 ;  
 	 	 m m M g M u l t i p l y O n L o s s   =   ( d o u b l e ) 2 . 0 ;  
 	 	 m m M g M u l t i p l y O n P r o f i t   =   ( d o u b l e ) 1 . 0 ;  
 	 	 m m M g A d d L o t s O n L o s s   =   ( d o u b l e ) 0 . 0 ;  
 	 	 m m M g A d d L o t s O n P r o f i t   =   ( d o u b l e ) 0 . 0 ;  
 	 	 m m M g R e s e t O n L o s s   =   ( i n t ) 0 ;  
 	 	 m m M g R e s e t O n P r o f i t   =   ( i n t ) 1 ;  
 	 	 m m 1 3 2 6 I n i t i a l L o t s   =   ( d o u b l e ) 0 . 1 ;  
 	 	 m m 1 3 2 6 R e v e r s e   =   ( b o o l ) f a l s e ;  
 	 	 m m F i b o I n i t i a l L o t s   =   ( d o u b l e ) 0 . 1 ;  
 	 	 m m D a l e m b e r t I n i t i a l L o t s   =   ( d o u b l e ) 0 . 1 ;  
 	 	 m m D a l e m b e r t R e v e r s e   =   ( b o o l ) f a l s e ;  
 	 	 m m L a b o u c h e r e I n i t i a l L o t s   =   ( d o u b l e ) 0 . 1 ;  
 	 	 m m L a b o u c h e r e L i s t   =   ( s t r i n g ) " 1 , 2 , 3 , 4 , 5 , 6 " ;  
 	 	 m m L a b o u c h e r e R e v e r s e   =   ( b o o l ) f a l s e ;  
 	 	 m m S e q B a s e L o t s   =   ( d o u b l e ) 0 . 1 ;  
 	 	 m m S e q O n L o s s   =   ( s t r i n g ) " 3 , 2 , 6 " ;  
 	 	 m m S e q O n P r o f i t   =   ( s t r i n g ) " 1 " ;  
 	 	 m m S e q R e v e r s e   =   ( b o o l ) f a l s e ;  
 	 	 V o l u m e U p p e r L i m i t   =   ( d o u b l e ) 0 . 0 ;  
 	 	 S t o p L o s s M o d e   =   ( s t r i n g ) " f i x e d " ;  
 	 	 S t o p L o s s P i p s   =   ( d o u b l e ) 5 0 . 0 ;  
 	 	 S t o p L o s s P e r c e n t P r i c e   =   ( d o u b l e ) 0 . 5 5 ;  
 	 	 S t o p L o s s P e r c e n t T P   =   ( d o u b l e ) 1 0 0 . 0 ;  
 	 	 T a k e P r o f i t M o d e   =   ( s t r i n g ) " f i x e d " ;  
 	 	 T a k e P r o f i t P i p s   =   ( d o u b l e ) 5 0 . 0 ;  
 	 	 T a k e P r o f i t P e r c e n t P r i c e   =   ( d o u b l e ) 0 . 5 5 ;  
 	 	 T a k e P r o f i t P e r c e n t S L   =   ( d o u b l e ) 1 0 0 . 0 ;  
 	 	 E x p M o d e   =   ( s t r i n g ) " G T C " ;  
 	 	 E x p D a y s   =   ( i n t ) 0 ;  
 	 	 E x p H o u r s   =   ( i n t ) 1 ;  
 	 	 E x p M i n u t e s   =   ( i n t ) 0 ;  
 	 	 S l i p p a g e   =   ( u l o n g ) 4 ;  
 	 	 M y C o m m e n t   =   ( s t r i n g ) " " ;  
 	 	 A r r o w C o l o r S e l l   =   ( c o l o r ) c l r R e d ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )  
 	 {  
 	 	 / / - -   s t o p s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 d o u b l e   s l l   =   0 ,   s l p   =   0 ,   t p l   =   0 ,   t p p   =   0 ;  
 	 	  
 	 	           i f   ( S t o p L o s s M o d e   = =   " f i x e d " )                   { s l p   =   S t o p L o s s P i p s ; }  
 	 	 e l s e   i f   ( S t o p L o s s M o d e   = =   " d y n a m i c P i p s " )       { s l p   =   _ d p S t o p L o s s _ ( ) ; }  
 	 	 e l s e   i f   ( S t o p L o s s M o d e   = =   " d y n a m i c D i g i t s " )   { s l p   =   t o P i p s ( _ d d S t o p L o s s _ ( ) , S y m b o l ) ; }  
 	 	 e l s e   i f   ( S t o p L o s s M o d e   = =   " d y n a m i c L e v e l " )     { s l l   =   _ d l S t o p L o s s _ ( ) ; }  
 	 	 e l s e   i f   ( S t o p L o s s M o d e   = =   " p e r c e n t P r i c e " )     { s l l   =   S y m b o l B i d ( S y m b o l )   +   ( S y m b o l B i d ( S y m b o l )   *   S t o p L o s s P e r c e n t P r i c e   /   1 0 0 ) ; }  
 	 	  
 	 	           i f   ( T a k e P r o f i t M o d e   = =   " f i x e d " )                   { t p p   =   T a k e P r o f i t P i p s ; }  
 	 	 e l s e   i f   ( T a k e P r o f i t M o d e   = =   " d y n a m i c P i p s " )       { t p p   =   _ d p T a k e P r o f i t _ ( ) ; }  
 	 	 e l s e   i f   ( T a k e P r o f i t M o d e   = =   " d y n a m i c D i g i t s " )   { t p p   =   t o P i p s ( _ d d T a k e P r o f i t _ ( ) , S y m b o l ) ; }  
 	 	 e l s e   i f   ( T a k e P r o f i t M o d e   = =   " d y n a m i c L e v e l " )     { t p l   =   _ d l T a k e P r o f i t _ ( ) ; }  
 	 	 e l s e   i f   ( T a k e P r o f i t M o d e   = =   " p e r c e n t P r i c e " )     { t p l   =   S y m b o l B i d ( S y m b o l )   -   ( S y m b o l B i d ( S y m b o l )   *   T a k e P r o f i t P e r c e n t P r i c e   /   1 0 0 ) ; }  
 	 	  
 	 	 i f   ( S t o p L o s s M o d e   = =   " p e r c e n t T P " )   {  
 	 	       i f   ( t p p   >   0 )   { s l p   =   t p p * S t o p L o s s P e r c e n t T P / 1 0 0 ; }  
 	 	       i f   ( t p l   >   0 )   { s l p   =   t o P i p s ( M a t h A b s ( S y m b o l B i d ( S y m b o l )   -   t p l ) ,   S y m b o l ) * S t o p L o s s P e r c e n t T P / 1 0 0 ; }  
 	 	 }  
 	 	 i f   ( T a k e P r o f i t M o d e   = =   " p e r c e n t S L " )   {  
 	 	       i f   ( s l p   >   0 )   { t p p   =   s l p * T a k e P r o f i t P e r c e n t S L / 1 0 0 ; }  
 	 	       i f   ( s l l   >   0 )   { t p p   =   t o P i p s ( M a t h A b s ( S y m b o l B i d ( S y m b o l )   -   s l l ) ,   S y m b o l ) * T a k e P r o f i t P e r c e n t S L / 1 0 0 ; }  
 	 	 }  
 	 	  
 	 	 / / - -   l o t s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 d o u b l e   l o t s   =   0 ;  
 	 	 d o u b l e   p r e _ s l l   =   s l l ;  
 	 	  
 	 	 i f   ( p r e _ s l l   = =   0 )   {  
 	 	 	 p r e _ s l l   =   S y m b o l B i d ( S y m b o l ) ;  
 	 	 }  
 	 	  
 	 	 d o u b l e   p r e _ s l _ p i p s   =   t o P i p s ( ( p r e _ s l l + t o D i g i t s ( s l p , S y m b o l ) ) - S y m b o l B i d ( S y m b o l ) ,   S y m b o l ) ;  
 	 	  
 	 	           i f   ( V o l u m e M o d e   = =   " f i x e d " )                         { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e S i z e ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " b l o c k - e q u i t y " )           { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e B l o c k P e r c e n t ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " b l o c k - b a l a n c e " )         { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e B l o c k P e r c e n t ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " b l o c k - f r e e m a r g i n " )   { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e B l o c k P e r c e n t ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " e q u i t y " )                       { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e P e r c e n t ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " b a l a n c e " )                     { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e P e r c e n t ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " f r e e m a r g i n " )               { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e P e r c e n t ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " e q u i t y R i s k " )               { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e R i s k ,   p r e _ s l _ p i p s ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " b a l a n c e R i s k " )             { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e R i s k ,   p r e _ s l _ p i p s ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " f r e e m a r g i n R i s k " )       { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e R i s k ,   p r e _ s l _ p i p s ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " f i x e d R i s k " )                 { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   V o l u m e S i z e R i s k ,   p r e _ s l _ p i p s ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " f i x e d R a t i o " )               { l o t s   =   D y n a m i c L o t s ( S y m b o l ,   V o l u m e M o d e ,   F i x e d R a t i o U n i t S i z e ,   F i x e d R a t i o D e l t a ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " d y n a m i c " )                     { l o t s   =   _ d V o l u m e S i z e _ ( ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " 1 3 2 6 " )                           { l o t s   =   B e t 1 3 2 6 ( G r o u p ,   S y m b o l ,   m m 1 3 2 6 I n i t i a l L o t s ,   m m 1 3 2 6 R e v e r s e ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " f i b o n a c c i " )                 { l o t s   =   B e t F i b o n a c c i ( G r o u p ,   S y m b o l ,   m m F i b o I n i t i a l L o t s ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " d a l e m b e r t " )                 { l o t s   =   B e t D a l e m b e r t ( G r o u p ,   S y m b o l ,   m m D a l e m b e r t I n i t i a l L o t s ,   m m D a l e m b e r t R e v e r s e ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " l a b o u c h e r e " )               { l o t s   =   B e t L a b o u c h e r e ( G r o u p ,   S y m b o l ,   m m L a b o u c h e r e I n i t i a l L o t s ,   m m L a b o u c h e r e L i s t ,   m m L a b o u c h e r e R e v e r s e ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " m a r t i n g a l e " )               { l o t s   =   B e t M a r t i n g a l e ( G r o u p ,   S y m b o l ,   m m M g I n i t i a l L o t s ,   m m M g M u l t i p l y O n L o s s ,   m m M g M u l t i p l y O n P r o f i t ,   m m M g A d d L o t s O n L o s s ,   m m M g A d d L o t s O n P r o f i t ,   m m M g R e s e t O n L o s s ,   m m M g R e s e t O n P r o f i t ) ; }  
 	 	 e l s e   i f   ( V o l u m e M o d e   = =   " s e q u e n c e " )                   { l o t s   =   B e t S e q u e n c e ( G r o u p ,   S y m b o l ,   m m S e q B a s e L o t s ,   m m S e q O n L o s s ,   m m S e q O n P r o f i t ,   m m S e q R e v e r s e ) ; }  
 	 	  
 	 	 l o t s   =   A l i g n L o t s ( S y m b o l ,   l o t s ,   0 ,   V o l u m e U p p e r L i m i t ) ;  
 	 	  
 	 	 d a t e t i m e   e x p   =   E x p i r a t i o n T i m e ( E x p M o d e , E x p D a y s , E x p H o u r s , E x p M i n u t e s , _ d E x p _ ( ) ) ;  
 	 	  
 	 	 / / - -   s e n d   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 l o n g   t i c k e t   =   S e l l N o w ( S y m b o l ,   l o t s ,   s l l ,   t p l ,   s l p ,   t p p ,   S l i p p a g e ,   ( M a g i c S t a r t + ( i n t ) G r o u p ) ,   M y C o m m e n t ,   A r r o w C o l o r S e l l ,   e x p ) ;  
 	 	  
 	 	 i f   ( t i c k e t   >   0 )   { _ c a l l b a c k _ ( 1 ) ; }   e l s e   { _ c a l l b a c k _ ( 0 ) ; }  
 	 }  
 } ;  
  
 / /   " P r i c e   � >   I n d i c a t o r "   m o d e l  
 t e m p l a t e < t y p e n a m e   T 1 , t y p e n a m e   _ T 1 _ , t y p e n a m e   T 2 >  
 c l a s s   M D L _ P r i c e C r o s s U p I n d i c a t o r :   p u b l i c   B l o c k C a l l s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 T 1   I n d i c a t o r ;   v i r t u a l   _ T 1 _   _ I n d i c a t o r _ ( ) { r e t u r n ( _ T 1 _ ) 0 ; }  
 	 T 2   T u r n o v e r M i n P i p s ;  
 	 / *   S t a t i c   P a r a m e t e r s   * /  
 	 d o u b l e   l o w e s t ;  
 	 b o o l   t u r n o v e r _ o k ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L _ P r i c e C r o s s U p I n d i c a t o r ( )  
 	 {  
 	 	 T u r n o v e r M i n P i p s   =   ( d o u b l e ) 5 . 0 ;  
 	 	 / *   S t a t i c   P a r a m e t e r s   ( i n i t i a l   v a l u e )   * /  
 	 	 l o w e s t   =     E M P T Y _ V A L U E ;  
 	 	 t u r n o v e r _ o k   =     f a l s e ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )  
 	 {  
 	 	 / / - -   a b o u n t   t h e   t u r n o v e r _ o k   v a r i a b l e :   i n   d o w n t r e n d   i n d i c a t o r   v a l u e   w i l l   g o   d o w n   a n d   t h e   p r i c e   e v e n   m o r e  
 	 	 / / - -   a n d   w e   h a v e   t o   r e m e m b e r   t h a t ,   b e c a u s e   a t   t h e   e n d   o f   t h e   d o w n t r e n d   w e   c a n   m i s s   t h e   t u r n o v e r   i f   w e   u s e   f r e s h   d a t a  
 	 	  
 	 	 d o u b l e   i n d i 0     =   _ I n d i c a t o r _ ( ) ;  
 	 	 s t r i n g   s y m b o l   =   S y m b o l ( ) ;  
 	 	 d o u b l e   t i c k 0     =   T i c k s D a t a ( s y m b o l ,   S Y M B O L _ B I D ,   0 ) ;  
 	 	 d o u b l e   t i c k 1     =   T i c k s D a t a ( s y m b o l ,   S Y M B O L _ B I D ,   1 ) ;  
 	 	  
 	 	 i f   ( t i c k 0   <   l o w e s t )   { l o w e s t   =   t i c k 0 ; }  
 	 	  
 	 	 i f   ( t u r n o v e r _ o k   = =   f a l s e   & &   i n d i 0 - l o w e s t   >   t o D i g i t s ( T u r n o v e r M i n P i p s ,   s y m b o l ) )  
 	 	 {  
 	 	 	 / / - -   i f   w h a t ' s   n e x t   i s   a   d o w n t r e n d ,   w e   h a v e   t h e   t u r n o v e r   n o w   a n d   w e ' l l   w a i t   f o r   a   c r o s s o v e r  
 	 	 	 t u r n o v e r _ o k   =   t r u e ;  
 	 	 }  
 	 	  
 	 	 i f   ( t u r n o v e r _ o k   = =   t r u e   & &   t i c k 1   < =   i n d i 0   & &   t i c k 0   >   i n d i 0 )  
 	 	 {  
 	 	 	 l o w e s t             =   E M P T Y _ V A L U E ;  
 	 	 	 t u r n o v e r _ o k   =   f a l s e ;  
 	 	 	 _ c a l l b a c k _ ( 1 ) ;  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 _ c a l l b a c k _ ( 0 ) ;  
 	 	 }  
 	 	  
 	 	 i f   ( t i c k 0   >   i n d i 0 )  
 	 	 {  
 	 	 	 l o w e s t             =   E M P T Y _ V A L U E ;  
 	 	 	 t u r n o v e r _ o k   =   f a l s e ;  
 	 	 }  
 	 }  
 } ;  
  
 / /   " P r i c e   � <   I n d i c a t o r "   m o d e l  
 t e m p l a t e < t y p e n a m e   T 1 , t y p e n a m e   _ T 1 _ , t y p e n a m e   T 2 >  
 c l a s s   M D L _ P r i c e C r o s s D n I n d i c a t o r :   p u b l i c   B l o c k C a l l s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 T 1   I n d i c a t o r ;   v i r t u a l   _ T 1 _   _ I n d i c a t o r _ ( ) { r e t u r n ( _ T 1 _ ) 0 ; }  
 	 T 2   T u r n o v e r M i n P i p s ;  
 	 / *   S t a t i c   P a r a m e t e r s   * /  
 	 d o u b l e   h i g h e s t ;  
 	 b o o l   t u r n o v e r _ o k ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L _ P r i c e C r o s s D n I n d i c a t o r ( )  
 	 {  
 	 	 T u r n o v e r M i n P i p s   =   ( d o u b l e ) 5 . 0 ;  
 	 	 / *   S t a t i c   P a r a m e t e r s   ( i n i t i a l   v a l u e )   * /  
 	 	 h i g h e s t   =     0 ;  
 	 	 t u r n o v e r _ o k   =     f a l s e ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 v i r t u a l   v o i d   _ e x e c u t e _ ( )  
 	 {  
 	 	 / / - -   a b o u n t   t h e   t u r n o v e r _ o k   v a r i a b l e :   i n   u p t r e n d   t h e   i n d i c a t o r   v a l u e   w i l l   g o   u p ,   a n d   t h e   p r i c e   e v e n   m o r e  
 	 	 / / - -   a n d   w e   h a v e   t o   r e m e m b e r   t h a t ,   b e c a u s e   a t   t h e   e n d   o f   t h e   u p t r e n d   w e   c a n   m i s s   t h e   t u r n o v e r   i f   w e   u s e   f r e s h   d a t a  
 	 	  
 	 	 d o u b l e   i n d i 0     =   _ I n d i c a t o r _ ( ) ;  
 	 	 s t r i n g   s y m b o l   =   S y m b o l ( ) ;  
 	 	 d o u b l e   t i c k 0     =   T i c k s D a t a ( s y m b o l ,   S Y M B O L _ B I D ,   0 ) ;  
 	 	 d o u b l e   t i c k 1     =   T i c k s D a t a ( s y m b o l ,   S Y M B O L _ B I D ,   1 ) ;  
 	 	  
 	 	 i f   ( t i c k 0   >   h i g h e s t )   { h i g h e s t   =   t i c k 0 ; }  
 	 	  
 	 	 i f   ( t u r n o v e r _ o k   = =   f a l s e   & &   h i g h e s t - i n d i 0   >   t o D i g i t s ( T u r n o v e r M i n P i p s ,   s y m b o l ) )  
 	 	 {  
 	 	 	 / / - -   i f   w h a t ' s   n e x t   i s   a   u p t r e n d ,   w e   h a v e   t h e   t u r n o v e r   n o w   a n d   w e ' l l   w a i t   f o r   a   c r o s s o v e r  
 	 	 	 t u r n o v e r _ o k   =   t r u e ;  
 	 	 }  
 	 	  
 	 	 i f   ( t u r n o v e r _ o k   = =   t r u e   & &   t i c k 1   > =   i n d i 0   & &   t i c k 0   <   i n d i 0 )  
 	 	 {  
 	 	 	 h i g h e s t           =   0 ;  
 	 	 	 t u r n o v e r _ o k   =   f a l s e ;  
 	 	 	 _ c a l l b a c k _ ( 1 ) ;  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 _ c a l l b a c k _ ( 0 ) ;  
 	 	 }  
 	 	  
 	 	 i f   ( t i c k 0   <   i n d i 0 )  
 	 	 {  
 	 	 	 h i g h e s t           =   0 ;  
 	 	 	 t u r n o v e r _ o k   =   f a l s e ;  
 	 	 }  
 	 }  
 } ;  
  
  
 / / - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 / /   " C a n d l e "   m o d e l  
 c l a s s   M D L I C _ c a n d l e s _ c a n d l e s  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 s t r i n g   i O H L C ;  
 	 s t r i n g   M o d e C a n d l e F i n d B y ;  
 	 i n t   C a n d l e I D ;  
 	 s t r i n g   T i m e S t a m p ;  
 	 s t r i n g   S y m b o l ;  
 	 E N U M _ T I M E F R A M E S   P e r i o d ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L I C _ c a n d l e s _ c a n d l e s ( )  
 	 {  
 	 	 i O H L C   =   ( s t r i n g ) " i C l o s e " ;  
 	 	 M o d e C a n d l e F i n d B y   =   ( s t r i n g ) " i d " ;  
 	 	 C a n d l e I D   =   ( i n t ) 0 ;  
 	 	 T i m e S t a m p   =   ( s t r i n g ) " 0 0 : 0 0 " ;  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 P e r i o d   =   ( E N U M _ T I M E F R A M E S ) C u r r e n t T i m e f r a m e ( ) ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 d o u b l e   _ e x e c u t e _ ( )  
 	 {  
 	 	 i n t   d i g i t s   =   ( i n t ) S y m b o l I n f o I n t e g e r ( S y m b o l ,   S Y M B O L _ D I G I T S ) ;  
 	 	  
 	 	 d o u b l e   O [ ] ;  
 	 	 d o u b l e   H [ ] ;  
 	 	 d o u b l e   L [ ] ;  
 	 	 d o u b l e   C [ ] ;    
 	 	 l o n g   c T i c k V o l u m e [ ] ;  
 	 	 l o n g   c R e a l V o l u m e [ ] ;  
 	 	 d a t e t i m e   T [ ] ;  
 	 	  
 	 	 d o u b l e   r e t v a l   =   E M P T Y _ V A L U E ;  
 	 	  
 	 	 / /   c a n d l e ' s   i d   w i l l   c h a n g e ,   s o   w e   d o n ' t   w a n t   t o   m e s s   w i t h   t h e   v a r i a b l e   C a n d l e I D ;  
 	 	 i n t   c I D   =   C a n d l e I D ;  
 	 	  
 	 	 i f   ( M o d e C a n d l e F i n d B y   = =   " t i m e " )  
 	 	 {  
 	 	 	 c I D   =   i C a n d l e I D ( S y m b o l ,   P e r i o d ,   S t r i n g T o T i m e E x ( T i m e S t a m p ,   " s e r v e r " ) ) ;  
 	 	 }  
 	 	  
 	 	 c I D   =   c I D   +   F X D _ M O R E _ S H I F T ;  
 	 	  
 	 	 / / - -   t h e   c o m m o n   l e v e l s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 i f   ( i O H L C   = =   " i O p e n " )  
 	 	 {  
 	 	 	 i f   ( C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1 )   r e t v a l   =   O [ 0 ] ;  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i H i g h " )  
 	 	 {  
 	 	 	 i f   ( C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1 )   r e t v a l   =   H [ 0 ] ;  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i L o w " )  
 	 	 {  
 	 	 	 i f   ( C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1 )   r e t v a l   =   L [ 0 ] ;  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i C l o s e " )  
 	 	 {  
 	 	 	 i f   ( C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1 )   r e t v a l   =   C [ 0 ] ;  
 	 	 }  
 	 	  
 	 	 / / - -   n o n - p r i c e   v a l u e s     - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 e l s e   i f   ( i O H L C   = =   " i V o l u m e "   | |   i O H L C   = =   " i T i c k V o l u m e " )  
 	 	 {  
 	 	 	 i f   ( C o p y T i c k V o l u m e ( S y m b o l , P e r i o d , c I D , 1 , c T i c k V o l u m e )   >   - 1 )   r e t v a l   =   ( d o u b l e ) c T i c k V o l u m e [ 0 ] ;  
 	 	 	  
 	 	 	 r e t u r n   r e t v a l ;  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i R e a l V o l u m e " )  
 	 	 {  
 	 	 	 i f   ( C o p y R e a l V o l u m e ( S y m b o l , P e r i o d , c I D , 1 , c R e a l V o l u m e )   >   - 1 )   r e t v a l   =   ( d o u b l e ) c R e a l V o l u m e [ 0 ] ;  
 	 	 	  
 	 	 	 r e t u r n   r e t v a l ;  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i T i m e " )  
 	 	 {  
 	 	 	 i f   ( C o p y T i m e ( S y m b o l , P e r i o d , c I D , 1 , T )   >   - 1 )   r e t v a l   =   ( d o u b l e ) T [ 0 ] ;  
 	 	 	  
 	 	 	 r e t u r n   r e t v a l ;  
 	 	 }  
 	 	  
 	 	 / / - -   s i m p l e   c a l c u l a t i o n s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 e l s e   i f   ( i O H L C   = =   " i M e d i a n " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 	 & &   C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   ( ( L [ 0 ] + H [ 0 ] ) / 2 ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i T y p i c a l " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 	 & &   C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   ( ( L [ 0 ] + H [ 0 ] + C [ 0 ] ) / 3 ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i A v e r a g e " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 	 & &   C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   ( ( L [ 0 ] + H [ 0 ] + C [ 0 ] + C [ 0 ] ) / 4 ) ;  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	 / / - -   m o r e   c o m p l e x   l e v e l s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 e l s e   i f   ( i O H L C = = " i T o t a l " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( M a t h A b s ( H [ 0 ] - L [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B o d y " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( M a t h A b s ( C [ 0 ] - O [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i U p p e r W i c k " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   ( C [ 0 ]   >   O [ 0 ] )   ?   t o P i p s ( M a t h A b s ( H [ 0 ] - C [ 0 ] ) , S y m b o l )   :   t o P i p s ( M a t h A b s ( H [ 0 ] - O [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B o t t o m W i c k " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   ( C [ 0 ]   >   O [ 0 ] )   ?   t o P i p s ( M a t h A b s ( O [ 0 ] - L [ 0 ] ) , S y m b o l )   :   t o P i p s ( M a t h A b s ( C [ 0 ] - L [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i G a p " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D + 1 , 1 , C )   >   - 1  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( M a t h A b s ( O [ 0 ] - C [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B u l l T o t a l " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   >   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( H [ 0 ] - L [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B u l l B o d y " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   >   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( C [ 0 ] - O [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B u l l U p p e r W i c k " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   >   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( H [ 0 ] - C [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B u l l B o t t o m W i c k " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 	 & &   C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   >   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( O [ 0 ] - L [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B e a r T o t a l " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   <   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( H [ 0 ] - L [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B e a r B o d y " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   <   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( O [ 0 ] - C [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B e a r U p p e r W i c k " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y H i g h ( S y m b o l , P e r i o d , c I D , 1 , H )   >   - 1  
 	 	 	 	 & &   C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   <   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( H [ 0 ] - O [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e   i f   ( i O H L C   = =   " i B e a r B o t t o m W i c k " )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	       C o p y L o w ( S y m b o l , P e r i o d , c I D , 1 , L )   >   - 1  
 	 	 	 	 & &   C o p y O p e n ( S y m b o l , P e r i o d , c I D , 1 , O )   >   - 1  
 	 	 	 	 & &   C o p y C l o s e ( S y m b o l , P e r i o d , c I D , 1 , C )   >   - 1  
 	 	 	 	 & &   C [ 0 ]   <   O [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 r e t v a l   =   t o P i p s ( ( C [ 0 ] - L [ 0 ] ) , S y m b o l ) ;  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	 r e t u r n   N o r m a l i z e D o u b l e ( r e t v a l ,   d i g i t s ) ;  
 	 }  
 } ;  
  
 / /   " M o v i n g   A v e r a g e "   m o d e l  
 c l a s s   M D L I C _ i n d i c a t o r s _ i M A  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 i n t   M A p e r i o d ;  
 	 i n t   M A s h i f t ;  
 	 E N U M _ M A _ M E T H O D   M A m e t h o d ;  
 	 E N U M _ A P P L I E D _ P R I C E   A p p l i e d P r i c e ;  
 	 s t r i n g   S y m b o l ;  
 	 E N U M _ T I M E F R A M E S   P e r i o d ;  
 	 i n t   S h i f t ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L I C _ i n d i c a t o r s _ i M A ( )  
 	 {  
 	 	 M A p e r i o d   =   ( i n t ) 1 4 ;  
 	 	 M A s h i f t   =   ( i n t ) 0 ;  
 	 	 M A m e t h o d   =   ( E N U M _ M A _ M E T H O D ) M O D E _ S M A ;  
 	 	 A p p l i e d P r i c e   =   ( E N U M _ A P P L I E D _ P R I C E ) P R I C E _ C L O S E ;  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 P e r i o d   =   ( E N U M _ T I M E F R A M E S ) C u r r e n t T i m e f r a m e ( ) ;  
 	 	 S h i f t   =   ( i n t ) 0 ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 d o u b l e   _ e x e c u t e _ ( )  
 	 {  
 	 	 r e t u r n   i M A ( S y m b o l ,   P e r i o d ,   M A p e r i o d ,   M A s h i f t ,   M A m e t h o d ,   A p p l i e d P r i c e ,   S h i f t   +   F X D _ M O R E _ S H I F T ) ;  
 	 }  
 } ;  
  
 / /   " N u m e r i c "   m o d e l  
 c l a s s   M D L I C _ v a l u e _ v a l u e  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 d o u b l e   V a l u e ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L I C _ v a l u e _ v a l u e ( )  
 	 {  
 	 	 V a l u e   =   ( d o u b l e ) 1 . 0 ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 d o u b l e   _ e x e c u t e _ ( )  
 	 {  
 	 	 r e t u r n   V a l u e ;  
 	 }  
 } ;  
  
 / /   " T i m e "   m o d e l  
 c l a s s   M D L I C _ v a l u e _ t i m e  
 {  
 	 p u b l i c :   / *   I n p u t   P a r a m e t e r s   * /  
 	 i n t   M o d e T i m e ;  
 	 i n t   T i m e S o u r c e ;  
 	 s t r i n g   T i m e S t a m p ;  
 	 i n t   T i m e C a n d l e I D ;  
 	 s t r i n g   T i m e M a r k e t ;  
 	 E N U M _ T I M E F R A M E S   T i m e C a n d l e T i m e f r a m e ;  
 	 i n t   T i m e C o m p o n e n t Y e a r ;  
 	 i n t   T i m e C o m p o n e n t M o n t h ;  
 	 d o u b l e   T i m e C o m p o n e n t D a y ;  
 	 d o u b l e   T i m e C o m p o n e n t H o u r ;  
 	 d o u b l e   T i m e C o m p o n e n t M i n u t e ;  
 	 i n t   T i m e C o m p o n e n t S e c o n d ;  
 	 i n t   M o d e T i m e S h i f t ;  
 	 i n t   T i m e S h i f t Y e a r s ;  
 	 i n t   T i m e S h i f t M o n t h s ;  
 	 i n t   T i m e S h i f t W e e k s ;  
 	 d o u b l e   T i m e S h i f t D a y s ;  
 	 d o u b l e   T i m e S h i f t H o u r s ;  
 	 d o u b l e   T i m e S h i f t M i n u t e s ;  
 	 i n t   T i m e S h i f t S e c o n d s ;  
 	 b o o l   T i m e S k i p W e e k d a y s ;  
 	 / *   S t a t i c   P a r a m e t e r s   * /  
 	 d a t e t i m e   r e t v a l ;  
 	 d a t e t i m e   r e t v a l 0 ;  
 	 i n t   M o d e T i m e 0 ;  
 	 i n t   s m o d e s h i f t ;  
 	 i n t   y e a r s 0 ;  
 	 i n t   m o n t h s 0 ;  
 	 d a t e t i m e   T i m e [ ] ;  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   r )   { r e t u r n ; }  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 M D L I C _ v a l u e _ t i m e ( )  
 	 {  
 	 	 M o d e T i m e   =   ( i n t ) 0 ;  
 	 	 T i m e S o u r c e   =   ( i n t ) 0 ;  
 	 	 T i m e S t a m p   =   ( s t r i n g ) " 0 0 : 0 0 " ;  
 	 	 T i m e C a n d l e I D   =   ( i n t ) 1 ;  
 	 	 T i m e M a r k e t   =   ( s t r i n g ) " " ;  
 	 	 T i m e C a n d l e T i m e f r a m e   =   ( E N U M _ T I M E F R A M E S ) 0 ;  
 	 	 T i m e C o m p o n e n t Y e a r   =   ( i n t ) 0 ;  
 	 	 T i m e C o m p o n e n t M o n t h   =   ( i n t ) 0 ;  
 	 	 T i m e C o m p o n e n t D a y   =   ( d o u b l e ) 0 . 0 ;  
 	 	 T i m e C o m p o n e n t H o u r   =   ( d o u b l e ) 1 2 . 0 ;  
 	 	 T i m e C o m p o n e n t M i n u t e   =   ( d o u b l e ) 0 . 0 ;  
 	 	 T i m e C o m p o n e n t S e c o n d   =   ( i n t ) 0 ;  
 	 	 M o d e T i m e S h i f t   =   ( i n t ) 0 ;  
 	 	 T i m e S h i f t Y e a r s   =   ( i n t ) 0 ;  
 	 	 T i m e S h i f t M o n t h s   =   ( i n t ) 0 ;  
 	 	 T i m e S h i f t W e e k s   =   ( i n t ) 0 ;  
 	 	 T i m e S h i f t D a y s   =   ( d o u b l e ) 0 . 0 ;  
 	 	 T i m e S h i f t H o u r s   =   ( d o u b l e ) 0 . 0 ;  
 	 	 T i m e S h i f t M i n u t e s   =   ( d o u b l e ) 0 . 0 ;  
 	 	 T i m e S h i f t S e c o n d s   =   ( i n t ) 0 ;  
 	 	 T i m e S k i p W e e k d a y s   =   ( b o o l ) f a l s e ;  
 	 	 / *   S t a t i c   P a r a m e t e r s   ( i n i t i a l   v a l u e )   * /  
 	 	 r e t v a l   =     0 ;  
 	 	 r e t v a l 0   =     0 ;  
 	 	 M o d e T i m e 0   =     0 ;  
 	 	 s m o d e s h i f t   =     0 ;  
 	 	 y e a r s 0   =     0 ;  
 	 	 m o n t h s 0   =     0 ;  
 	 }  
  
 	 p u b l i c :   / *   T h e   m a i n   m e t h o d   * /  
 	 d a t e t i m e   _ e x e c u t e _ ( )  
 	 {  
 	 	 / /   t h i s   i s   s t a t i c   f o r   s p e e d   r e a s o n s  
 	 	  
 	 	 i f   ( T i m e M a r k e t   = =   " " )   T i m e M a r k e t   =   S y m b o l ( ) ;  
 	 	  
 	 	 i f   ( M o d e T i m e   = =   0 )  
 	 	 {  
 	 	 	           i f   ( T i m e S o u r c e   = =   0 )   { r e t v a l   =   T i m e C u r r e n t ( ) ; }  
 	 	 	 e l s e   i f   ( T i m e S o u r c e   = =   1 )   { r e t v a l   =   T i m e L o c a l ( ) ; }  
 	 	 	 e l s e   i f   ( T i m e S o u r c e   = =   2 )   { r e t v a l   =   T i m e G M T ( ) ; }  
 	 	 }  
 	 	 e l s e   i f   ( M o d e T i m e   = =   1 )  
 	 	 {  
 	 	 	 r e t v a l     =   S t r i n g T o T i m e ( T i m e S t a m p ) ;  
 	 	 	 r e t v a l 0   =   r e t v a l ;  
 	 	 }  
 	 	 e l s e   i f   ( M o d e T i m e = = 2 )  
 	 	 {  
 	 	 	 r e t v a l   =   T i m e F r o m C o m p o n e n t s ( T i m e S o u r c e ,   T i m e C o m p o n e n t Y e a r ,   T i m e C o m p o n e n t M o n t h ,   T i m e C o m p o n e n t D a y ,   T i m e C o m p o n e n t H o u r ,   T i m e C o m p o n e n t M i n u t e ,   T i m e C o m p o n e n t S e c o n d ) ;  
 	 	 }  
 	 	 e l s e   i f   ( M o d e T i m e   = =   3 )  
 	 	 {  
 	 	 	 A r r a y S e t A s S e r i e s ( T i m e , t r u e ) ;  
 	 	 	 C o p y T i m e ( T i m e M a r k e t , T i m e C a n d l e T i m e f r a m e , T i m e C a n d l e I D , 1 , T i m e ) ;  
 	 	 	 r e t v a l   =   T i m e [ 0 ] ;  
 	 	 }  
 	 	  
 	 	 i f   ( M o d e T i m e S h i f t   >   0 )  
 	 	 {  
 	 	 	 i n t   s h   =   1 ;  
 	 	  
 	 	 	 i f   ( M o d e T i m e S h i f t   = =   1 )   { s h   =   - 1 ; }  
 	 	  
 	 	 	 i f   (  
 	 	 	 	       M o d e T i m e S h i f t   ! =   s m o d e s h i f t  
 	 	 	 	 | |   T i m e S h i f t Y e a r s   ! =   y e a r s 0  
 	 	 	 	 | |   T i m e S h i f t M o n t h s   ! =   m o n t h s 0  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 y e a r s 0     =   T i m e S h i f t Y e a r s ;  
 	 	 	 	 m o n t h s 0   =   T i m e S h i f t M o n t h s ;  
 	 	  
 	 	 	 	 i f   ( T i m e S h i f t Y e a r s   >   0   | |   T i m e S h i f t M o n t h s   >   0 )  
 	 	 	 	 {  
 	 	 	 	 	 i n t   y e a r   =   0 ,   m o n t h   =   0 ,   w e e k   =   0 ,   d a y   =   0 ,   h o u r   =   0 ,   m i n u t e   =   0 ,   s e c o n d   =   0 ;  
 	 	  
 	 	 	 	 	 i f   ( M o d e T i m e   = =   3 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 y e a r       =   T i m e C o m p o n e n t Y e a r ;  
 	 	 	 	 	 	 m o n t h     =   T i m e C o m p o n e n t Y e a r ;  
 	 	 	 	 	 	 d a y         =   ( i n t ) M a t h F l o o r ( T i m e C o m p o n e n t D a y ) ;  
 	 	 	 	 	 	 h o u r       =   ( i n t ) ( M a t h F l o o r ( T i m e C o m p o n e n t H o u r )   +   ( 2 4   *   ( T i m e C o m p o n e n t D a y   -   M a t h F l o o r ( T i m e C o m p o n e n t D a y ) ) ) ) ;  
 	 	 	 	 	 	 m i n u t e   =   ( i n t ) ( M a t h F l o o r ( T i m e C o m p o n e n t M i n u t e )   +   ( 6 0   *   ( T i m e C o m p o n e n t H o u r   -   M a t h F l o o r ( T i m e C o m p o n e n t H o u r ) ) ) ) ;  
 	 	 	 	 	 	 s e c o n d   =   ( i n t ) ( T i m e C o m p o n e n t S e c o n d   +   ( 6 0   *   ( T i m e C o m p o n e n t M i n u t e   -   M a t h F l o o r ( T i m e C o m p o n e n t M i n u t e ) ) ) ) ;  
 	 	 	 	 	 }  
 	 	 	 	 	 e l s e   {  
 	 	 	 	 	 	 y e a r       =   T i m e Y e a r ( r e t v a l ) ;  
 	 	 	 	 	 	 m o n t h     =   T i m e M o n t h ( r e t v a l ) ;  
 	 	 	 	 	 	 d a y         =   T i m e D a y ( r e t v a l ) ;  
 	 	 	 	 	 	 h o u r       =   T i m e H o u r ( r e t v a l ) ;  
 	 	 	 	 	 	 m i n u t e   =   T i m e M i n u t e ( r e t v a l ) ;  
 	 	 	 	 	 	 s e c o n d   =   T i m e S e c o n d s ( r e t v a l ) ;  
 	 	 	 	 	 }  
 	 	  
 	 	 	 	 	 y e a r     =   y e a r   +   T i m e S h i f t Y e a r s   *   s h ;  
 	 	 	 	 	 m o n t h   =   m o n t h   +   T i m e S h i f t M o n t h s   *   s h ;  
 	 	  
 	 	 	 	 	           i f   ( m o n t h   <   0 )   { m o n t h   =   1 2   -   m o n t h ; }  
 	 	 	 	 	 e l s e   i f   ( m o n t h   >   1 2 )   { m o n t h   =   m o n t h   -   1 2 ; }  
 	 	  
 	 	 	 	 	 r e t v a l   =   S t r i n g T o T i m e ( I n t e g e r T o S t r i n g ( y e a r ) + " . " + I n t e g e r T o S t r i n g ( m o n t h ) + " . " + I n t e g e r T o S t r i n g ( d a y ) + "   " + I n t e g e r T o S t r i n g ( h o u r ) + " : " + I n t e g e r T o S t r i n g ( m i n u t e ) + " : " + I n t e g e r T o S t r i n g ( s e c o n d ) ) ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	  
 	 	 	 r e t v a l   =   r e t v a l   +   ( s h   *   ( ( 6 0 4 8 0 0   *   T i m e S h i f t W e e k s )   +   S e c o n d s F r o m C o m p o n e n t s ( T i m e S h i f t D a y s ,   T i m e S h i f t H o u r s ,   T i m e S h i f t M i n u t e s ,   T i m e S h i f t S e c o n d s ) ) ) ;  
 	 	  
 	 	 	 i f   ( T i m e S k i p W e e k d a y s   = =   t r u e )  
 	 	 	 {  
 	 	 	 	 i n t   w e e k d a y   =   T i m e D a y O f W e e k ( r e t v a l ) ;  
 	 	  
 	 	 	 	 i f   ( s h   >   0 )   {   / /   f o r w a r d  
 	 	 	 	 	           i f   ( w e e k d a y   = =   0 )   { r e t v a l   =   r e t v a l   +   8 6 4 0 0 ; }  
 	 	 	 	 	 e l s e   i f   ( w e e k d a y   = =   6 )   { r e t v a l   =   r e t v a l   +   1 7 2 8 0 0 ; }  
 	 	 	 	 }  
 	 	 	 	 e l s e   i f   ( s h   <   0 )   {   / /   b a c k  
 	 	 	 	 	           i f   ( w e e k d a y   = =   0 )   { r e t v a l   =   r e t v a l   -   1 7 2 8 0 0 ; }  
 	 	 	 	 	 e l s e   i f   ( w e e k d a y   = =   6 )   { r e t v a l   =   r e t v a l   -   8 6 4 0 0 ; }  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	 s m o d e s h i f t   =   M o d e T i m e S h i f t ;  
 	 	 M o d e T i m e 0     =   M o d e T i m e ;  
 	 	  
 	 	 r e t u r n   ( d a t e t i m e ) r e t v a l ;  
 	 }  
 } ;  
  
  
 / / - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 / /   B l o c k   1   ( C o n d i t i o n )  
 c l a s s   B l o c k 0 :   p u b l i c   M D L _ C o n d i t i o n < M D L I C _ c a n d l e s _ c a n d l e s , d o u b l e , s t r i n g , M D L I C _ i n d i c a t o r s _ i M A , d o u b l e , i n t >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 0 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   0 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 1 " ;  
  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 1 ]   =   { 2 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
  
 	 	 / /   I C   i n p u t   p a r a m e t e r s  
 	 	 L o . C a n d l e I D   =   1 ;  
 	 	 R o . M A p e r i o d   =   5 ;  
 	 }  
  
 	 p u b l i c :   / *   C u s t o m   m e t h o d s   * /  
 	 v i r t u a l   d o u b l e   _ L o _ ( )   {  
 	 	 L o . S y m b o l   =   C u r r e n t S y m b o l ( ) ;  
 	 	 L o . P e r i o d   =   P E R I O D _ D 1 ;  
  
 	 	 r e t u r n   L o . _ e x e c u t e _ ( ) ;  
 	 }  
 	 v i r t u a l   d o u b l e   _ R o _ ( )   {  
 	 	 R o . M A m e t h o d   =   M O D E _ S M A ;  
 	 	 R o . A p p l i e d P r i c e   =   P R I C E _ C L O S E ;  
 	 	 R o . S y m b o l   =   C u r r e n t S y m b o l ( ) ;  
 	 	 R o . P e r i o d   =   C u r r e n t T i m e f r a m e ( ) ;  
  
 	 	 r e t u r n   R o . _ e x e c u t e _ ( ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 2 ] . r u n ( 0 ) ;  
 	 	 }  
 	 }  
 } ;  
  
 / /   B l o c k   2   ( N o   t r a d e )  
 c l a s s   B l o c k 1 :   p u b l i c   M D L _ N o O p e n e d O r d e r s < s t r i n g , s t r i n g , s t r i n g , s t r i n g , s t r i n g >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 1 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   1 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 2 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 2 ]   =   { 0 , 8 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 0 ] . r u n ( 1 ) ;  
 	 	 	 _ b l o c k s _ [ 8 ] . r u n ( 1 ) ;  
 	 	 }  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 }  
 } ;  
  
 / /   B l o c k   3   ( C l o s e   t r a d e s )  
 c l a s s   B l o c k 2 :   p u b l i c   M D L _ C l o s e O p e n e d < s t r i n g , s t r i n g , s t r i n g , s t r i n g , s t r i n g , i n t , u l o n g , c o l o r >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 2 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   2 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 3 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 1 ]   =   { 3 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 3 ] . r u n ( 2 ) ;  
 	 	 }  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 A r r o w C o l o r   =   ( c o l o r ) c l r D e e p P i n k ;  
 	 }  
 } ;  
  
 / /   B l o c k   4   ( B u y   n o w )  
 c l a s s   B l o c k 3 :   p u b l i c   M D L _ B u y N o w < s t r i n g , s t r i n g , s t r i n g , d o u b l e , d o u b l e , d o u b l e , d o u b l e , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , d o u b l e , d o u b l e , d o u b l e , d o u b l e , d o u b l e , d o u b l e , d o u b l e , i n t , i n t , d o u b l e , b o o l , d o u b l e , d o u b l e , b o o l , d o u b l e , s t r i n g , b o o l , d o u b l e , s t r i n g , s t r i n g , b o o l , d o u b l e , s t r i n g , d o u b l e , d o u b l e , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , d o u b l e , d o u b l e , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , i n t , i n t , i n t , M D L I C _ v a l u e _ t i m e , d a t e t i m e , u l o n g , s t r i n g , c o l o r >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 3 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   3 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 4 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   I C   i n p u t   p a r a m e t e r s  
 	 	 d V o l u m e S i z e . V a l u e   =   0 . 1 ;  
 	 	 d p S t o p L o s s . V a l u e   =   1 0 0 . 0 ;  
 	 	 d d S t o p L o s s . V a l u e   =   0 . 0 1 ;  
 	 	 d p T a k e P r o f i t . V a l u e   =   1 0 0 . 0 ;  
 	 	 d d T a k e P r o f i t . V a l u e   =   0 . 0 1 ;  
 	 	 d E x p . M o d e T i m e   =   3 ;  
 	 	 d E x p . M o d e T i m e S h i f t   =   2 ;  
 	 	 d E x p . T i m e S h i f t D a y s   =   1 . 0 ;  
 	 	 d E x p . T i m e S k i p W e e k d a y s   =   t r u e ;  
 	 	 / /   B l o c k   i n p u t   p a r a m e t e r s  
 	 	 V o l u m e S i z e   =   0 . 0 1 ;  
 	 	 S t o p L o s s P i p s   =   0 . 0 ;  
 	 	 T a k e P r o f i t P i p s   =   0 . 0 ;  
 	 	 E x p M o d e   =   " t o d a y " ;  
 	 }  
  
 	 p u b l i c :   / *   C u s t o m   m e t h o d s   * /  
 	 v i r t u a l   d o u b l e   _ d V o l u m e S i z e _ ( )   { r e t u r n   d V o l u m e S i z e . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ d l S t o p L o s s _ ( )   { r e t u r n   d l S t o p L o s s . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ d p S t o p L o s s _ ( )   { r e t u r n   d p S t o p L o s s . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ d d S t o p L o s s _ ( )   { r e t u r n   d d S t o p L o s s . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ d l T a k e P r o f i t _ ( )   { r e t u r n   d l T a k e P r o f i t . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ d p T a k e P r o f i t _ ( )   { r e t u r n   d p T a k e P r o f i t . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ d d T a k e P r o f i t _ ( )   { r e t u r n   d d T a k e P r o f i t . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d a t e t i m e   _ d E x p _ ( )   { r e t u r n   d E x p . _ e x e c u t e _ ( ) ; }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 A r r o w C o l o r B u y   =   ( c o l o r ) c l r B l u e ;  
 	 }  
 } ;  
  
 / /   B l o c k   6   ( N o   t r a d e )  
 c l a s s   B l o c k 4 :   p u b l i c   M D L _ N o O p e n e d O r d e r s < s t r i n g , s t r i n g , s t r i n g , s t r i n g , s t r i n g >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 4 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   4 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 6 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 2 ]   =   { 7 , 9 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 7 ] . r u n ( 4 ) ;  
 	 	 	 _ b l o c k s _ [ 9 ] . r u n ( 4 ) ;  
 	 	 }  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 }  
 } ;  
  
 / /   B l o c k   7   ( C l o s e   t r a d e s )  
 c l a s s   B l o c k 5 :   p u b l i c   M D L _ C l o s e O p e n e d < s t r i n g , s t r i n g , s t r i n g , s t r i n g , s t r i n g , i n t , u l o n g , c o l o r >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 5 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   5 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 7 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 1 ]   =   { 6 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 6 ] . r u n ( 5 ) ;  
 	 	 }  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 A r r o w C o l o r   =   ( c o l o r ) c l r D e e p P i n k ;  
 	 }  
 } ;  
  
 / /   B l o c k   8   ( S e l l   n o w )  
 c l a s s   B l o c k 6 :   p u b l i c   M D L _ S e l l N o w < s t r i n g , s t r i n g , s t r i n g , d o u b l e , d o u b l e , d o u b l e , d o u b l e , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , d o u b l e , d o u b l e , d o u b l e , d o u b l e , d o u b l e , d o u b l e , d o u b l e , i n t , i n t , d o u b l e , b o o l , d o u b l e , d o u b l e , b o o l , d o u b l e , s t r i n g , b o o l , d o u b l e , s t r i n g , s t r i n g , b o o l , d o u b l e , s t r i n g , d o u b l e , d o u b l e , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , d o u b l e , d o u b l e , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , M D L I C _ v a l u e _ v a l u e , d o u b l e , s t r i n g , i n t , i n t , i n t , M D L I C _ v a l u e _ t i m e , d a t e t i m e , u l o n g , s t r i n g , c o l o r >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 6 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   6 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 8 " ;  
 	 	 _ b e f o r e E x e c u t e E n a b l e d   =   t r u e ;  
  
 	 	 / /   I C   i n p u t   p a r a m e t e r s  
 	 	 d V o l u m e S i z e . V a l u e   =   0 . 1 ;  
 	 	 d p S t o p L o s s . V a l u e   =   1 0 0 . 0 ;  
 	 	 d d S t o p L o s s . V a l u e   =   0 . 0 1 ;  
 	 	 d p T a k e P r o f i t . V a l u e   =   1 0 0 . 0 ;  
 	 	 d d T a k e P r o f i t . V a l u e   =   0 . 0 1 ;  
 	 	 d E x p . M o d e T i m e   =   3 ;  
 	 	 d E x p . M o d e T i m e S h i f t   =   2 ;  
 	 	 d E x p . T i m e S h i f t D a y s   =   1 . 0 ;  
 	 	 d E x p . T i m e S k i p W e e k d a y s   =   t r u e ;  
 	 	 / /   B l o c k   i n p u t   p a r a m e t e r s  
 	 	 V o l u m e S i z e   =   0 . 0 1 ;  
 	 	 S t o p L o s s P i p s   =   0 . 0 ;  
 	 	 T a k e P r o f i t P i p s   =   0 . 0 ;  
 	 	 E x p M o d e   =   " t o d a y " ;  
 	 }  
  
 	 p u b l i c :   / *   C u s t o m   m e t h o d s   * /  
 	 v i r t u a l   d o u b l e   _ d V o l u m e S i z e _ ( )   { r e t u r n   d V o l u m e S i z e . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ d l S t o p L o s s _ ( )   { r e t u r n   d l S t o p L o s s . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ d p S t o p L o s s _ ( )   { r e t u r n   d p S t o p L o s s . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ d d S t o p L o s s _ ( )   { r e t u r n   d d S t o p L o s s . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ d l T a k e P r o f i t _ ( )   { r e t u r n   d l T a k e P r o f i t . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ d p T a k e P r o f i t _ ( )   { r e t u r n   d p T a k e P r o f i t . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d o u b l e   _ d d T a k e P r o f i t _ ( )   { r e t u r n   d d T a k e P r o f i t . _ e x e c u t e _ ( ) ; }  
 	 v i r t u a l   d a t e t i m e   _ d E x p _ ( )   { r e t u r n   d E x p . _ e x e c u t e _ ( ) ; }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 }  
  
 	 v i r t u a l   v o i d   _ b e f o r e E x e c u t e _ ( )  
 	 {  
 	 	 S y m b o l   =   ( s t r i n g ) C u r r e n t S y m b o l ( ) ;  
 	 	 A r r o w C o l o r S e l l   =   ( c o l o r ) c l r R e d ;  
 	 }  
 } ;  
  
 / /   B l o c k   9   ( C o n d i t i o n )  
 c l a s s   B l o c k 7 :   p u b l i c   M D L _ C o n d i t i o n < M D L I C _ c a n d l e s _ c a n d l e s , d o u b l e , s t r i n g , M D L I C _ i n d i c a t o r s _ i M A , d o u b l e , i n t >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 7 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   7 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 9 " ;  
  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 1 ]   =   { 5 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
  
 	 	 / /   I C   i n p u t   p a r a m e t e r s  
 	 	 L o . C a n d l e I D   =   1 ;  
 	 	 R o . M A p e r i o d   =   5 ;  
 	 	 / /   B l o c k   i n p u t   p a r a m e t e r s  
 	 	 c o m p a r e   =   " < " ;  
 	 }  
  
 	 p u b l i c :   / *   C u s t o m   m e t h o d s   * /  
 	 v i r t u a l   d o u b l e   _ L o _ ( )   {  
 	 	 L o . S y m b o l   =   C u r r e n t S y m b o l ( ) ;  
 	 	 L o . P e r i o d   =   P E R I O D _ D 1 ;  
  
 	 	 r e t u r n   L o . _ e x e c u t e _ ( ) ;  
 	 }  
 	 v i r t u a l   d o u b l e   _ R o _ ( )   {  
 	 	 R o . M A m e t h o d   =   M O D E _ S M A ;  
 	 	 R o . A p p l i e d P r i c e   =   P R I C E _ C L O S E ;  
 	 	 R o . S y m b o l   =   C u r r e n t S y m b o l ( ) ;  
 	 	 R o . P e r i o d   =   C u r r e n t T i m e f r a m e ( ) ;  
  
 	 	 r e t u r n   R o . _ e x e c u t e _ ( ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 5 ] . r u n ( 7 ) ;  
 	 	 }  
 	 }  
 } ;  
  
 / /   B l o c k   1 0   ( P r i c e   � & g t ;   I n d i c a t o r )  
 c l a s s   B l o c k 8 :   p u b l i c   M D L _ P r i c e C r o s s U p I n d i c a t o r < M D L I C _ i n d i c a t o r s _ i M A , d o u b l e , d o u b l e >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 8 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   8 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 1 0 " ;  
  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 1 ]   =   { 2 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
  
 	 	 / /   I C   i n p u t   p a r a m e t e r s  
 	 	 I n d i c a t o r . M A p e r i o d   =   5 ;  
 	 }  
  
 	 p u b l i c :   / *   C u s t o m   m e t h o d s   * /  
 	 v i r t u a l   d o u b l e   _ I n d i c a t o r _ ( )   {  
 	 	 I n d i c a t o r . M A m e t h o d   =   M O D E _ S M A ;  
 	 	 I n d i c a t o r . A p p l i e d P r i c e   =   P R I C E _ C L O S E ;  
 	 	 I n d i c a t o r . S y m b o l   =   C u r r e n t S y m b o l ( ) ;  
 	 	 I n d i c a t o r . P e r i o d   =   P E R I O D _ D 1 ;  
  
 	 	 r e t u r n   I n d i c a t o r . _ e x e c u t e _ ( ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 2 ] . r u n ( 8 ) ;  
 	 	 }  
 	 }  
 } ;  
  
 / /   B l o c k   1 1   ( P r i c e   � & l t ;   I n d i c a t o r )  
 c l a s s   B l o c k 9 :   p u b l i c   M D L _ P r i c e C r o s s D n I n d i c a t o r < M D L I C _ i n d i c a t o r s _ i M A , d o u b l e , d o u b l e >  
 {  
  
 	 p u b l i c :   / *   C o n s t r u c t o r   * /  
 	 B l o c k 9 ( )   {  
 	 	 _ _ b l o c k _ n u m b e r   =   9 ;  
 	 	 _ _ b l o c k _ u s e r _ n u m b e r   =   " 1 1 " ;  
  
  
 	 	 / /   F i l l   t h e   l i s t   o f   o u t b o u n d   b l o c k s  
 	 	 i n t   _ _ _ o u t b o u n d _ b l o c k s [ 1 ]   =   { 5 } ;  
 	 	 A r r a y C o p y ( _ _ o u t b o u n d _ b l o c k s ,   _ _ _ o u t b o u n d _ b l o c k s ) ;  
  
 	 	 / /   I C   i n p u t   p a r a m e t e r s  
 	 	 I n d i c a t o r . M A p e r i o d   =   5 ;  
 	 }  
  
 	 p u b l i c :   / *   C u s t o m   m e t h o d s   * /  
 	 v i r t u a l   d o u b l e   _ I n d i c a t o r _ ( )   {  
 	 	 I n d i c a t o r . M A m e t h o d   =   M O D E _ S M A ;  
 	 	 I n d i c a t o r . A p p l i e d P r i c e   =   P R I C E _ C L O S E ;  
 	 	 I n d i c a t o r . S y m b o l   =   C u r r e n t S y m b o l ( ) ;  
 	 	 I n d i c a t o r . P e r i o d   =   P E R I O D _ D 1 ;  
  
 	 	 r e t u r n   I n d i c a t o r . _ e x e c u t e _ ( ) ;  
 	 }  
  
 	 p u b l i c :   / *   C a l l b a c k   &   R u n   * /  
 	 v i r t u a l   v o i d   _ c a l l b a c k _ ( i n t   v a l u e )   {  
 	 	 i f   ( v a l u e   = =   1 )   {  
 	 	 	 _ b l o c k s _ [ 5 ] . r u n ( 9 ) ;  
 	 	 }  
 	 }  
 } ;  
  
  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / /   |                                                                                                       F u n c t i o n s                                                                                                             |   / /  
 / /   |                                                                   S y s t e m   a n d   C u s t o m   f u n c t i o n s   u s e d   i n   t h e   p r o g r a m                                                                     |   / /  
 / /   + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +   / /  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
  
  
 d o u b l e   A c c o u n t B a l a n c e A t S t a r t ( )  
 {  
       / /   T h i s   f u n c t i o n   M U S T   b e   r u n   o n c e   a t   p o g r a m ' s   s t a r t  
 	 s t a t i c   d o u b l e   m e m o r y   =   0 ;  
  
 	 i f   ( m e m o r y   = =   0 )   m e m o r y   =   N o r m a l i z e D o u b l e ( A c c o u n t I n f o D o u b l e ( A C C O U N T _ B A L A N C E ) ,   2 ) ;  
  
 	 r e t u r n   m e m o r y ;  
 }  
  
 d o u b l e   A l i g n L o t s ( s t r i n g   s y m b o l ,   d o u b l e   l o t s ,   d o u b l e   l o w e r l o t s = 0 ,   d o u b l e   u p p e r l o t s = 0 )  
 {  
 	 d o u b l e   L o t S t e p   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ V O L U M E _ S T E P ) ;  
 	 d o u b l e   L o t S i z e   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ T R A D E _ C O N T R A C T _ S I Z E ) ;  
 	 d o u b l e   M i n L o t s   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ V O L U M E _ M I N ) ;  
 	 d o u b l e   M a x L o t s   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ V O L U M E _ M A X ) ;  
  
 	 i f   ( L o t S t e p   >   M i n L o t s )   M i n L o t s   =   L o t S t e p ;  
  
 	 i f   ( l o t s   = =   E M P T Y _ V A L U E )   { l o t s   =   0 ; }  
  
 	 l o t s   =   M a t h R o u n d ( l o t s / L o t S t e p ) * L o t S t e p ;  
  
 	 i f   ( l o t s   <   M i n L o t s )   { l o t s   =   M i n L o t s ; }  
 	 i f   ( l o t s   >   M a x L o t s )   { l o t s   =   M a x L o t s ; }  
  
 	 i f   ( l o w e r l o t s   >   0 )  
 	 {  
 	 	 l o w e r l o t s   =   M a t h R o u n d ( l o w e r l o t s / L o t S t e p ) * L o t S t e p ;  
 	 	 i f   ( l o t s   <   l o w e r l o t s )   { l o t s   =   l o w e r l o t s ; }  
 	 }  
  
 	 i f   ( u p p e r l o t s   >   0 )  
 	 {  
 	 	 u p p e r l o t s   =   M a t h R o u n d ( u p p e r l o t s / L o t S t e p ) * L o t S t e p ;  
 	 	 i f   ( l o t s   >   u p p e r l o t s )   { l o t s   =   u p p e r l o t s ; }  
 	 }  
  
 	 r e t u r n   l o t s ;  
 }  
  
 d o u b l e   A l i g n S t o p L o s s (  
 	 s t r i n g   s y m b o l ,  
 	 i n t   t y p e ,  
 	 d o u b l e   p r i c e ,  
 	 d o u b l e   s l o   =   0 ,   / /   o r i g i n a l   s l ,   u s e d   w h e n   m o d i f y i n g  
 	 d o u b l e   s l l   =   0 ,  
 	 d o u b l e   s l p   =   0 ,  
 	 b o o l   c o n s i d e r _ f r e e z e l e v e l   =   f a l s e  
 	 )  
 {  
 	 d o u b l e   s l   =   0 ;  
  
 	 i f   ( M a t h A b s ( s l l )   = =   E M P T Y _ V A L U E )   { s l l   =   0 ; }  
 	 i f   ( M a t h A b s ( s l p )   = =   E M P T Y _ V A L U E )   { s l p   =   0 ; }  
  
 	 i f   ( s l l   = =   0   & &   s l p   = =   0 )  
 	 {  
 	 	 r e t u r n   0 ;  
 	 }  
  
 	 i f   ( p r i c e   < =   0 )  
 	 {  
 	 	 P r i n t ( " A l i g n S t o p L o s s ( )   e r r o r :   N o   p r i c e   e n t e r e d " ) ;  
  
 	 	 r e t u r n ( - 1 ) ;  
 	 }  
  
 	 d o u b l e   p o i n t   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ P O I N T ) ;  
 	 i n t   d i g i t s       =   ( i n t ) S y m b o l I n f o I n t e g e r ( s y m b o l ,   S Y M B O L _ D I G I T S ) ;  
 	 s l p                     =   s l p   *   P i p V a l u e ( s y m b o l )   *   p o i n t ;  
  
 	 / / - -   b u y - s e l l   i d e n t i f i e r   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 i n t   b s   =   1 ;  
  
 	 i f   (  
 	 	       t y p e   = =   O P _ S E L L  
 	 	 | |   t y p e   = =   O P _ S E L L S T O P  
 	 	 | |   t y p e   = =   O P _ S E L L L I M I T  
  
 	 	 )  
 	 {  
 	 	 b s   =   - 1 ;  
 	 }  
  
 	 / / - -   p r i c e s   t h a t   w i l l   b e   u s e d   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 d o u b l e   a s k b i d   =   p r i c e ;  
 	 d o u b l e   b i d a s k   =   p r i c e ;  
 	  
 	 i f   ( t y p e   <   2 )  
 	 {  
 	 	 d o u b l e   a s k   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K ) ;  
 	 	 d o u b l e   b i d   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D ) ;  
 	 	  
 	 	 a s k b i d   =   a s k ;  
 	 	 b i d a s k   =   b i d ;  
  
 	 	 i f   ( b s   <   0 )  
 	 	 {  
 	 	     a s k b i d   =   b i d ;  
 	 	     b i d a s k   =   a s k ;  
 	 	 }  
 	 }  
  
 	 / / - -   b u i l d   s l   l e v e l   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -    
 	 i f   ( s l l   = =   0   & &   s l p   ! =   0 )   { s l l   =   p r i c e ; }  
  
 	 i f   ( s l l   >   0 )   { s l   =   s l l   -   s l p   *   b s ; }  
  
 	 i f   ( s l   <   0 )  
 	 {  
 	 	 r e t u r n   - 1 ;  
 	 }  
  
 	 s l     =   N o r m a l i z e D o u b l e ( s l ,   d i g i t s ) ;  
 	 s l o   =   N o r m a l i z e D o u b l e ( s l o ,   d i g i t s ) ;  
  
 	 i f   ( s l   = =   s l o )  
 	 {  
 	 	 r e t u r n   s l ;  
 	 }  
  
 	 / / - -   b u i l d   l i m i t   l e v e l s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 d o u b l e   m i n s t o p s   =   ( d o u b l e ) S y m b o l I n f o I n t e g e r ( s y m b o l ,   S Y M B O L _ T R A D E _ S T O P S _ L E V E L ) ;  
  
 	 i f   ( c o n s i d e r _ f r e e z e l e v e l   = =   t r u e )  
 	 {  
 	 	 d o u b l e   f r e e z e l e v e l   =   ( d o u b l e ) S y m b o l I n f o I n t e g e r ( s y m b o l ,   S Y M B O L _ T R A D E _ F R E E Z E _ L E V E L ) ;  
  
 	 	 i f   ( f r e e z e l e v e l   >   m i n s t o p s )   { m i n s t o p s   =   f r e e z e l e v e l ; }  
 	 }  
  
 	 m i n s t o p s   =   N o r m a l i z e D o u b l e ( m i n s t o p s   *   p o i n t , d i g i t s ) ;  
  
 	 d o u b l e   s l l i m i t   =   b i d a s k   -   m i n s t o p s   *   b s ;   / /   S L   m i n   p r i c e   l e v e l  
  
 	 / / - -   c h e c k   a n d   a l i g n   s l ,   p r i n t   e r r o r s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 / / - -   d o   n o t   d o   i t   w h e n   t h e   s t o p   i s   t h e   s a m e   a s   t h e   o r i g i n a l  
 	 i f   ( s l   >   0   & &   s l   ! =   s l o )  
 	 {  
 	 	 i f   ( ( b s   >   0   & &   s l   >   a s k b i d )   | |   ( b s   <   0   & &   s l   <   a s k b i d ) )  
 	 	 {  
 	 	 	 s t r i n g   a b s t r   =   " " ;  
  
 	 	 	 i f   ( b s   >   0 )   { a b s t r   =   " B i d " ; }   e l s e   { a b s t r   =   " A s k " ; }  
  
 	 	 	 P r i n t (  
 	 	 	 	 " E r r o r :   I n v a l i d   S L   r e q u e s t e d   ( " ,  
 	 	 	 	 D o u b l e T o S t r ( s l ,   d i g i t s ) ,  
 	 	 	 	 "   f o r   " ,   a b s t r ,   "   p r i c e   " ,  
 	 	 	 	 b i d a s k ,  
 	 	 	 	 " ) "  
 	 	 	 ) ;  
  
 	 	 	 r e t u r n   - 1 ;  
 	 	 }  
 	 	 e l s e   i f   ( ( b s   >   0   & &   s l   >   s l l i m i t )   | |   ( b s   <   0   & &   s l   <   s l l i m i t ) )  
 	 	 {  
 	 	 	 i f   ( U S E _ V I R T U A L _ S T O P S )  
 	 	 	 {  
 	 	 	 	 r e t u r n   s l ;  
 	 	 	 }  
  
 	 	 	 P r i n t (  
 	 	 	 	 " W a r n i n g :   T o o   s h o r t   S L   r e q u e s t e d   ( " ,  
 	 	 	 	 D o u b l e T o S t r ( s l ,   d i g i t s ) ,  
 	 	 	 	 "   o r   " ,  
 	 	 	 	 D o u b l e T o S t r ( M a t h A b s ( s l   -   a s k b i d )   /   p o i n t ,   0 ) ,  
 	 	 	 	 "   p o i n t s ) ,   m i n i m u m   w i l l   b e   t a k e n   ( " ,  
 	 	 	 	 D o u b l e T o S t r ( s l l i m i t ,   d i g i t s ) ,  
 	 	 	 	 "   o r   " ,  
 	 	 	 	 D o u b l e T o S t r ( M a t h A b s ( a s k b i d   -   s l l i m i t )   /   p o i n t ,   0 ) ,  
 	 	 	 	 "   p o i n t s ) "  
 	 	 	 ) ;  
  
 	 	 	 s l   =   s l l i m i t ;  
  
 	 	 	 r e t u r n   s l ;  
 	 	 }  
 	 }  
  
 	 / /   a l i g n   b y   t h e   t i c k s i z e  
 	 d o u b l e   t i c k s i z e   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ T R A D E _ T I C K _ S I Z E ) ;  
 	 s l   =   M a t h R o u n d ( s l   /   t i c k s i z e )   *   t i c k s i z e ;  
  
 	 r e t u r n   s l ;  
 }  
  
 d o u b l e   A l i g n T a k e P r o f i t (  
 	 s t r i n g   s y m b o l ,  
 	 i n t   t y p e ,  
 	 d o u b l e   p r i c e ,  
 	 d o u b l e   t p o   =   0 ,   / /   o r i g i n a l   t p ,   u s e d   w h e n   m o d i f y i n g  
 	 d o u b l e   t p l   =   0 ,  
 	 d o u b l e   t p p   =   0 ,  
 	 b o o l   c o n s i d e r _ f r e e z e l e v e l   =   f a l s e  
 	 )  
 {  
 	 d o u b l e   t p = 0 ;  
 	  
 	 i f   ( M a t h A b s ( t p l )   = =   E M P T Y _ V A L U E )   { t p l   =   0 ; }  
 	 i f   ( M a t h A b s ( t p p )   = =   E M P T Y _ V A L U E )   { t p p   =   0 ; }  
  
 	 i f   ( t p l   = =   0   & &   t p p   = =   0 )  
 	 {  
 	 	 r e t u r n   0 ;  
 	 }  
  
 	 i f   ( p r i c e   < =   0 )  
 	 {  
 	 	 P r i n t ( " A l i g n T a k e P r o f i t ( )   e r r o r :   N o   p r i c e   e n t e r e d " ) ;  
  
 	 	 r e t u r n   - 1 ;  
 	 }  
  
 	 d o u b l e   p o i n t   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ P O I N T ) ;  
 	 i n t   d i g i t s       =   ( i n t ) S y m b o l I n f o I n t e g e r ( s y m b o l ,   S Y M B O L _ D I G I T S ) ;  
 	 t p p                     =   t p p   *   P i p V a l u e ( s y m b o l )   *   p o i n t ;  
 	  
 	 / / - -   b u y - s e l l   i d e n t i f i e r   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 i n t   b s   =   1 ;  
  
 	 i f   (  
 	 	       t y p e   = =   O P _ S E L L  
 	 	 | |   t y p e   = =   O P _ S E L L S T O P  
 	 	 | |   t y p e   = =   O P _ S E L L L I M I T  
  
 	 	 )  
 	 {  
 	 	 b s   =   - 1 ;  
 	 }  
 	  
 	 / / - -   p r i c e s   t h a t   w i l l   b e   u s e d   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 d o u b l e   a s k b i d   =   p r i c e ;  
 	 d o u b l e   b i d a s k   =   p r i c e ;  
 	  
 	 i f   ( t y p e   <   2 )  
 	 {  
 	 	 d o u b l e   a s k   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K ) ;  
 	 	 d o u b l e   b i d   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D ) ;  
 	 	  
 	 	 a s k b i d   =   a s k ;  
 	 	 b i d a s k   =   b i d ;  
  
 	 	 i f   ( b s   <   0 )  
 	 	 {  
 	 	     a s k b i d   =   b i d ;  
 	 	     b i d a s k   =   a s k ;  
 	 	 }  
 	 }  
 	  
 	 / / - -   b u i l d   t p   l e v e l   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -    
 	 i f   ( t p l   = =   0   & &   t p p   ! =   0 )   { t p l   =   p r i c e ; }  
  
 	 i f   ( t p l   >   0 )   { t p   =   t p l   +   t p p   *   b s ; }  
 	  
 	 i f   ( t p   <   0 )  
 	 {  
 	 	 r e t u r n   - 1 ;  
 	 }  
  
 	 t p     =   N o r m a l i z e D o u b l e ( t p ,   d i g i t s ) ;  
 	 t p o   =   N o r m a l i z e D o u b l e ( t p o ,   d i g i t s ) ;  
  
 	 i f   ( t p   = =   t p o )  
 	 {  
 	 	 r e t u r n   t p ;  
 	 }  
 	  
 	 / / - -   b u i l d   l i m i t   l e v e l s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 d o u b l e   m i n s t o p s   =   ( d o u b l e ) S y m b o l I n f o I n t e g e r ( s y m b o l ,   S Y M B O L _ T R A D E _ S T O P S _ L E V E L ) ;  
  
 	 i f   ( c o n s i d e r _ f r e e z e l e v e l   = =   t r u e )  
 	 {  
 	 	 d o u b l e   f r e e z e l e v e l   =   ( d o u b l e ) S y m b o l I n f o I n t e g e r ( s y m b o l ,   S Y M B O L _ T R A D E _ F R E E Z E _ L E V E L ) ;  
  
 	 	 i f   ( f r e e z e l e v e l   >   m i n s t o p s )   { m i n s t o p s   =   f r e e z e l e v e l ; }  
 	 }  
  
 	 m i n s t o p s   =   N o r m a l i z e D o u b l e ( m i n s t o p s   *   p o i n t , d i g i t s ) ;  
 	  
 	 d o u b l e   t p l i m i t   =   b i d a s k   +   m i n s t o p s   *   b s ;   / /   T P   m i n   p r i c e   l e v e l  
 	  
 	 / / - -   c h e c k   a n d   a l i g n   t p ,   p r i n t   e r r o r s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 / / - -   d o   n o t   d o   i t   w h e n   t h e   s t o p   i s   t h e   s a m e   a s   t h e   o r i g i n a l  
 	 i f   ( t p   >   0   & &   t p   ! =   t p o )  
 	 {  
 	 	 i f   ( ( b s   >   0   & &   t p   <   b i d a s k )   | |   ( b s   <   0   & &   t p   >   b i d a s k ) )  
 	 	 {  
 	 	 	 s t r i n g   a b s t r   =   " " ;  
  
 	 	 	 i f   ( b s   >   0 )   { a b s t r   =   " B i d " ; }   e l s e   { a b s t r   =   " A s k " ; }  
  
 	 	 	 P r i n t (  
 	 	 	 	 " E r r o r :   I n v a l i d   T P   r e q u e s t e d   ( " ,  
 	 	 	 	 D o u b l e T o S t r ( t p ,   d i g i t s ) ,  
 	 	 	 	 "   f o r   " ,   a b s t r ,   "   p r i c e   " ,  
 	 	 	 	 b i d a s k ,  
 	 	 	 	 " ) "  
 	 	 	 ) ;  
  
 	 	 	 r e t u r n   - 1 ;  
 	 	 }  
 	 	 e l s e   i f   ( ( b s   >   0   & &   t p   <   t p l i m i t )   | |   ( b s   <   0   & &   t p   >   t p l i m i t ) )  
 	 	 {  
 	 	 	 i f   ( U S E _ V I R T U A L _ S T O P S )  
 	 	 	 {  
 	 	 	 	 r e t u r n   t p ;  
 	 	 	 }  
  
 	 	 	 P r i n t (  
 	 	 	 	 " W a r n i n g :   T o o   s h o r t   T P   r e q u e s t e d   ( " ,  
 	 	 	 	 D o u b l e T o S t r ( t p ,   d i g i t s ) ,  
 	 	 	 	 "   o r   " ,  
 	 	 	 	 D o u b l e T o S t r ( M a t h A b s ( t p   -   a s k b i d )   /   p o i n t ,   0 ) ,  
 	 	 	 	 "   p o i n t s ) ,   m i n i m u m   w i l l   b e   t a k e n   ( " ,  
 	 	 	 	 D o u b l e T o S t r ( t p l i m i t ,   d i g i t s ) ,  
 	 	 	 	 "   o r   " ,  
 	 	 	 	 D o u b l e T o S t r ( M a t h A b s ( a s k b i d   -   t p l i m i t )   /   p o i n t ,   0 ) ,  
 	 	 	 	 "   p o i n t s ) "  
 	 	 	 ) ;  
  
 	 	 	 t p   =   t p l i m i t ;  
  
 	 	 	 r e t u r n   t p ;  
 	 	 }  
 	 }  
 	  
 	 / /   a l i g n   b y   t h e   t i c k s i z e  
 	 d o u b l e   t i c k s i z e   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ T R A D E _ T I C K _ S I Z E ) ;  
 	 t p   =   M a t h R o u n d ( t p   /   t i c k s i z e )   *   t i c k s i z e ;  
 	  
 	 r e t u r n   t p ;  
 }  
  
 t e m p l a t e < t y p e n a m e   T >  
 b o o l   A r r a y E n s u r e V a l u e ( T   & a r r a y [ ] ,   T   v a l u e )  
 {  
 	 i n t   s i z e       =   A r r a y S i z e ( a r r a y ) ;  
 	  
 	 i f   ( s i z e   >   0 )  
 	 {  
 	 	 i f   ( I n A r r a y ( a r r a y ,   v a l u e ) )  
 	 	 {  
 	 	 	 / /   v a l u e   f o u n d   - >   e x i t  
 	 	 	 r e t u r n   f a l s e ;   / /   n o   v a l u e   a d d e d  
 	 	 }  
 	 }  
 	  
 	 / /   v a l u e   d o e s   n o t   e x i s t s   - >   a d d   i t  
 	 A r r a y R e s i z e ( a r r a y ,   s i z e + 1 ) ;  
 	 a r r a y [ s i z e ]   =   v a l u e ;  
 	 	  
 	 r e t u r n   t r u e ;   / /   v a l u e   a d d e d  
 }  
  
 t e m p l a t e < t y p e n a m e   T >  
 i n t   A r r a y S e a r c h ( T   & a r r a y [ ] ,   T   v a l u e )  
 {  
 	 s t a t i c   i n t   i n d e x ;          
 	 s t a t i c   i n t   s i z e ;  
 	  
 	 i n d e x   =   - 1 ;  
 	 s i z e     =   A r r a y S i z e ( a r r a y ) ;  
  
 	 f o r   ( i n t   i = 0 ;   i < s i z e ;   i + + )  
 	 {  
 	 	 i f   ( a r r a y [ i ]   = =   v a l u e )  
 	 	 {  
 	 	 	 i n d e x   =   i ;  
 	 	 	 b r e a k ;  
 	 	 }      
 	 }  
  
       r e t u r n   i n d e x ;  
 }  
  
 t e m p l a t e < t y p e n a m e   T >  
 b o o l   A r r a y S t r i p K e y ( T   & a r r a y [ ] ,   i n t   k e y )  
 {  
 	 i n t   x         =   0 ;  
 	 i n t   s i z e   =   A r r a y S i z e ( a r r a y ) ;  
 	  
 	 f o r   ( i n t   i = 0 ;   i < s i z e ;   i + + )  
 	 {  
 	 	 i f   ( i   ! =   k e y )  
 	 	 {  
 	 	 	 a r r a y [ x ]   =   a r r a y [ i ] ;  
 	 	 	 x + + ;  
 	 	 }  
 	 }  
 	 	  
 	 i f   ( x   <   s i z e )  
 	 {  
 	 	 A r r a y R e s i z e ( a r r a y ,   x ) ;  
 	 	  
 	 	 r e t u r n   t r u e ;   / /   s t r i p p e d  
 	 }  
 	  
 	 r e t u r n   f a l s e ;   / /   n o t   s t r i p p e d  
 }  
  
 t e m p l a t e < t y p e n a m e   T >  
 b o o l   A r r a y S t r i p V a l u e ( T   & a r r a y [ ] ,   T   v a l u e )  
 {  
 	 i n t   x         =   0 ;  
 	 i n t   s i z e   =   A r r a y S i z e ( a r r a y ) ;  
 	  
 	 f o r   ( i n t   i = 0 ;   i < s i z e ;   i + + )  
 	 {  
 	 	 i f   ( a r r a y [ i ]   ! =   v a l u e )  
 	 	 {  
 	 	 	 a r r a y [ x ]   =   a r r a y [ i ] ;  
 	 	 	 x + + ;  
 	 	 }  
 	 }  
 	  
 	 i f   ( x   <   s i z e )  
 	 {  
 	 	 A r r a y R e s i z e ( a r r a y ,   x ) ;  
 	 	  
 	 	 r e t u r n   t r u e ;   / /   s t r i p p e d  
 	 }  
 	  
 	 r e t u r n   f a l s e ;   / /   n o t   s t r i p p e d  
 }  
  
 d o u b l e   B e t 1 3 2 6 (  
 	 s t r i n g   g r o u p ,  
 	 s t r i n g   s y m b o l ,  
 	 d o u b l e   i n i t i a l _ l o t s ,  
 	 b o o l   r e v e r s e   =   f a l s e  
 )   {      
 	 i n t   p o s                         =   0 ;  
 	 i n t   t o t a l                     =   0 ;  
 	 d o u b l e   l o t s                 =   0 ;  
 	 d o u b l e   p r o f i t             =   0 ;  
 	 i n t   p r o f i t _ o r _ l o s s   =   0 ;   / /   0   -   u n k n o w n ,   1   -   p r o f i t ,   - 1   -   l o s s  
        
       / / - -   t r y   t o   g e t   l a s t   l o t   s i z e   f r o m   r u n n i n g   t r a d e s  
       t o t a l   =   T r a d e s T o t a l ( ) ;  
 	  
       f o r   ( p o s   =   t o t a l   -   1 ;   p o s   > =   0 ;   p o s - - )  
       {  
             i f   ( T r a d e S e l e c t B y I n d e x ( p o s ,   " g r o u p " ,   g r o u p ,   " s y m b o l " ,   s y m b o l ) )  
 	 	 {  
 	 	 	 i f   ( T i m e C u r r e n t ( )   -   O r d e r O p e n T i m e ( )   <   3 )   { c o n t i n u e ; }  
 	 	 	 i f   ( O r d e r E x p i r a t i o n ( )   >   0   & &   O r d e r E x p i r a t i o n ( )   < =   O r d e r C l o s e T i m e ( ) )   { c o n t i n u e ; }   / /   n o   e x p i r e d   p o  
  
 	 	 	 i f   ( l o t s   = =   0 )  
 	 	 	 {  
 	 	 	 	 l o t s   =   O r d e r L o t s ( ) ;  
 	 	 	 }  
  
 	 	 	 p r o f i t   =   O r d e r C l o s e P r i c e ( )   -   O r d e r O p e n P r i c e ( ) ;  
 	 	 	 p r o f i t   =   N o r m a l i z e D o u b l e ( p r o f i t ,   S y m b o l D i g i t s ( O r d e r S y m b o l ( ) ) ) ;  
  
 	 	 	 i f   ( I s O r d e r T y p e S e l l ( ) )  
 	 	 	 {  
 	 	 	 	 p r o f i t   =   - 1   *   p r o f i t ;  
 	 	 	 }  
  
 	 	 	 i f   ( p r o f i t   = =   0 )  
 	 	 	 {  
 	 	 	 	 r e t u r n   l o t s ;  
 	 	 	 }  
  
 	 	 	 i f   ( p r o f i t < 0 )   { p r o f i t _ o r _ l o s s = - 1 ; }  
 	 	 	 e l s e   { p r o f i t _ o r _ l o s s = 1 ; }  
  
 	 	 	 b r e a k ;  
 	 	 }  
       }  
        
       / / - -   i f   n o   r u n n i n g   t r a d e   w a s   f o u n d ,   s e a r c h   i n   h i s t o r y   t r a d e s  
       i f   ( l o t s = = 0 )  
       {  
             t o t a l   =   H i s t o r y T r a d e s T o t a l ( ) ;  
  
 	 	 f o r   ( p o s   =   t o t a l   -   1 ;   p o s   > =   0 ;   p o s - - )  
 	 	 {  
                   i f   ( H i s t o r y T r a d e S e l e c t B y I n d e x ( p o s ,   " g r o u p " ,   g r o u p ,   " s y m b o l " ,   s y m b o l ) )  
 	 	 	 {  
 	 	 	 	 i f   ( T i m e C u r r e n t ( )   -   O r d e r O p e n T i m e ( )   <   3 )   { c o n t i n u e ; }  
  
 	 	 	 	 i f   ( l o t s = = 0 )   {  
 	 	 	 	 	 l o t s = O r d e r L o t s ( ) ;  
 	 	 	 	 }  
  
 	 	 	 	 p r o f i t   =   O r d e r C l o s e P r i c e ( ) - O r d e r O p e n P r i c e ( ) ;  
 	 	 	 	 p r o f i t   =   N o r m a l i z e D o u b l e ( p r o f i t ,   S y m b o l D i g i t s ( O r d e r S y m b o l ( ) ) ) ;  
 	 	 	 	 i f   ( I s O r d e r T y p e S e l l ( ) )   { p r o f i t   =   - 1 * p r o f i t ; }  
 	 	 	 	 i f   ( p r o f i t   = =   0 )   {  
 	 	 	 	 	 r e t u r n ( l o t s ) ;  
 	 	 	 	 }  
  
 	 	 	 	 i f   ( p r o f i t < 0 )   { p r o f i t _ o r _ l o s s = - 1 ; }  
 	 	 	 	 e l s e   { p r o f i t _ o r _ l o s s = 1 ; }  
  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
             }  
       }  
        
       / / - -  
       i f   ( i n i t i a l _ l o t s   <   M a r k e t I n f o ( s y m b o l , M O D E _ M I N L O T ) )   {  
             i n i t i a l _ l o t s   =   M a r k e t I n f o ( s y m b o l , M O D E _ M I N L O T ) ;      
       }  
  
       i f   ( l o t s = = 0 )   { l o t s   =   i n i t i a l _ l o t s ; }  
       e l s e  
       {  
             i f   ( ( r e v e r s e = = f a l s e   & &   p r o f i t _ o r _ l o s s = = 1 )   | |   ( r e v e r s e = = t r u e   & &   p r o f i t _ o r _ l o s s = = - 1 ) )  
             {  
                   d o u b l e   d i v   =   l o t s / i n i t i a l _ l o t s ;  
                    
                   i f   ( d i v   <   1 . 5 )   { l o t s   =   i n i t i a l _ l o t s * 3 ; }  
                   e l s e   i f   ( d i v   <   2 . 5 )   { l o t s   =   i n i t i a l _ l o t s * 6 ; }  
                   e l s e   i f   ( d i v   <   3 . 5 )   { l o t s   =   i n i t i a l _ l o t s * 2 ; }  
                   e l s e   { l o t s   =   i n i t i a l _ l o t s ; }  
             }  
             e l s e   {  
                   l o t s   =   i n i t i a l _ l o t s ;  
             }  
       }  
        
       r e t u r n   l o t s ;  
 }  
  
 d o u b l e   B e t D a l e m b e r t (  
 	 s t r i n g   g r o u p ,  
 	 s t r i n g   s y m b o l ,  
 	 d o u b l e   i n i t i a l _ l o t s ,  
 	 d o u b l e   r e v e r s e   =   f a l s e  
 )   {      
 	 i n t   p o s                         =   0 ;  
 	 i n t   t o t a l                     =   0 ;  
 	 d o u b l e   l o t s                 =   0 ;  
 	 d o u b l e   p r o f i t             =   0 ;  
 	 i n t   p r o f i t _ o r _ l o s s   =   0 ;   / /   0   -   u n k n o w n ,   1   -   p r o f i t ,   - 1   -   l o s s  
        
       / / - -   t r y   t o   g e t   l a s t   l o t   s i z e   f r o m   r u n n i n g   t r a d e s  
       t o t a l   =   T r a d e s T o t a l ( ) ;  
 	  
       f o r   ( p o s   =   t o t a l   -   1 ;   p o s   > =   0 ;   p o s - - )  
       {  
             i f   ( T r a d e S e l e c t B y I n d e x ( p o s ,   " g r o u p " ,   g r o u p ,   " s y m b o l " ,   s y m b o l ) )  
 	 	 {  
 	 	 	 i f   ( T i m e C u r r e n t ( )   -   O r d e r O p e n T i m e ( )   <   3 )   { c o n t i n u e ; }  
 	 	 	 i f   ( O r d e r E x p i r a t i o n ( )   >   0   & &   O r d e r E x p i r a t i o n ( )   < =   O r d e r C l o s e T i m e ( ) )   { c o n t i n u e ; }   / /   n o   e x p i r e d   p o  
  
 	 	 	 i f   ( l o t s   = =   0 )  
 	 	 	 {  
 	 	 	 	 l o t s   =   O r d e r L o t s ( ) ;  
 	 	 	 }  
  
 	 	 	 p r o f i t   =   O r d e r C l o s e P r i c e ( )   -   O r d e r O p e n P r i c e ( ) ;  
 	 	 	 p r o f i t   =   N o r m a l i z e D o u b l e ( p r o f i t ,   S y m b o l D i g i t s ( O r d e r S y m b o l ( ) ) ) ;  
  
 	 	 	 i f   ( I s O r d e r T y p e S e l l ( ) )  
 	 	 	 {  
 	 	 	 	 p r o f i t   =   - 1   *   p r o f i t ;  
 	 	 	 }  
  
 	 	 	 i f   ( p r o f i t   = =   0 )  
 	 	 	 {  
 	 	 	 	 r e t u r n   l o t s ;  
 	 	 	 }  
  
 	 	 	 i f   ( p r o f i t < 0 )   { p r o f i t _ o r _ l o s s = - 1 ; }  
 	 	 	 e l s e   { p r o f i t _ o r _ l o s s = 1 ; }  
  
 	 	 	 b r e a k ;  
 	 	 }  
       }  
        
       / / - -   i f   n o   r u n n i n g   t r a d e   w a s   f o u n d ,   s e a r c h   i n   h i s t o r y   t r a d e s  
       i f   ( l o t s = = 0 )  
       {  
             t o t a l   =   H i s t o r y T r a d e s T o t a l ( ) ;  
  
 	 	 f o r   ( p o s   =   t o t a l   -   1 ;   p o s   > =   0 ;   p o s - - )  
 	 	 {  
                   i f   ( H i s t o r y T r a d e S e l e c t B y I n d e x ( p o s ,   " g r o u p " ,   g r o u p ,   " s y m b o l " ,   s y m b o l ) )  
 	 	 	 {  
 	 	 	 	 i f   ( T i m e C u r r e n t ( )   -   O r d e r O p e n T i m e ( )   <   3 )   { c o n t i n u e ; }  
  
 	 	 	 	 i f   ( l o t s = = 0 )   {  
 	 	 	 	 	 l o t s = O r d e r L o t s ( ) ;  
 	 	 	 	 }  
  
 	 	 	 	 p r o f i t   =   O r d e r C l o s e P r i c e ( ) - O r d e r O p e n P r i c e ( ) ;  
 	 	 	 	 p r o f i t   =   N o r m a l i z e D o u b l e ( p r o f i t ,   S y m b o l D i g i t s ( O r d e r S y m b o l ( ) ) ) ;  
 	 	 	 	 i f   ( I s O r d e r T y p e S e l l ( ) )   { p r o f i t   =   - 1 * p r o f i t ; }  
 	 	 	 	 i f   ( p r o f i t   = =   0 )   {  
 	 	 	 	 	 r e t u r n ( l o t s ) ;  
 	 	 	 	 }  
  
 	 	 	 	 i f   ( p r o f i t < 0 )   { p r o f i t _ o r _ l o s s = - 1 ; }  
 	 	 	 	 e l s e   { p r o f i t _ o r _ l o s s = 1 ; }  
  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
             }  
       }  
        
       / / - -  
       i f   ( i n i t i a l _ l o t s   <   M a r k e t I n f o ( s y m b o l , M O D E _ M I N L O T ) )   {  
             i n i t i a l _ l o t s   =   M a r k e t I n f o ( s y m b o l , M O D E _ M I N L O T ) ;      
       }  
  
       i f   ( l o t s = = 0 )   { l o t s   =   i n i t i a l _ l o t s ; }  
       e l s e  
       {  
             i f   ( ( r e v e r s e = = 0   & &   p r o f i t _ o r _ l o s s = = 1 )   | |   ( r e v e r s e = = 1   & &   p r o f i t _ o r _ l o s s = = - 1 ) )  
             {  
                   l o t s   =   l o t s   -   i n i t i a l _ l o t s ;  
                   i f   ( l o t s   <   i n i t i a l _ l o t s )   { l o t s   =   i n i t i a l _ l o t s ; }  
             }  
             e l s e   {  
                   l o t s   =   l o t s   +   i n i t i a l _ l o t s ;  
             }  
       }  
        
       r e t u r n   l o t s ;  
 }  
  
 d o u b l e   B e t F i b o n a c c i (  
       s t r i n g   g r o u p ,  
       s t r i n g   s y m b o l ,  
       d o u b l e   i n i t i a l _ l o t s  
 )   {  
 	 i n t   p o s                         =   0 ;  
 	 i n t   t o t a l                     =   0 ;  
 	 d o u b l e   l o t s                 =   0 ;  
 	 d o u b l e   p r o f i t             =   0 ;  
 	 i n t   p r o f i t _ o r _ l o s s   =   0 ;   / /   0   -   u n k n o w n ,   1   -   p r o f i t ,   - 1   -   l o s s  
        
       / / - -   t r y   t o   g e t   l a s t   l o t   s i z e   f r o m   r u n n i n g   t r a d e s  
       t o t a l   =   T r a d e s T o t a l ( ) ;  
 	  
       f o r   ( p o s   =   t o t a l   -   1 ;   p o s   > =   0 ;   p o s - - )  
       {  
             i f   ( T r a d e S e l e c t B y I n d e x ( p o s ,   " g r o u p " ,   g r o u p ,   " s y m b o l " ,   s y m b o l ) )  
 	 	 {  
 	 	 	 i f   ( T i m e C u r r e n t ( )   -   O r d e r O p e n T i m e ( )   <   3 )   { c o n t i n u e ; }  
 	 	 	 i f   ( O r d e r E x p i r a t i o n ( )   >   0   & &   O r d e r E x p i r a t i o n ( )   < =   O r d e r C l o s e T i m e ( ) )   { c o n t i n u e ; }   / /   n o   e x p i r e d   p o  
  
 	 	 	 i f   ( l o t s   = =   0 )  
 	 	 	 {  
 	 	 	 	 l o t s   =   O r d e r L o t s ( ) ;  
 	 	 	 }  
  
 	 	 	 p r o f i t   =   O r d e r C l o s e P r i c e ( )   -   O r d e r O p e n P r i c e ( ) ;  
 	 	 	 p r o f i t   =   N o r m a l i z e D o u b l e ( p r o f i t ,   S y m b o l D i g i t s ( O r d e r S y m b o l ( ) ) ) ;  
  
 	 	 	 i f   ( I s O r d e r T y p e S e l l ( ) )  
 	 	 	 {  
 	 	 	 	 p r o f i t   =   - 1   *   p r o f i t ;  
 	 	 	 }  
  
 	 	 	 i f   ( p r o f i t   = =   0 )  
 	 	 	 {  
 	 	 	 	 r e t u r n   l o t s ;  
 	 	 	 }  
  
 	 	 	 i f   ( p r o f i t < 0 )   { p r o f i t _ o r _ l o s s = - 1 ; }  
 	 	 	 e l s e   { p r o f i t _ o r _ l o s s = 1 ; }  
  
 	 	 	 b r e a k ;  
 	 	 }  
       }  
        
       / / - -   i f   n o   r u n n i n g   t r a d e   w a s   f o u n d ,   s e a r c h   i n   h i s t o r y   t r a d e s  
       i f   ( l o t s = = 0 )  
       {  
             t o t a l   =   H i s t o r y T r a d e s T o t a l ( ) ;  
 	 	  
             f o r   ( p o s   =   t o t a l   -   1 ;   p o s   > =   0 ;   p o s - - )  
 	 	 {  
                   i f   ( H i s t o r y T r a d e S e l e c t B y I n d e x ( p o s ,   " g r o u p " ,   g r o u p ,   " s y m b o l " ,   s y m b o l ) )  
 	 	 	 {  
 	 	 	 	 i f   ( T i m e C u r r e n t ( )   -   O r d e r O p e n T i m e ( )   <   3 )   { c o n t i n u e ; }  
  
 	 	 	 	 i f   ( l o t s = = 0 )   {  
 	 	 	 	 	 l o t s = O r d e r L o t s ( ) ;  
 	 	 	 	 }  
  
 	 	 	 	 p r o f i t   =   O r d e r C l o s e P r i c e ( ) - O r d e r O p e n P r i c e ( ) ;  
 	 	 	 	 p r o f i t   =   N o r m a l i z e D o u b l e ( p r o f i t ,   S y m b o l D i g i t s ( O r d e r S y m b o l ( ) ) ) ;  
 	 	 	 	 i f   ( I s O r d e r T y p e S e l l ( ) )   { p r o f i t   =   - 1 * p r o f i t ; }  
 	 	 	 	 i f   ( p r o f i t   = =   0 )   {  
 	 	 	 	 	 r e t u r n ( l o t s ) ;  
 	 	 	 	 }  
  
 	 	 	 	 i f   ( p r o f i t < 0 )   { p r o f i t _ o r _ l o s s = - 1 ; }  
 	 	 	 	 e l s e   { p r o f i t _ o r _ l o s s = 1 ; }  
  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
             }  
       }  
  
       / / - -  
       i f   ( i n i t i a l _ l o t s   <   M a r k e t I n f o ( s y m b o l , M O D E _ M I N L O T ) )   {  
             i n i t i a l _ l o t s   =   M a r k e t I n f o ( s y m b o l , M O D E _ M I N L O T ) ;      
       }  
  
       i f   ( l o t s = = 0 )   { l o t s   =   i n i t i a l _ l o t s ; }  
       e l s e  
       {      
             i n t   f i b o 1 = 1 ,   f i b o 2 = 0 ,   f i b o 3 = 0 ,   f i b o 4 = 0 ;  
             d o u b l e   d i v   =   l o t s / i n i t i a l _ l o t s ;  
              
             i f   ( d i v < = 0 )   { d i v = 1 ; }  
  
             w h i l e ( t r u e )  
             {  
                   f i b o 1 = f i b o 1 + f i b o 2 ;  
                   f i b o 3 = f i b o 2 ;  
                   f i b o 2 = f i b o 1 - f i b o 2 ;  
                   f i b o 4 = f i b o 2 - f i b o 3 ;  
                   i f   ( f i b o 1   >   N o r m a l i z e D o u b l e ( d i v ,   2 ) )   { b r e a k ; }  
             }  
             / / P r i n t ( " ( " + f i b o 1   +   " + "   +   f i b o 2 + " + " + f i b o 3 + " )   >   " + d i v ) ;  
             i f   ( p r o f i t _ o r _ l o s s = = 1 )  
             {  
                   i f   ( f i b o 4 < = 0 )   { f i b o 4 = 1 ; }  
                   / / P r i n t ( " P r o f i t   " + l o t s + " * " + f i b o 4 ) ;  
                   l o t s = i n i t i a l _ l o t s * ( f i b o 4 ) ;  
             }  
             e l s e   {  
                   / / P r i n t ( " L o s s   " + l o t s + " * " + f i b o 1 + " + " + f i b o 2 ) ;  
                   l o t s = i n i t i a l _ l o t s * ( f i b o 1 ) ;  
             }  
       }  
        
       l o t s = N o r m a l i z e D o u b l e ( l o t s ,   2 ) ;  
       r e t u r n   l o t s ;  
 }  
  
 d o u b l e   B e t L a b o u c h e r e (  
 	 s t r i n g   g r o u p ,  
 	 s t r i n g   s y m b o l ,  
 	 d o u b l e   i n i t i a l _ l o t s ,  
 	 s t r i n g   l i s t _ o f _ n u m b e r s ,  
 	 d o u b l e   r e v e r s e   =   f a l s e  
 )   {        
 	 i n t   p o s                         =   0 ;  
 	 i n t   t o t a l                     =   0 ;  
 	 d o u b l e   l o t s                 =   0 ;  
 	 d o u b l e   p r o f i t             =   0 ;  
 	 i n t   p r o f i t _ o r _ l o s s   =   0 ;   / /   0   -   u n k n o w n ,   1   -   p r o f i t ,   - 1   -   l o s s  
        
       / / - -   t r y   t o   g e t   l a s t   l o t   s i z e   f r o m   r u n n i n g   t r a d e s  
       t o t a l   =   T r a d e s T o t a l ( ) ;  
 	  
       f o r   ( p o s   =   t o t a l   -   1 ;   p o s   > =   0 ;   p o s - - )  
       {  
             i f   ( T r a d e S e l e c t B y I n d e x ( p o s ,   " g r o u p " ,   g r o u p ,   " s y m b o l " ,   s y m b o l ) )  
 	 	 {  
 	 	 	 i f   ( T i m e C u r r e n t ( )   -   O r d e r O p e n T i m e ( )   <   3 )   { c o n t i n u e ; }  
 	 	 	 i f   ( O r d e r E x p i r a t i o n ( )   >   0   & &   O r d e r E x p i r a t i o n ( )   < =   O r d e r C l o s e T i m e ( ) )   { c o n t i n u e ; }   / /   n o   e x p i r e d   p o  
  
 	 	 	 i f   ( l o t s   = =   0 )  
 	 	 	 {  
 	 	 	 	 l o t s   =   O r d e r L o t s ( ) ;  
 	 	 	 }  
  
 	 	 	 p r o f i t   =   O r d e r C l o s e P r i c e ( )   -   O r d e r O p e n P r i c e ( ) ;  
 	 	 	 p r o f i t   =   N o r m a l i z e D o u b l e ( p r o f i t ,   S y m b o l D i g i t s ( O r d e r S y m b o l ( ) ) ) ;  
  
 	 	 	 i f   ( I s O r d e r T y p e S e l l ( ) )  
 	 	 	 {  
 	 	 	 	 p r o f i t   =   - 1   *   p r o f i t ;  
 	 	 	 }  
  
 	 	 	 i f   ( p r o f i t   = =   0 )  
 	 	 	 {  
 	 	 	 	 r e t u r n   l o t s ;  
 	 	 	 }  
  
 	 	 	 i f   ( p r o f i t < 0 )   { p r o f i t _ o r _ l o s s = - 1 ; }  
 	 	 	 e l s e   { p r o f i t _ o r _ l o s s = 1 ; }  
  
 	 	 	 b r e a k ;  
 	 	 }  
       }  
        
       / / - -   i f   n o   r u n n i n g   t r a d e   w a s   f o u n d ,   s e a r c h   i n   h i s t o r y   t r a d e s  
       i f   ( l o t s = = 0 )  
       {  
             t o t a l   =   H i s t o r y T r a d e s T o t a l ( ) ;  
  
 	 	 f o r   ( p o s   =   t o t a l   -   1 ;   p o s   > =   0 ;   p o s - - )  
 	 	 {  
                   i f   ( H i s t o r y T r a d e S e l e c t B y I n d e x ( p o s ,   " g r o u p " ,   g r o u p ,   " s y m b o l " ,   s y m b o l ) )  
 	 	 	 {  
 	 	 	 	 i f   ( T i m e C u r r e n t ( )   -   O r d e r O p e n T i m e ( )   <   3 )   { c o n t i n u e ; }  
  
 	 	 	 	 i f   ( l o t s = = 0 )   {  
 	 	 	 	 	 l o t s = O r d e r L o t s ( ) ;  
 	 	 	 	 }  
  
 	 	 	 	 p r o f i t   =   O r d e r C l o s e P r i c e ( ) - O r d e r O p e n P r i c e ( ) ;  
 	 	 	 	 p r o f i t   =   N o r m a l i z e D o u b l e ( p r o f i t ,   S y m b o l D i g i t s ( O r d e r S y m b o l ( ) ) ) ;  
 	 	 	 	 i f   ( I s O r d e r T y p e S e l l ( ) )   { p r o f i t   =   - 1 * p r o f i t ; }  
 	 	 	 	 i f   ( p r o f i t   = =   0 )   {  
 	 	 	 	 	 r e t u r n ( l o t s ) ;  
 	 	 	 	 }  
  
 	 	 	 	 i f   ( p r o f i t < 0 )   { p r o f i t _ o r _ l o s s = - 1 ; }  
 	 	 	 	 e l s e   { p r o f i t _ o r _ l o s s = 1 ; }  
  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
             }  
       }  
        
       / / - -   L a b o u c h e r e   s t u f f  
       s t a t i c   s t r i n g   m e m _ g r o u p [ ] ;  
       s t a t i c   s t r i n g   m e m _ l i s t [ ] ;  
       s t a t i c   i n t   m e m _ t i c k e t [ ] ;  
       i n t   s t a r t _ a g a i n = f a l s e ;  
        
       / / -   g e t   t h e   l i s t   o f   n u m b e r s   a s   i t   i s   s t o r e d   i n   t h e   m e m o r y ,   o r   s t o r e   i t  
       i n t   i d = A r r a y S e a r c h ( m e m _ g r o u p ,   g r o u p ) ;  
       i f   ( i d   = =   - 1 )   {  
             s t a r t _ a g a i n = t r u e ;  
             i f   ( l i s t _ o f _ n u m b e r s = = " " )   { l i s t _ o f _ n u m b e r s = " 1 " ; }  
             i d   =   A r r a y S i z e ( m e m _ g r o u p ) ;  
             A r r a y R e s i z e ( m e m _ g r o u p ,   i d + 1 ,   i d + 1 ) ;  
             A r r a y R e s i z e ( m e m _ l i s t ,   i d + 1 ,   i d + 1 ) ;  
             A r r a y R e s i z e ( m e m _ t i c k e t ,   i d + 1 ,   i d + 1 ) ;  
             m e m _ g r o u p [ i d ] = g r o u p ;  
             m e m _ l i s t [ i d ] = l i s t _ o f _ n u m b e r s ;  
       }  
        
       i f   ( m e m _ t i c k e t [ i d ] = = O r d e r T i c k e t ( ) )   {  
             / /   t h e   l a s t   k n o w n   t i c k e t   ( m e m _ t i c k e t [ i d ] )   s h o u l d   b e   d i f f e r e n t   t h a n   O d e r T i c k e t ( )   n o r m a l l y  
             / /   w h e n   f a i l e d   t o   c r e a t e   a   n e w   t r a d e   -   t h e   l a s t   t i c k e t   r e m a i n s   t h e   s a m e  
             / /   s o   w e   n e e d   t o   r e s e t  
             m e m _ l i s t [ i d ] = l i s t _ o f _ n u m b e r s ;  
       }  
       m e m _ t i c k e t [ i d ] = O r d e r T i c k e t ( ) ;  
        
       / / -   n o w   t u r n   t h e   s t r i n g   i n t o   i n t e g e r   a r r a y  
       i n t   l i s t [ ] ;  
       s t r i n g   l i s t S [ ] ;  
       S t r i n g E x p l o d e ( " , " ,   m e m _ l i s t [ i d ] ,   l i s t S ) ;  
       A r r a y R e s i z e ( l i s t ,   A r r a y S i z e ( l i s t S ) ) ;  
       f o r   ( i n t   s = 0 ;   s < A r r a y S i z e ( l i s t S ) ;   s + + )   {  
             l i s t [ s ] = ( i n t ) S t r i n g T o I n t e g e r ( S t r i n g T r i m ( l i s t S [ s ] ) ) ;      
       }  
  
       / / - -    
       i n t   s i z e   =   A r r a y S i z e ( l i s t ) ;  
  
       i f   ( i n i t i a l _ l o t s   <   M a r k e t I n f o ( s y m b o l , M O D E _ M I N L O T ) )   {  
             i n i t i a l _ l o t s   =   M a r k e t I n f o ( s y m b o l , M O D E _ M I N L O T ) ;      
       }  
  
       i f   ( l o t s = = 0 )   {  
             s t a r t _ a g a i n = t r u e ;  
       }  
        
       i f   ( s t a r t _ a g a i n = = t r u e )  
       {  
             i f   ( s i z e = = 1 )   {  
                   l o t s   =   i n i t i a l _ l o t s * l i s t [ 0 ] ;  
             }   e l s e   {  
                   l o t s   =   i n i t i a l _ l o t s * ( l i s t [ 0 ] + l i s t [ s i z e - 1 ] ) ;  
             }  
       }  
       e l s e    
       {  
             i f   ( ( r e v e r s e = = 0   & &   p r o f i t _ o r _ l o s s = = 1 )   | |   ( r e v e r s e = = 1   & &   p r o f i t _ o r _ l o s s = = - 1 ) )  
             {  
                   i f   ( s i z e = = 1 )   {  
                         l o t s = i n i t i a l _ l o t s * l i s t [ 0 ] ;  
                         A r r a y R e s i z e ( l i s t ,   0 ) ;  
                   }  
                   e l s e   i f   ( s i z e = = 2 )   {  
                         l o t s   =   i n i t i a l _ l o t s * ( l i s t [ 0 ] + l i s t [ 1 ] ) ;  
                         A r r a y R e s i z e ( l i s t ,   0 ) ;  
                   }  
                   e l s e   i f   ( s i z e > 2 )   {  
                         l o t s   =   i n i t i a l _ l o t s * ( l i s t [ 0 ] + l i s t [ s i z e - 1 ] ) ;  
                         / /   C a n c e l   f i r s t   a n d   l a s t   n u m b e r s   i n   o u r   l i s t  
                         / /   s h i f t   a r r a y   1   s t e p   l e f t  
                         f o r ( p o s = 0 ;   p o s < s i z e - 1 ;   p o s + + )   {  
                               l i s t [ p o s ] = l i s t [ p o s + 1 ] ;  
                         }  
                         A r r a y R e s i z e ( l i s t , A r r a y S i z e ( l i s t ) - 2 ) ;   / /   r e m o v e   l a s t   2   e l e m e n t s 	 	  
                   }  
                   i f   ( l o t s   <   i n i t i a l _ l o t s )   { l o t s   =   i n i t i a l _ l o t s ; }  
             }  
             e l s e   {  
                   i f   ( s i z e > 1 )  
                   {  
                         A r r a y R e s i z e ( l i s t ,   s i z e + 1 ) ;  
                         l i s t [ s i z e ] = l i s t [ 0 ] + l i s t [ s i z e - 1 ] ;  
                         l o t s   =   i n i t i a l _ l o t s * ( l i s t [ 0 ] + l i s t [ s i z e ] ) ;  
                   }   e l s e   {  
                         l o t s   =   i n i t i a l _ l o t s * l i s t [ 0 ] ;  
                   }  
                   i f   ( l o t s   <   i n i t i a l _ l o t s )   { l o t s   =   i n i t i a l _ l o t s ; }  
             }  
  
       }  
        
       P r i n t ( " L a b o u c h e r e   ( f o r   g r o u p   " + ( s t r i n g ) i d + " )   c u r r e n t   l i s t   o f   n u m b e r s : " + S t r i n g I m p l o d e ( " , " ,   l i s t ) ) ;  
       s i z e = A r r a y S i z e ( l i s t ) ;  
       i f   ( s i z e = = 0 )   {  
             A r r a y S t r i p K e y ( m e m _ g r o u p ,   i d ) ;  
             A r r a y S t r i p K e y ( m e m _ l i s t ,   i d ) ;  
             A r r a y S t r i p K e y ( m e m _ t i c k e t ,   i d ) ;  
       }   e l s e   {  
             m e m _ l i s t [ i d ] = S t r i n g I m p l o d e ( " , " ,   l i s t ) ;  
       }  
  
       r e t u r n   l o t s ;  
 }  
  
 d o u b l e   B e t M a r t i n g a l e (  
 	 s t r i n g   g r o u p ,  
 	 s t r i n g   s y m b o l ,  
 	 d o u b l e   i n i t i a l _ l o t s ,  
 	 d o u b l e   m u l t i p l y _ o n _ l o s s ,  
 	 d o u b l e   m u l t i p l y _ o n _ p r o f i t ,  
 	 d o u b l e   a d d _ o n _ l o s s ,  
 	 d o u b l e   a d d _ o n _ p r o f i t ,  
 	 i n t   r e s e t _ o n _ l o s s ,  
 	 i n t   r e s e t _ o n _ p r o f i t  
 )   {  
 	 i n t   p o s                         =   0 ;  
 	 i n t   t o t a l                     =   0 ;  
 	 d o u b l e   l o t s                 =   0 ;  
 	 d o u b l e   p r o f i t             =   0 ;  
 	 i n t   p r o f i t _ o r _ l o s s   =   0 ;   / /   0   -   u n k n o w n ,   1   -   p r o f i t ,   - 1   -   l o s s  
 	 i n t   i n _ a _ r o w               =   0 ;  
 	  
 	 / / - -   t r y   t o   g e t   l a s t   l o t   s i z e   f r o m   r u n n i n g   t r a d e s  
 	 t o t a l   =   T r a d e s T o t a l ( ) ;  
 	  
 	 f o r   ( p o s   =   t o t a l   -   1 ;   p o s   > =   0 ;   p o s - - )  
 	 {  
 	 	 i f   ( T r a d e S e l e c t B y I n d e x ( p o s ,   " g r o u p " ,   g r o u p ,   " s y m b o l " ,   s y m b o l ) )  
 	 	 {  
 	 	 	 i f   ( T i m e C u r r e n t ( )   -   O r d e r O p e n T i m e ( )   <   3 )   { c o n t i n u e ; }  
 	 	 	 i f   ( O r d e r E x p i r a t i o n ( )   >   0   & &   O r d e r E x p i r a t i o n ( )   < =   O r d e r C l o s e T i m e ( ) )   { c o n t i n u e ; }   / /   n o   e x p i r e d   p o  
  
 	 	 	 i f   ( l o t s   = =   0 )  
 	 	 	 {  
 	 	 	 	 l o t s   =   O r d e r L o t s ( ) ;  
 	 	 	 }  
  
 	 	 	 p r o f i t   =   O r d e r C l o s e P r i c e ( )   -   O r d e r O p e n P r i c e ( ) ;  
 	 	 	 p r o f i t   =   N o r m a l i z e D o u b l e ( p r o f i t ,   S y m b o l D i g i t s ( O r d e r S y m b o l ( ) ) ) ;  
  
 	 	 	 i f   ( I s O r d e r T y p e S e l l ( ) )  
 	 	 	 {  
 	 	 	 	 p r o f i t   =   - 1   *   p r o f i t ;  
 	 	 	 }  
  
 	 	 	 i f   ( p r o f i t   = =   0 )  
 	 	 	 {  
 	 	 	 	 r e t u r n   l o t s ;  
 	 	 	 }  
  
 	 	 	 i f   ( p r o f i t _ o r _ l o s s   = =   0 )  
 	 	 	 {  
 	 	 	 	 i f   ( p r o f i t   <   0 )  
 	 	 	 	 {  
 	 	 	 	 	 p r o f i t _ o r _ l o s s   =   - 1 ;  
 	 	 	 	 }  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 p r o f i t _ o r _ l o s s   =   1 ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 i f   (  
 	 	 	 	 	 ( p r o f i t _ o r _ l o s s   = =   1   & &   p r o f i t   <   0 )  
 	 	 	 	 	 | |   ( p r o f i t _ o r _ l o s s   = =   - 1   & &   p r o f i t   > =   0 )  
 	 	 	 	 )   {  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 i n _ a _ r o w + + ;  
 	 	 }  
 	 }  
  
 	 / / - -   i f   n o   r u n n i n g   t r a d e   w a s   f o u n d ,   s e a r c h   i n   h i s t o r y   t r a d e s  
 	 i f   ( l o t s   = =   0 )  
 	 {  
 	 	 t o t a l   =   H i s t o r y T r a d e s T o t a l ( ) ;  
  
 	 	 f o r   ( p o s   =   t o t a l   -   1 ;   p o s   > =   0 ;   p o s - - )  
 	 	 {  
 	 	 	 i f   ( H i s t o r y T r a d e S e l e c t B y I n d e x ( p o s ,   " g r o u p " ,   g r o u p ,   " s y m b o l " ,   s y m b o l ) )  
 	 	 	 {  
 	 	 	 	 i f   ( T i m e C u r r e n t ( )   -   O r d e r O p e n T i m e ( )   <   3 )   { c o n t i n u e ; }  
  
 	 	 	 	 i f   ( l o t s   = =   0 )  
 	 	 	 	 {  
 	 	 	 	 	 l o t s   =   O r d e r L o t s ( ) ;  
 	 	 	 	 }  
  
 	 	 	 	 p r o f i t   =   O r d e r C l o s e P r i c e ( )   -   O r d e r O p e n P r i c e ( ) ;  
 	 	 	 	 p r o f i t   =   N o r m a l i z e D o u b l e ( p r o f i t ,   S y m b o l D i g i t s ( O r d e r S y m b o l ( ) ) ) ;  
  
 	 	 	 	 i f   ( I s O r d e r T y p e S e l l ( ) )   { p r o f i t   =   - 1 * p r o f i t ; }  
 	 	 	 	  
 	 	 	 	 i f   ( p r o f i t   = =   0 )  
 	 	 	 	 {  
 	 	 	 	 	 r e t u r n   l o t s ;  
 	 	 	 	 }  
  
 	 	 	 	 i f   ( p r o f i t _ o r _ l o s s   = =   0 )  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( p r o f i t   <   0 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 p r o f i t _ o r _ l o s s   =   - 1 ;  
 	 	 	 	 	 }  
 	 	 	 	 	 e l s e  
 	 	 	 	 	 {  
 	 	 	 	 	 	 p r o f i t _ o r _ l o s s   =   1 ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 	 e l s e   {  
 	 	 	 	 	 i f   (  
 	 	 	 	 	 	 ( p r o f i t _ o r _ l o s s   = =   1   & &   p r o f i t   <   0 )  
 	 	 	 	 	 	 | |   ( p r o f i t _ o r _ l o s s   = =   - 1   & &   p r o f i t   > =   0 )  
 	 	 	 	 	 )   {  
 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
  
 	 	 	 	 i n _ a _ r o w + + ;  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 / /   M a r t i n g a l e   s t u f f  
 	 i f   ( l o t s   = =   0 )  
 	 {  
 	 	 l o t s   =   i n i t i a l _ l o t s ;  
 	 }  
 	 e l s e  
 	 {  
 	 	 i f   ( p r o f i t _ o r _ l o s s   = =   1 )  
 	 	 {  
 	 	 	 i f   ( r e s e t _ o n _ p r o f i t   >   0   & &   i n _ a _ r o w   > =   r e s e t _ o n _ p r o f i t )  
 	 	 	 {  
 	 	 	 	 l o t s   =   i n i t i a l _ l o t s ;  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 i f   ( m u l t i p l y _ o n _ p r o f i t   < =   0 )  
 	 	 	 	 {  
 	 	 	 	 	 m u l t i p l y _ o n _ p r o f i t   =   1 ;  
 	 	 	 	 }  
  
 	 	 	 	 l o t s   =   ( l o t s   *   m u l t i p l y _ o n _ p r o f i t )   +   a d d _ o n _ p r o f i t ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 i f   ( r e s e t _ o n _ l o s s   >   0   & &   i n _ a _ r o w   > =   r e s e t _ o n _ l o s s )  
 	 	 	 {  
 	 	 	 	 l o t s   =   i n i t i a l _ l o t s ;      
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 i f   ( m u l t i p l y _ o n _ l o s s   < =   0 )  
 	 	 	 	 {  
 	 	 	 	 	 m u l t i p l y _ o n _ l o s s   =   1 ;  
 	 	 	 	 }  
  
 	 	 	 	 l o t s   =   ( l o t s   *   m u l t i p l y _ o n _ l o s s )   +   a d d _ o n _ l o s s ;  
 	 	 	 }  
 	 	 }  
 	 }  
 	  
 	 r e t u r n   l o t s ;  
 }  
  
 d o u b l e   B e t S e q u e n c e (  
 	 s t r i n g   g r o u p ,  
 	 s t r i n g   s y m b o l ,  
 	 d o u b l e   i n i t i a l _ l o t s ,  
 	 s t r i n g   s e q u e n c e _ o n _ l o s s ,  
 	 s t r i n g   s e q u e n c e _ o n _ p r o f i t ,  
 	 b o o l   r e v e r s e   =   f a l s e  
 )   {      
 	 i n t   p o s                         =   0 ;  
 	 i n t   t o t a l                     =   0 ;  
 	 d o u b l e   l o t s                 =   0 ;  
 	 d o u b l e   p r o f i t             =   0 ;  
 	 i n t   p r o f i t _ o r _ l o s s   =   0 ;   / /   0   -   u n k n o w n ,   1   -   p r o f i t ,   - 1   -   l o s s  
 	 i n t   s i z e                       =   0 ;  
        
       / / - -   t r y   t o   g e t   l a s t   l o t   s i z e   f r o m   r u n n i n g   t r a d e s  
       t o t a l   =   T r a d e s T o t a l ( ) ;  
 	  
       f o r   ( p o s   =   t o t a l   -   1 ;   p o s   > =   0 ;   p o s - - )  
       {  
             i f   ( T r a d e S e l e c t B y I n d e x ( p o s ,   " g r o u p " ,   g r o u p ,   " s y m b o l " ,   s y m b o l ) )  
 	 	 {  
 	 	 	 i f   ( T i m e C u r r e n t ( )   -   O r d e r O p e n T i m e ( )   <   3 )   { c o n t i n u e ; }  
 	 	 	 i f   ( O r d e r E x p i r a t i o n ( )   >   0   & &   O r d e r E x p i r a t i o n ( )   < =   O r d e r C l o s e T i m e ( ) )   { c o n t i n u e ; }   / /   n o   e x p i r e d   p o  
  
 	 	 	 i f   ( l o t s   = =   0 )  
 	 	 	 {  
 	 	 	 	 l o t s   =   O r d e r L o t s ( ) ;  
 	 	 	 }  
  
 	 	 	 p r o f i t   =   O r d e r C l o s e P r i c e ( )   -   O r d e r O p e n P r i c e ( ) ;  
 	 	 	 p r o f i t   =   N o r m a l i z e D o u b l e ( p r o f i t ,   S y m b o l D i g i t s ( O r d e r S y m b o l ( ) ) ) ;  
  
 	 	 	 i f   ( I s O r d e r T y p e S e l l ( ) )  
 	 	 	 {  
 	 	 	 	 p r o f i t   =   - 1   *   p r o f i t ;  
 	 	 	 }  
  
 	 	 	 i f   ( p r o f i t   = =   0 )  
 	 	 	 {  
 	 	 	 	 r e t u r n   l o t s ;  
 	 	 	 }  
  
 	 	 	 i f   ( p r o f i t < 0 )   { p r o f i t _ o r _ l o s s = - 1 ; }  
 	 	 	 e l s e   { p r o f i t _ o r _ l o s s = 1 ; }  
  
 	 	 	 b r e a k ;  
 	 	 }  
       }  
        
       / / - -   i f   n o   r u n n i n g   t r a d e   w a s   f o u n d ,   s e a r c h   i n   h i s t o r y   t r a d e s  
       i f   ( l o t s = = 0 )  
       {  
             t o t a l   =   H i s t o r y T r a d e s T o t a l ( ) ;  
  
 	 	 f o r   ( p o s   =   t o t a l   -   1 ;   p o s   > =   0 ;   p o s - - )  
             {  
                   i f   ( H i s t o r y T r a d e S e l e c t B y I n d e x ( p o s ,   " g r o u p " ,   g r o u p ,   " s y m b o l " ,   s y m b o l ) )  
 	 	 	 {  
 	 	 	 	 i f   ( T i m e C u r r e n t ( )   -   O r d e r O p e n T i m e ( )   <   3 )   { c o n t i n u e ; }  
  
 	 	 	 	 i f   ( l o t s = = 0 )   {  
 	 	 	 	 	 l o t s = O r d e r L o t s ( ) ;  
 	 	 	 	 }  
  
 	 	 	 	 p r o f i t   =   O r d e r C l o s e P r i c e ( ) - O r d e r O p e n P r i c e ( ) ;  
 	 	 	 	 p r o f i t   =   N o r m a l i z e D o u b l e ( p r o f i t ,   S y m b o l D i g i t s ( O r d e r S y m b o l ( ) ) ) ;  
 	 	 	 	 i f   ( I s O r d e r T y p e S e l l ( ) )   { p r o f i t   =   - 1 * p r o f i t ; }  
 	 	 	 	 i f   ( p r o f i t   = =   0 )   {  
 	 	 	 	 	 r e t u r n ( l o t s ) ;  
 	 	 	 	 }  
  
 	 	 	 	 i f   ( p r o f i t < 0 )   { p r o f i t _ o r _ l o s s = - 1 ; }  
 	 	 	 	 e l s e   { p r o f i t _ o r _ l o s s = 1 ; }  
  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
             }  
       }  
        
       / / - -   S e q u e n c e   s t u f f  
       s t a t i c   s t r i n g   m e m _ g r o u p [ ] ;  
       s t a t i c   s t r i n g   m e m _ l i s t _ l o s s [ ] ;  
       s t a t i c   s t r i n g   m e m _ l i s t _ p r o f i t [ ] ;  
       s t a t i c   i n t   m e m _ t i c k e t [ ] ;  
        
       / / -   g e t   t h e   l i s t   o f   n u m b e r s   a s   i t   i s   s t o r e d   i n   t h e   m e m o r y ,   o r   s t o r e   i t  
       i n t   i d = A r r a y S e a r c h ( m e m _ g r o u p ,   g r o u p ) ;  
       i f   ( i d   = =   - 1 )  
       {  
             i f   ( s e q u e n c e _ o n _ l o s s = = " " )   { s e q u e n c e _ o n _ l o s s = " 1 " ; }  
             i f   ( s e q u e n c e _ o n _ p r o f i t = = " " )   { s e q u e n c e _ o n _ p r o f i t = " 1 " ; }  
             i d   =   A r r a y S i z e ( m e m _ g r o u p ) ;  
             A r r a y R e s i z e ( m e m _ g r o u p ,   i d + 1 ,   i d + 1 ) ;  
             A r r a y R e s i z e ( m e m _ l i s t _ l o s s ,   i d + 1 ,   i d + 1 ) ;  
             A r r a y R e s i z e ( m e m _ l i s t _ p r o f i t ,   i d + 1 ,   i d + 1 ) ;  
             A r r a y R e s i z e ( m e m _ t i c k e t ,   i d + 1 ,   i d + 1 ) ;  
             m e m _ g r o u p [ i d ]                 = g r o u p ;  
             m e m _ l i s t _ l o s s [ i d ]         = s e q u e n c e _ o n _ l o s s ;  
             m e m _ l i s t _ p r o f i t [ i d ]     = s e q u e n c e _ o n _ p r o f i t ;  
       }  
        
       b o o l   l o s s _ r e s e t = f a l s e ;  
       b o o l   p r o f i t _ r e s e t = f a l s e ;  
       i f   ( p r o f i t _ o r _ l o s s = = - 1   & &   m e m _ l i s t _ l o s s [ i d ] = = " " )   {  
             l o s s _ r e s e t = t r u e ;  
             m e m _ l i s t _ p r o f i t [ i d ] = " " ;  
       }  
       i f   ( p r o f i t _ o r _ l o s s = = 1   & &   m e m _ l i s t _ p r o f i t [ i d ] = = " " )   {  
             p r o f i t _ r e s e t = t r u e ;  
             m e m _ l i s t _ l o s s [ i d ] = " " ;  
       }  
        
       i f   ( p r o f i t _ o r _ l o s s = = 1   | |   m e m _ l i s t _ l o s s [ i d ] = = " " )   {  
             m e m _ l i s t _ l o s s [ i d ] = s e q u e n c e _ o n _ l o s s ;  
             i f   ( l o s s _ r e s e t )   { m e m _ l i s t _ l o s s [ i d ] = " 1 , " + m e m _ l i s t _ l o s s [ i d ] ; }  
              
       }  
       i f   ( p r o f i t _ o r _ l o s s = = - 1   | | m e m _ l i s t _ p r o f i t [ i d ] = = " " )   {  
             m e m _ l i s t _ p r o f i t [ i d ] = s e q u e n c e _ o n _ p r o f i t ;  
             i f   ( p r o f i t _ r e s e t )   { m e m _ l i s t _ p r o f i t [ i d ] = " 1 , " + m e m _ l i s t _ p r o f i t [ i d ] ; }  
       }  
        
       i f   ( m e m _ t i c k e t [ i d ] = = O r d e r T i c k e t ( ) )   {  
             / /   t h e   l a s t   k n o w n   t i c k e t   ( m e m _ t i c k e t [ i d ] )   s h o u l d   b e   d i f f e r e n t   t h a n   O d e r T i c k e t ( )   n o r m a l l y  
             / /   w h e n   f a i l e d   t o   c r e a t e   a   n e w   t r a d e   -   t h e   l a s t   t i c k e t   r e m a i n s   t h e   s a m e  
             / /   s o   w e   n e e d   t o   r e s e t  
             m e m _ l i s t _ l o s s [ i d ] = s e q u e n c e _ o n _ l o s s ;  
             m e m _ l i s t _ p r o f i t [ i d ] = s e q u e n c e _ o n _ p r o f i t ;  
       }  
       m e m _ t i c k e t [ i d ] = O r d e r T i c k e t ( ) ;  
        
       / / -   n o w   t u r n   t h e   s t r i n g   i n t o   i n t e g e r   a r r a y  
       i n t   s = 0 ;  
       d o u b l e   l i s t _ l o s s [ ] ;  
       d o u b l e   l i s t _ p r o f i t [ ] ;  
       s t r i n g   l i s t S [ ] ;  
       S t r i n g E x p l o d e ( " , " ,   m e m _ l i s t _ l o s s [ i d ] ,   l i s t S ) ;  
       A r r a y R e s i z e ( l i s t _ l o s s ,   A r r a y S i z e ( l i s t S ) ,   A r r a y S i z e ( l i s t S ) ) ;  
       f o r   ( s = 0 ;   s < A r r a y S i z e ( l i s t S ) ;   s + + )   {  
             l i s t _ l o s s [ s ] = ( d o u b l e ) S t r i n g T o D o u b l e ( S t r i n g T r i m ( l i s t S [ s ] ) ) ;      
       }  
       S t r i n g E x p l o d e ( " , " ,   m e m _ l i s t _ p r o f i t [ i d ] ,   l i s t S ) ;  
       A r r a y R e s i z e ( l i s t _ p r o f i t ,   A r r a y S i z e ( l i s t S ) ,   A r r a y S i z e ( l i s t S ) ) ;  
       f o r   ( s = 0 ;   s < A r r a y S i z e ( l i s t S ) ;   s + + )   {  
             l i s t _ p r o f i t [ s ] = ( d o u b l e ) S t r i n g T o D o u b l e ( S t r i n g T r i m ( l i s t S [ s ] ) ) ;      
       }  
  
       / / - -  
       i f   ( i n i t i a l _ l o t s   <   M a r k e t I n f o ( s y m b o l , M O D E _ M I N L O T ) )   {  
             i n i t i a l _ l o t s   =   M a r k e t I n f o ( s y m b o l , M O D E _ M I N L O T ) ;      
       }  
  
       i f   ( l o t s = = 0 )   { l o t s   =   i n i t i a l _ l o t s ; }  
       e l s e  
       {  
             i f   ( ( r e v e r s e = = f a l s e   & &   p r o f i t _ o r _ l o s s = = 1 )   | |   ( r e v e r s e = = t r u e   & &   p r o f i t _ o r _ l o s s = = - 1 ) )  
             {  
                   l o t s   =   i n i t i a l _ l o t s * l i s t _ p r o f i t [ 0 ] ;  
                   / /   s h i f t   a r r a y   1   s t e p   l e f t  
                   s i z e = A r r a y S i z e ( l i s t _ p r o f i t ) ;  
                   f o r ( p o s = 0 ;   p o s < s i z e - 1 ;   p o s + + )   {  
                         l i s t _ p r o f i t [ p o s ] = l i s t _ p r o f i t [ p o s + 1 ] ;  
                   }  
                   i f   ( s i z e > 0 )   {  
                         A r r a y R e s i z e ( l i s t _ p r o f i t ,   s i z e - 1 ,   s i z e - 1 ) ;  
                         m e m _ l i s t _ p r o f i t [ i d ] = S t r i n g I m p l o d e ( " , " ,   l i s t _ p r o f i t ) ;  
                   }  
                   / /   r e s e t   t h e   o p p o s i t e   s e q u e n c e  
                   / / m e m _ l i s t _ l o s s [ i d ] = " " ;  
             }  
             e l s e   {  
                    
                   l o t s   =   i n i t i a l _ l o t s * l i s t _ l o s s [ 0 ] ;  
                   / /   s h i f t   a r r a y   1   s t e p   l e f t  
                   s i z e = A r r a y S i z e ( l i s t _ l o s s ) ;  
                   f o r ( p o s = 0 ;   p o s < s i z e - 1 ;   p o s + + )   {  
                         l i s t _ l o s s [ p o s ] = l i s t _ l o s s [ p o s + 1 ] ;  
                   }  
                   i f   ( s i z e > 0 )   {  
                         A r r a y R e s i z e ( l i s t _ l o s s ,   s i z e - 1 ,   s i z e - 1 ) ;  
                         m e m _ l i s t _ l o s s [ i d ] = S t r i n g I m p l o d e ( " , " ,   l i s t _ l o s s ) ;  
                   }  
                   / /   r e s e t   t h e   o p p o s i t e   s e q u e n c e  
                   / / m e m _ l i s t _ p r o f i t [ i d ] = " " ;  
             }  
       }  
        
       r e t u r n   l o t s ;  
 }  
  
 i n t   B u y N o w (  
 	 s t r i n g   s y m b o l ,  
 	 d o u b l e   l o t s ,  
 	 d o u b l e   s l l ,  
 	 d o u b l e   t p l ,  
 	 d o u b l e   s l p ,  
 	 d o u b l e   t p p ,  
 	 d o u b l e   s l i p p a g e   =   0 ,  
 	 i n t   m a g i c   =   0 ,  
 	 s t r i n g   c o m m e n t   =   " " ,  
 	 c o l o r   a r r o w c o l o r   =   c l r N O N E ,  
 	 d a t e t i m e   e x p i r a t i o n   =   0  
 	 )  
 {  
 	 r e t u r n   O r d e r C r e a t e (  
 	 	 s y m b o l ,  
 	 	 O P _ B U Y ,  
 	 	 l o t s ,  
 	 	 0 ,  
 	 	 s l l ,  
 	 	 t p l ,  
 	 	 s l p ,  
 	 	 t p p ,  
 	 	 s l i p p a g e ,  
 	 	 m a g i c ,  
 	 	 c o m m e n t ,  
 	 	 a r r o w c o l o r ,  
 	 	 e x p i r a t i o n  
 	 ) ;  
 }  
  
 i n t   C h e c k F o r T r a d i n g E r r o r ( i n t   e r r o r _ c o d e = - 1 ,   s t r i n g   m s g _ p r e f i x = " " )  
 {  
       / /   r e t u r n   0   - >   n o   e r r o r  
       / /   r e t u r n   1   - >   o v e r c o m a b l e   e r r o r  
       / /   r e t u r n   2   - >   f a t a l   e r r o r  
        
       i f   ( e r r o r _ c o d e < 0 )   {  
             e r r o r _ c o d e = G e t L a s t E r r o r ( ) ;      
       }  
        
       i n t   r e t v a l = 0 ;  
       s t a t i c   i n t   t r y o u t s = 0 ;  
        
       / / - -   e r r o r   c h e c k   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
       s w i t c h ( e r r o r _ c o d e )  
       {  
             / / - -   n o   e r r o r  
             c a s e   0 :  
                   r e t v a l = 0 ;  
                   b r e a k ;  
             / / - -   o v e r c o m a b l e   e r r o r s  
             c a s e   1 :   / /   N o   e r r o r   r e t u r n e d  
                   R e f r e s h R a t e s ( ) ;  
                   r e t v a l = 1 ;  
                   b r e a k ;  
             c a s e   4 :   / / E R R _ S E R V E R _ B U S Y  
                   i f   ( m s g _ p r e f i x ! = " " )   { P r i n t ( S t r i n g C o n c a t e n a t e ( m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) , " .   R e t r y i n g . . " ) ) ; }  
                   S l e e p ( 1 0 0 0 ) ;  
                   R e f r e s h R a t e s ( ) ;  
                   r e t v a l = 1 ;  
                   b r e a k ;  
             c a s e   6 :   / / E R R _ N O _ C O N N E C T I O N  
                   i f   ( m s g _ p r e f i x ! = " " )   { P r i n t ( S t r i n g C o n c a t e n a t e ( m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) , " .   R e t r y i n g . . " ) ) ; }  
                   w h i l e ( ! I s C o n n e c t e d ( ) )   { S l e e p ( 1 0 0 ) ; }  
                   w h i l e ( I s T r a d e C o n t e x t B u s y ( ) )   { S l e e p ( 5 0 ) ; }  
                   R e f r e s h R a t e s ( ) ;  
                   r e t v a l = 1 ;  
                   b r e a k ;  
             c a s e   1 2 8 :   / / E R R _ T R A D E _ T I M E O U T  
                   i f   ( m s g _ p r e f i x ! = " " )   { P r i n t ( S t r i n g C o n c a t e n a t e ( m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) , " .   R e t r y i n g . . " ) ) ; }  
                   R e f r e s h R a t e s ( ) ;  
                   r e t v a l = 1 ;  
                   b r e a k ;  
             c a s e   1 2 9 :   / / E R R _ I N V A L I D _ P R I C E  
                   i f   ( m s g _ p r e f i x ! = " " )   { P r i n t ( S t r i n g C o n c a t e n a t e ( m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) , " .   R e t r y i n g . . " ) ) ; }  
                   i f   ( ! I s T e s t i n g ( ) )   { w h i l e ( R e f r e s h R a t e s ( ) = = f a l s e )   { S l e e p ( 1 ) ; } }  
                   r e t v a l = 1 ;  
                   b r e a k ;  
             c a s e   1 3 0 :   / / E R R _ I N V A L I D _ S T O P S  
                   i f   ( m s g _ p r e f i x ! = " " )   { P r i n t ( S t r i n g C o n c a t e n a t e ( m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) , " .   W a i t i n g   f o r   a   n e w   t i c k   t o   r e t r y . . " ) ) ; }  
                   i f   ( ! I s T e s t i n g ( ) )   { w h i l e ( R e f r e s h R a t e s ( ) = = f a l s e )   { S l e e p ( 1 ) ; } }  
                   r e t v a l = 1 ;  
                   b r e a k ;  
             c a s e   1 3 5 :   / / E R R _ P R I C E _ C H A N G E D  
                   i f   ( m s g _ p r e f i x ! = " " )   { P r i n t ( S t r i n g C o n c a t e n a t e ( m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) , " .   W a i t i n g   f o r   a   n e w   t i c k   t o   r e t r y . . " ) ) ; }  
                   i f   ( ! I s T e s t i n g ( ) )   { w h i l e ( R e f r e s h R a t e s ( ) = = f a l s e )   { S l e e p ( 1 ) ; } }  
                   r e t v a l = 1 ;  
                   b r e a k ;  
             c a s e   1 3 6 :   / / E R R _ O F F _ Q U O T E S  
                   i f   ( m s g _ p r e f i x ! = " " )   { P r i n t ( S t r i n g C o n c a t e n a t e ( m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) , " .   W a i t i n g   f o r   a   n e w   t i c k   t o   r e t r y . . " ) ) ; }  
                   i f   ( ! I s T e s t i n g ( ) )   { w h i l e ( R e f r e s h R a t e s ( ) = = f a l s e )   { S l e e p ( 1 ) ; } }  
                   r e t v a l = 1 ;  
                   b r e a k ;  
             c a s e   1 3 7 :   / / E R R _ B R O K E R _ B U S Y  
                   i f   ( m s g _ p r e f i x ! = " " )   { P r i n t ( S t r i n g C o n c a t e n a t e ( m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) , " .   R e t r y i n g . . " ) ) ; }  
                   S l e e p ( 1 0 0 0 ) ;  
                   r e t v a l = 1 ;  
                   b r e a k ;  
             c a s e   1 3 8 :   / / E R R _ R E Q U O T E  
                   i f   ( m s g _ p r e f i x ! = " " )   { P r i n t ( S t r i n g C o n c a t e n a t e ( m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) , " .   W a i t i n g   f o r   a   n e w   t i c k   t o   r e t r y . . " ) ) ; }  
                   i f   ( ! I s T e s t i n g ( ) )   { w h i l e ( R e f r e s h R a t e s ( ) = = f a l s e )   { S l e e p ( 1 ) ; } }  
                   r e t v a l = 1 ;  
                   b r e a k ;  
             c a s e   1 4 2 :   / / T h i s   c o d e   s h o u l d   b e   p r o c e s s e d   i n   t h e   s a m e   w a y   a s   e r r o r   1 2 8 .  
                   i f   ( m s g _ p r e f i x ! = " " )   { P r i n t ( S t r i n g C o n c a t e n a t e ( m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) , " .   R e t r y i n g . . " ) ) ; }  
                   R e f r e s h R a t e s ( ) ;  
                   r e t v a l = 1 ;  
                   b r e a k ;  
             c a s e   1 4 3 :   / / T h i s   c o d e   s h o u l d   b e   p r o c e s s e d   i n   t h e   s a m e   w a y   a s   e r r o r   1 2 8 .  
                   i f   ( m s g _ p r e f i x ! = " " )   { P r i n t ( S t r i n g C o n c a t e n a t e ( m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) , " .   R e t r y i n g . . " ) ) ; }  
                   R e f r e s h R a t e s ( ) ;  
                   r e t v a l = 1 ;  
                   b r e a k ;  
             / * c a s e   1 4 5 :   / / E R R _ T R A D E _ M O D I F Y _ D E N I E D  
                   i f   ( m s g _ p r e f i x ! = " " )   { P r i n t ( S t r i n g C o n c a t e n a t e ( m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) , " .   W a i t i n g   f o r   a   n e w   t i c k   t o   r e t r y . . " ) ) ; }  
                   w h i l e ( R e f r e s h R a t e s ( ) = = f a l s e )   { S l e e p ( 1 ) ; }  
                   r e t u r n ( 1 ) ;  
             * /  
             c a s e   1 4 6 :   / / E R R _ T R A D E _ C O N T E X T _ B U S Y  
                   i f   ( m s g _ p r e f i x ! = " " )   { P r i n t ( S t r i n g C o n c a t e n a t e ( m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) , " .   R e t r y i n g . . " ) ) ; }  
                   w h i l e ( I s T r a d e C o n t e x t B u s y ( ) )   { S l e e p ( 5 0 ) ; }  
                   R e f r e s h R a t e s ( ) ;  
                   r e t v a l = 1 ;  
                   b r e a k ;  
             / / - -   c r i t i c a l   e r r o r s  
             d e f a u l t :  
                   i f   ( m s g _ p r e f i x ! = " " )   { P r i n t ( S t r i n g C o n c a t e n a t e ( m s g _ p r e f i x , " :   " , E r r o r M e s s a g e ( e r r o r _ c o d e ) ) ) ; }  
                   r e t v a l = 2 ;  
                   b r e a k ;  
       }  
  
       i f   ( r e t v a l = = 0 )   { t r y o u t s = 0 ; }  
       e l s e   i f   ( r e t v a l = = 1 )   {  
             t r y o u t s + + ;  
             i f   ( t r y o u t s > = 1 0 )   {  
                   t r y o u t s = 0 ;  
                   r e t v a l = 2 ;  
             }   e l s e   {  
                   P r i n t ( " r e t r y   # " + ( s t r i n g ) t r y o u t s + "   o f   1 0 " ) ;  
             }  
       }  
        
       r e t u r n ( r e t v a l ) ;  
 }  
  
 b o o l   C l o s e T r a d e ( u l o n g   t i c k e t ,   u l o n g   s l i p p a g e   =   0 ,   c o l o r   a r r o w c o l o r   =   C L R _ N O N E )  
 {  
 	 b o o l   s u c c e s s   =   f a l s e ;  
  
 	 i f   ( ! O r d e r S e l e c t ( ( i n t ) t i c k e t ,   S E L E C T _ B Y _ T I C K E T ,   M O D E _ T R A D E S ) )  
 	 {  
 	 	 r e t u r n   f a l s e ;  
 	 }  
  
 	 w h i l e   ( t r u e )  
 	 {  
 	 	 / / - -   w a i t   i f   n e e d e d   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 W a i t T r a d e C o n t e x t I f B u s y ( ) ;  
  
 	 	 / / - -   c l o s e   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 s u c c e s s   =   O r d e r C l o s e ( ( i n t ) t i c k e t ,   O r d e r L o t s ( ) ,   O r d e r C l o s e P r i c e ( ) ,   ( i n t ) ( s l i p p a g e   *   P i p V a l u e ( O r d e r S y m b o l ( ) ) ) ,   a r r o w c o l o r ) ;  
  
 	 	 i f   ( s u c c e s s   = =   t r u e )  
 	 	 {  
 	 	 	 i f   ( U S E _ V I R T U A L _ S T O P S )   {  
 	 	 	 	 V i r t u a l S t o p s D r i v e r ( " c l e a r " ,   t i c k e t ) ;  
 	 	 	 }  
  
 	 	 	 R e g i s t e r E v e n t ( " t r a d e " ) ;  
  
 	 	 	 r e t u r n   t r u e ;  
 	 	 }  
  
 	 	 / / - -   e r r o r s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 i n t   e r r a c t i o n   =   C h e c k F o r T r a d i n g E r r o r ( G e t L a s t E r r o r ( ) ,   " C l o s i n g   t r a d e   # "   +   ( s t r i n g ) t i c k e t   +   "   e r r o r " ) ;  
  
 	 	 s w i t c h ( e r r a c t i o n )  
 	 	 {  
 	 	 	 c a s e   0 :   b r e a k ;         / /   n o   e r r o r  
 	 	 	 c a s e   1 :   c o n t i n u e ;   / /   o v e r c o m a b l e   e r r o r  
 	 	 	 c a s e   2 :   b r e a k ;         / /   f a t a l   e r r o r  
 	 	 }  
  
 	 	 b r e a k ;  
 	 }  
  
 	 r e t u r n   f a l s e ;  
 }  
  
 t e m p l a t e < t y p e n a m e   D T 1 ,   t y p e n a m e   D T 2 >  
 b o o l   C o m p a r e V a l u e s ( s t r i n g   s i g n ,   D T 1   v 1 ,   D T 2   v 2 )  
 {  
 	           i f   ( s i g n   = =   " > " )   r e t u r n ( v 1   >   v 2 ) ;  
 	 e l s e   i f   ( s i g n   = =   " < " )   r e t u r n ( v 1   <   v 2 ) ;  
 	 e l s e   i f   ( s i g n   = =   " > = " )   r e t u r n ( v 1   > =   v 2 ) ;  
 	 e l s e   i f   ( s i g n   = =   " < = " )   r e t u r n ( v 1   < =   v 2 ) ;  
 	 e l s e   i f   ( s i g n   = =   " = = " )   r e t u r n ( v 1   = =   v 2 ) ;  
 	 e l s e   i f   ( s i g n   = =   " ! = " )   r e t u r n ( v 1   ! =   v 2 ) ;  
 	 e l s e   i f   ( s i g n   = =   " x > " )   r e t u r n ( v 1   >   v 2 ) ;  
 	 e l s e   i f   ( s i g n   = =   " x < " )   r e t u r n ( v 1   <   v 2 ) ;  
  
 	 r e t u r n   f a l s e ;  
 }  
  
 s t r i n g   C u r r e n t S y m b o l ( s t r i n g   s y m b o l = " " )  
 {  
       s t a t i c   s t r i n g   m e m o r y = " " ;  
       i f   ( s y m b o l ! = " " )   { m e m o r y = s y m b o l ; }   e l s e  
       i f   ( m e m o r y = = " " )   { m e m o r y = S y m b o l ( ) ; }  
       r e t u r n ( m e m o r y ) ;  
 }  
  
 E N U M _ T I M E F R A M E S   C u r r e n t T i m e f r a m e ( E N U M _ T I M E F R A M E S   t f = - 1 )  
 {  
 	 s t a t i c   E N U M _ T I M E F R A M E S   m e m o r y = 0 ;  
       i f   ( t f > = 0 )   { m e m o r y = t f ; }  
       r e t u r n ( m e m o r y ) ;  
 }  
  
 d o u b l e   C u s t o m P o i n t ( s t r i n g   s y m b o l )  
 {  
 	 s t a t i c   s t r i n g   s y m b o l s [ ] ;  
 	 s t a t i c   d o u b l e   p o i n t s [ ] ;  
 	 s t a t i c   s t r i n g   l a s t _ s y m b o l   =   " - " ;  
 	 s t a t i c   d o u b l e   l a s t _ p o i n t     =   0 ;  
 	 s t a t i c   i n t   l a s t _ i                   =   0 ;  
 	 s t a t i c   i n t   s i z e                       =   0 ;  
  
 	 / / - -   v a r i a n t   A )   u s e   t h e   c a c h e   f o r   t h e   l a s t   u s e d   s y m b o l  
 	 i f   ( s y m b o l   = =   l a s t _ s y m b o l )  
 	 {  
 	 	 r e t u r n   l a s t _ p o i n t ;  
 	 }  
  
 	 / / - -   v a r i a n t   B )   s e a r c h   i n   t h e   a r r a y   c a c h e  
 	 i n t   i 	 	 	 =   l a s t _ i ;  
 	 i n t   s t a r t _ i 	 =   i ;  
 	 b o o l   f o u n d 	 =   f a l s e ;  
  
 	 i f   ( s i z e   >   0 )  
 	 {  
 	 	 w h i l e   ( t r u e )  
 	 	 {  
 	 	 	 i f   ( s y m b o l s [ i ]   = =   s y m b o l )  
 	 	 	 {  
 	 	 	 	 l a s t _ s y m b o l 	 =   s y m b o l ;  
 	 	 	 	 l a s t _ p o i n t 	 =   p o i n t s [ i ] ;  
 	 	 	 	 l a s t _ i 	 	 =   i ;  
  
 	 	 	 	 r e t u r n   l a s t _ p o i n t ;  
 	 	 	 }  
  
 	 	 	 i + + ;  
  
 	 	 	 i f   ( i   > =   s i z e )  
 	 	 	 {  
 	 	 	 	 i   =   0 ;  
 	 	 	 }  
 	 	 	 i f   ( i   = =   s t a r t _ i )   { b r e a k ; }  
 	 	 }  
 	 }  
  
 	 / / - -   v a r i a n t   C )   a d d   t h i s   s y m b o l   t o   t h e   c a c h e  
 	 i 	 	 =   s i z e ;  
 	 s i z e 	 =   s i z e   +   1 ;  
  
 	 A r r a y R e s i z e ( s y m b o l s ,   s i z e ) ;  
 	 A r r a y R e s i z e ( p o i n t s ,   s i z e ) ;  
  
 	 s y m b o l s [ i ] 	 =   s y m b o l ;  
 	 p o i n t s [ i ] 	 =   0 ;  
 	 l a s t _ s y m b o l 	 =   s y m b o l ;  
 	 l a s t _ i 	 	 =   i ;  
  
 	 / / - -   u n s e r i a l i z e   r u l e s   f r o m   F X D _ P O I N T _ F O R M A T _ R U L E S  
 	 s t r i n g   r u l e s [ ] ;  
 	 S t r i n g E x p l o d e ( " , " ,   P O I N T _ F O R M A T _ R U L E S ,   r u l e s ) ;  
  
 	 i n t   r u l e s _ c o u n t   =   A r r a y S i z e ( r u l e s ) ;  
  
 	 i f   ( r u l e s _ c o u n t   >   0 )  
 	 {  
 	 	 s t r i n g   r u l e [ ] ;  
  
 	 	 f o r   ( i n t   r   =   0 ;   r   <   r u l e s _ c o u n t ;   r + + )  
 	 	 {  
 	 	 	 S t r i n g E x p l o d e ( " = " ,   r u l e s [ r ] ,   r u l e ) ;  
  
 	 	 	 / / - -   a   s i n g l e   r u l e   m u s t   c o n t a i n   2   p a r t s ,   [ 0 ]   f r o m   a n d   [ 1 ]   t o  
 	 	 	 i f   ( A r r a y S i z e ( r u l e )   ! =   2 )   { c o n t i n u e ; }  
  
 	 	 	 d o u b l e   f r o m   =   S t r i n g T o D o u b l e ( r u l e [ 0 ] ) ;  
 	 	 	 d o u b l e   t o 	 =   S t r i n g T o D o u b l e ( r u l e [ 1 ] ) ;  
  
 	 	 	 / / - -   " t o "   m u s t   b e   a   p o s i t i v e   n u m b e r ,   d i f f e r e n t   t h a n   0  
 	 	 	 i f   ( t o   < =   0 )   { c o n t i n u e ; }  
  
 	 	 	 / / - -   " f r o m "   c a n   b e   a   n u m b e r   o r   a   s t r i n g  
 	 	 	 / /   a )   s t r i n g  
 	 	 	 i f   ( f r o m   = =   0   & &   S t r i n g L e n ( r u l e [ 0 ] )   >   0 )  
 	 	 	 {  
 	 	 	 	 s t r i n g   s _ f r o m   =   r u l e [ 0 ] ;  
 	 	 	 	 i n t   p o s               =   S t r i n g F i n d ( s _ f r o m ,   " ? " ) ;  
  
 	 	 	 	 i f   ( p o s   <   0 )   / /   ?   n o t   f o u n d  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( S t r i n g F i n d ( s y m b o l ,   s _ f r o m )   = =   0 )   { p o i n t s [ i ]   =   t o ; }  
 	 	 	 	 }  
 	 	 	 	 e l s e   i f   ( p o s   = =   0 )   / /   ?   i s   t h e   f i r s t   s y m b o l   = >   m a t c h   t h e   s e c o n d   s y m b o l  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( S t r i n g F i n d ( s y m b o l ,   S t r i n g S u b s t r ( s _ f r o m ,   1 ) ,   3 )   = =   3 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 p o i n t s [ i ]   =   t o ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 	 e l s e   i f   ( p o s   >   0 )   / /   ?   i s   t h e   s e c o n d   s y m b o l   = >   m a t c h   t h e   f i r s t   s y m b o l  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( S t r i n g F i n d ( s y m b o l ,   S t r i n g S u b s t r ( s _ f r o m ,   0 ,   p o s ) )   = =   0 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 p o i n t s [ i ]   =   t o ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 / /   b )   n u m b e r  
 	 	 	 i f   ( f r o m   = =   0 )   { c o n t i n u e ; }  
  
 	 	 	 i f   ( S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ P O I N T )   = =   f r o m )  
 	 	 	 {  
 	 	 	 	 p o i n t s [ i ]   =   t o ;  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 i f   ( p o i n t s [ i ]   = =   0 )  
 	 {  
 	 	 p o i n t s [ i ]   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ P O I N T ) ;  
 	 }  
  
 	 l a s t _ p o i n t   =   p o i n t s [ i ] ;  
  
 	 r e t u r n   l a s t _ p o i n t ;  
 }  
  
 b o o l   D e l e t e O r d e r ( i n t   t i c k e t ,   c o l o r   a r r o w c o l o r = c l r N O N E )  
 {  
       b o o l   s u c c e s s = f a l s e ;  
       i f   ( ! O r d e r S e l e c t ( t i c k e t , S E L E C T _ B Y _ T I C K E T , M O D E _ T R A D E S ) )   { r e t u r n ( f a l s e ) ; }  
        
       w h i l e ( t r u e )  
       {  
             / / - -   w a i t   i f   n e e d e d   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
             W a i t T r a d e C o n t e x t I f B u s y ( ) ;  
             / / - -   d e l e t e   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
             s u c c e s s = O r d e r D e l e t e ( t i c k e t , a r r o w c o l o r ) ;  
             i f   ( s u c c e s s = = t r u e )   {  
                   i f   ( U S E _ V I R T U A L _ S T O P S )   {  
                         V i r t u a l S t o p s D r i v e r ( " c l e a r " , t i c k e t ) ;  
                   }  
                   R e g i s t e r E v e n t ( " t r a d e " ) ;  
                   r e t u r n ( t r u e ) ;  
             }  
             / / - -   e r r o r   c h e c k   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
             i n t   e r r a c t i o n = C h e c k F o r T r a d i n g E r r o r ( G e t L a s t E r r o r ( ) ,   " D e l e t i n g   o r d e r   # " + ( s t r i n g ) t i c k e t + "   e r r o r " ) ;  
             s w i t c h ( e r r a c t i o n )  
             {  
                   c a s e   0 :   b r e a k ;         / /   n o   e r r o r  
                   c a s e   1 :   c o n t i n u e ;   / /   o v e r c o m a b l e   e r r o r  
                   c a s e   2 :   b r e a k ;         / /   f a t a l   e r r o r  
             }  
             b r e a k ;  
       }  
       r e t u r n ( f a l s e ) ;  
 }  
  
 v o i d   D r a w S p r e a d I n f o ( )  
 {  
       s t a t i c   b o o l   a l l o w _ d r a w   =   t r u e ;  
       i f   ( a l l o w _ d r a w = = f a l s e )   { r e t u r n ; }  
       i f   ( M Q L I n f o I n t e g e r ( M Q L _ T E S T E R )   & &   ! M Q L I n f o I n t e g e r ( M Q L _ V I S U A L _ M O D E ) )   { a l l o w _ d r a w = f a l s e ; }   / /   A l l o w e d   t o   d r a w   o n l y   o n c e   i n   t e s t i n g   m o d e  
  
       s t a t i c   b o o l   p a s s e d                   =   f a l s e ;  
       s t a t i c   d o u b l e   m a x _ s p r e a d       =   0 ;  
       s t a t i c   d o u b l e   m i n _ s p r e a d       =   E M P T Y _ V A L U E ;  
       s t a t i c   d o u b l e   a v g _ s p r e a d       =   0 ;  
       s t a t i c   d o u b l e   a v g _ a d d             =   0 ;  
       s t a t i c   d o u b l e   a v g _ c n t             =   0 ;  
  
       d o u b l e   c u s t o m _ p o i n t   =   C u s t o m P o i n t ( S y m b o l ( ) ) ;  
       d o u b l e   c u r r e n t _ s p r e a d   =   0 ;  
       i f   ( c u s t o m _ p o i n t   >   0 )   {  
             c u r r e n t _ s p r e a d   =   ( S y m b o l I n f o D o u b l e ( S y m b o l ( ) , S Y M B O L _ A S K ) - S y m b o l I n f o D o u b l e ( S y m b o l ( ) , S Y M B O L _ B I D ) ) / c u s t o m _ p o i n t ;  
       }  
       i f   ( c u r r e n t _ s p r e a d   >   m a x _ s p r e a d )   { m a x _ s p r e a d   =   c u r r e n t _ s p r e a d ; }  
       i f   ( c u r r e n t _ s p r e a d   <   m i n _ s p r e a d )   { m i n _ s p r e a d   =   c u r r e n t _ s p r e a d ; }  
        
       a v g _ c n t + + ;  
       a v g _ a d d           =   a v g _ a d d   +   c u r r e n t _ s p r e a d ;  
       a v g _ s p r e a d     =   a v g _ a d d   /   a v g _ c n t ;  
  
       i n t   x = 0 ;   i n t   y = 0 ;  
       s t r i n g   n a m e ;  
  
       / /   c r e a t e   o b j e c t s  
       i f   ( p a s s e d   = =   f a l s e )  
       {  
             p a s s e d = t r u e ;  
              
             n a m e = " f x d _ s p r e a d _ c u r r e n t _ l a b e l " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 1 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   1 8 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r D a r k O r a n g e ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " S p r e a d : " ) ;  
             }  
             n a m e = " f x d _ s p r e a d _ m a x _ l a b e l " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 1 4 8 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r O r a n g e R e d ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " m a x : " ) ;  
             }  
             n a m e = " f x d _ s p r e a d _ a v g _ l a b e l " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 1 4 8 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 9 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r D a r k O r a n g e ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " a v g : " ) ;  
             }  
             n a m e = " f x d _ s p r e a d _ m i n _ l a b e l " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 1 4 8 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r G o l d ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " m i n : " ) ;  
             }  
             n a m e = " f x d _ s p r e a d _ c u r r e n t " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 9 3 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   1 8 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r D a r k O r a n g e ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " 0 " ) ;  
             }  
             n a m e = " f x d _ s p r e a d _ m a x " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 1 7 3 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r O r a n g e R e d ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " 0 " ) ;  
             }  
             n a m e = " f x d _ s p r e a d _ a v g " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 1 7 3 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 9 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r D a r k O r a n g e ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " 0 " ) ;  
             }  
             n a m e = " f x d _ s p r e a d _ m i n " ;  
             i f   ( O b j e c t F i n d ( 0 ,   n a m e ) = = - 1 )   {  
                   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 1 7 3 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ F O N T S I Z E ,   7 ) ;  
                   O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   c l r G o l d ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
                   O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   " 0 " ) ;  
             }  
       }  
        
       O b j e c t S e t S t r i n g ( 0 ,   " f x d _ s p r e a d _ c u r r e n t " ,   O B J P R O P _ T E X T ,   D o u b l e T o S t r ( c u r r e n t _ s p r e a d , 2 ) ) ;  
       O b j e c t S e t S t r i n g ( 0 ,   " f x d _ s p r e a d _ m a x " ,   O B J P R O P _ T E X T ,   D o u b l e T o S t r ( m a x _ s p r e a d , 2 ) ) ;  
       O b j e c t S e t S t r i n g ( 0 ,   " f x d _ s p r e a d _ a v g " ,   O B J P R O P _ T E X T ,   D o u b l e T o S t r ( a v g _ s p r e a d , 2 ) ) ;  
       O b j e c t S e t S t r i n g ( 0 ,   " f x d _ s p r e a d _ m i n " ,   O B J P R O P _ T E X T ,   D o u b l e T o S t r ( m i n _ s p r e a d , 2 ) ) ;  
 }  
  
 s t r i n g   D r a w S t a t u s ( s t r i n g   t e x t = " " )  
 {  
       s t a t i c   s t r i n g   m e m o r y ;  
       i f   ( t e x t = = " " )   {  
             r e t u r n ( m e m o r y ) ;  
       }  
        
       s t a t i c   b o o l   p a s s e d   =   f a l s e ;  
       i n t   x = 2 1 0 ;   i n t   y = 0 ;  
       s t r i n g   n a m e ;  
  
       / / - -   d r a w   t h e   o b j e c t s   o n c e  
       i f   ( p a s s e d   = =   f a l s e )  
       {  
             p a s s e d   =   t r u e ;  
             n a m e = " f x d _ s t a t u s _ t i t l e " ;  
             O b j e c t C r e a t e ( 0 , n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ B A C K ,   f a l s e ) ;  
             O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
             O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
             O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ X D I S T A N C E ,   x ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 7 ) ;  
             O b j e c t S e t S t r i n g ( 0 , n a m e ,   O B J P R O P _ T E X T ,   " S t a t u s " ) ;  
             O b j e c t S e t S t r i n g ( 0 , n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ F O N T S I Z E ,   7 ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ C O L O R ,   c l r G r a y ) ;  
              
             n a m e = " f x d _ s t a t u s _ t e x t " ;  
             O b j e c t C r e a t e ( 0 , n a m e ,   O B J _ L A B E L ,   0 ,   0 ,   0 ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ B A C K ,   f a l s e ) ;  
             O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O R N E R ,   C O R N E R _ L E F T _ L O W E R ) ;  
             O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ A N C H O R ,   A N C H O R _ L E F T _ L O W E R ) ;  
             O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ H I D D E N ,   t r u e ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ X D I S T A N C E ,   x + 2 ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ Y D I S T A N C E ,   y + 1 ) ;  
             O b j e c t S e t S t r i n g ( 0 , n a m e ,   O B J P R O P _ F O N T ,   " A r i a l " ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ F O N T S I Z E ,   1 2 ) ;  
             O b j e c t S e t I n t e g e r ( 0 , n a m e ,   O B J P R O P _ C O L O R ,   c l r A q u a ) ;  
       }  
  
       / / - -   u p d a t e   t h e   t e x t   w h e n   n e e d e d  
       i f   ( t e x t   ! =   m e m o r y )   {  
             m e m o r y = t e x t ;  
             O b j e c t S e t S t r i n g ( 0 , " f x d _ s t a t u s _ t e x t " ,   O B J P R O P _ T E X T ,   t e x t ) ;  
       }  
        
       r e t u r n ( t e x t ) ;  
 }  
  
 d o u b l e   D y n a m i c L o t s ( s t r i n g   s y m b o l ,   s t r i n g   m o d e = " b a l a n c e " ,   d o u b l e   v a l u e = 0 ,   d o u b l e   s l = 0 ,   s t r i n g   a l i g n = " a l i g n " ,   d o u b l e   R J F R _ i n i t i a l _ l o t s = 0 )  
 {  
       d o u b l e   s i z e = 0 ;  
       d o u b l e   L o t S t e p = M a r k e t I n f o ( s y m b o l , M O D E _ L O T S T E P ) ;  
       d o u b l e   L o t S i z e = M a r k e t I n f o ( s y m b o l , M O D E _ L O T S I Z E ) ;  
       d o u b l e   M i n L o t s = M a r k e t I n f o ( s y m b o l , M O D E _ M I N L O T ) ;  
       d o u b l e   M a x L o t s = M a r k e t I n f o ( s y m b o l , M O D E _ M A X L O T ) ;  
       d o u b l e   T i c k V a l u e = M a r k e t I n f o ( s y m b o l , M O D E _ T I C K V A L U E ) ;  
       d o u b l e   p o i n t = M a r k e t I n f o ( s y m b o l , M O D E _ P O I N T ) ;  
       d o u b l e   t i c k s i z e = M a r k e t I n f o ( s y m b o l , M O D E _ T I C K S I Z E ) ;  
       d o u b l e   m a r g i n _ r e q u i r e d = M a r k e t I n f o ( s y m b o l , M O D E _ M A R G I N R E Q U I R E D ) ;  
        
       i f   ( m o d e = = " f i x e d "   | |   m o d e = = " l o t s " )           { s i z e = v a l u e ; }  
       e l s e   i f   ( m o d e = = " b l o c k - e q u i t y " )             { s i z e = ( v a l u e / 1 0 0 ) * A c c o u n t E q u i t y ( ) / m a r g i n _ r e q u i r e d ; }  
       e l s e   i f   ( m o d e = = " b l o c k - b a l a n c e " )           { s i z e = ( v a l u e / 1 0 0 ) * A c c o u n t B a l a n c e ( ) / m a r g i n _ r e q u i r e d ; }  
       e l s e   i f   ( m o d e = = " b l o c k - f r e e m a r g i n " )     { s i z e = ( v a l u e / 1 0 0 ) * A c c o u n t F r e e M a r g i n ( ) / m a r g i n _ r e q u i r e d ; }  
       e l s e   i f   ( m o d e = = " e q u i t y " )             { s i z e = ( v a l u e / 1 0 0 ) * A c c o u n t E q u i t y ( ) / ( L o t S i z e * T i c k V a l u e ) ; }  
       e l s e   i f   ( m o d e = = " b a l a n c e " )           { s i z e = ( v a l u e / 1 0 0 ) * A c c o u n t B a l a n c e ( ) / ( L o t S i z e * T i c k V a l u e ) ; }  
       e l s e   i f   ( m o d e = = " f r e e m a r g i n " )     { s i z e = ( v a l u e / 1 0 0 ) * A c c o u n t F r e e M a r g i n ( ) / ( L o t S i z e * T i c k V a l u e ) ; }  
       e l s e   i f   ( m o d e = = " e q u i t y R i s k " )           { s i z e = ( ( v a l u e / 1 0 0 ) * A c c o u n t E q u i t y ( ) ) / ( s l * ( ( T i c k V a l u e / t i c k s i z e ) * p o i n t ) * P i p V a l u e ( s y m b o l ) ) ; }  
       e l s e   i f   ( m o d e = = " b a l a n c e R i s k " )         { s i z e = ( ( v a l u e / 1 0 0 ) * A c c o u n t B a l a n c e ( ) ) / ( s l * ( ( T i c k V a l u e / t i c k s i z e ) * p o i n t ) * P i p V a l u e ( s y m b o l ) ) ; }  
       e l s e   i f   ( m o d e = = " f r e e m a r g i n R i s k " )   { s i z e = ( ( v a l u e / 1 0 0 ) * A c c o u n t F r e e M a r g i n ( ) ) / ( s l * ( ( T i c k V a l u e / t i c k s i z e ) * p o i n t ) * P i p V a l u e ( s y m b o l ) ) ; }  
       e l s e   i f   ( m o d e = = " f i x e d R i s k " )       { s i z e = ( v a l u e ) / ( s l * ( ( T i c k V a l u e / t i c k s i z e ) * p o i n t ) * P i p V a l u e ( s y m b o l ) ) ; }  
       e l s e   i f   ( m o d e = = " f i x e d R a t i o "   | |   m o d e = = " R J F R " )   {  
              
             / / / / /  
             / /   R y a n   J o n e s   F i x e d   R a t i o   M M   s t a t i c   d a t a  
             s t a t i c   d o u b l e   R J F R _ s t a r t _ l o t s = 0 ;  
             s t a t i c   d o u b l e   R J F R _ d e l t a = 0 ;  
             s t a t i c   d o u b l e   R J F R _ u n i t s = 1 ;  
             s t a t i c   d o u b l e   R J F R _ t a r g e t _ l o w e r = 0 ;  
             s t a t i c   d o u b l e   R J F R _ t a r g e t _ u p p e r = 0 ;  
             / / / / /  
              
             i f   ( R J F R _ s t a r t _ l o t s < = 0 )   { R J F R _ s t a r t _ l o t s = v a l u e ; }  
             i f   ( R J F R _ s t a r t _ l o t s < M i n L o t s )   { R J F R _ s t a r t _ l o t s = M i n L o t s ; }  
             i f   ( R J F R _ d e l t a < = 0 )   { R J F R _ d e l t a = s l ; }  
             i f   ( R J F R _ t a r g e t _ u p p e r < = 0 )   {  
                   R J F R _ t a r g e t _ u p p e r = A c c o u n t E q u i t y ( ) + ( R J F R _ u n i t s * R J F R _ d e l t a ) ;  
                   P r i n t ( " F i x e d   R a t i o   M M :   U n i t s = > " , R J F R _ u n i t s , " ;   D e l t a = " , R J F R _ d e l t a , " ;   U p p e r   T a r g e t   E q u i t y = > " , R J F R _ t a r g e t _ u p p e r ) ;  
             }  
             i f   ( A c c o u n t E q u i t y ( ) > = R J F R _ t a r g e t _ u p p e r )  
             {  
                   w h i l e ( t r u e )   {  
                         P r i n t ( " F i x e d   R a t i o   M M   g o i n g   u p   t o   " , ( R J F R _ s t a r t _ l o t s * ( R J F R _ u n i t s + 1 ) ) , "   l o t s :   E q u i t y   i s   a b o v e   U p p e r   T a r g e t   E q u i t y   ( " , A c c o u n t E q u i t y ( ) , " > = " , R J F R _ t a r g e t _ u p p e r , " ) " ) ;  
                         R J F R _ u n i t s + + ;  
                         R J F R _ t a r g e t _ l o w e r = R J F R _ t a r g e t _ u p p e r ;  
                         R J F R _ t a r g e t _ u p p e r = R J F R _ t a r g e t _ u p p e r + ( R J F R _ u n i t s * R J F R _ d e l t a ) ;  
                         P r i n t ( " F i x e d   R a t i o   M M :   U n i t s = > " , R J F R _ u n i t s , " ;   D e l t a = " , R J F R _ d e l t a , " ;   L o w e r   T a r g e t   E q u i t y = > " , R J F R _ t a r g e t _ l o w e r , " ;   U p p e r   T a r g e t   E q u i t y = > " , R J F R _ t a r g e t _ u p p e r ) ;  
                         i f   ( A c c o u n t E q u i t y ( ) < R J F R _ t a r g e t _ u p p e r )   { b r e a k ; }  
                   }  
             }  
             e l s e   i f   ( A c c o u n t E q u i t y ( ) < = R J F R _ t a r g e t _ l o w e r )  
             {  
                   w h i l e ( t r u e )   {  
                   i f   ( A c c o u n t E q u i t y ( ) > R J F R _ t a r g e t _ l o w e r )   { b r e a k ; }  
                         i f   ( R J F R _ u n i t s > 1 )   {                    
                               P r i n t ( " F i x e d   R a t i o   M M   g o i n g   d o w n   t o   " , ( R J F R _ s t a r t _ l o t s * ( R J F R _ u n i t s - 1 ) ) , "   l o t s :   E q u i t y   i s   b e l o w   L o w e r   T a r g e t   E q u i t y   |   " ,   A c c o u n t E q u i t y ( ) , "   < =   " , R J F R _ t a r g e t _ l o w e r , " ) " ) ;  
                               R J F R _ t a r g e t _ u p p e r = R J F R _ t a r g e t _ l o w e r ;  
                               R J F R _ t a r g e t _ l o w e r = R J F R _ t a r g e t _ l o w e r - ( ( R J F R _ u n i t s - 1 ) * R J F R _ d e l t a ) ;  
                               R J F R _ u n i t s - - ;  
                               P r i n t ( " F i x e d   R a t i o   M M :   U n i t s = > " , R J F R _ u n i t s , " ;   D e l t a = " , R J F R _ d e l t a , " ;   L o w e r   T a r g e t   E q u i t y = > " , R J F R _ t a r g e t _ l o w e r , " ;   U p p e r   T a r g e t   E q u i t y = > " , R J F R _ t a r g e t _ u p p e r ) ;  
                         }   e l s e   { b r e a k ; }  
                   }  
             }  
             s i z e = R J F R _ s t a r t _ l o t s * R J F R _ u n i t s ;  
       }  
        
 	 i f   ( s i z e = = E M P T Y _ V A L U E )   { s i z e = 0 ; }  
 	  
       s i z e = M a t h R o u n d ( s i z e / L o t S t e p ) * L o t S t e p ;  
        
       s t a t i c   b o o l   a l e r t _ m i n _ l o t s = f a l s e ;  
       i f   ( s i z e < M i n L o t s   & &   a l e r t _ m i n _ l o t s = = f a l s e )   {  
             a l e r t _ m i n _ l o t s = t r u e ;  
             A l e r t ( " Y o u   w a n t   t o   t r a d e   " , s i z e , "   l o t ,   b u t   y o u r   b r o k e r ' s   m i n i m u m   i s   " , M i n L o t s , "   l o t .   T h e   t r a d e / o r d e r   w i l l   c o n t i n u e   w i t h   " , M i n L o t s , "   l o t   i n s t e a d   o f   " , s i z e , "   l o t .   T h e   s a m e   r u l e   w i l l   b e   a p p l i e d   f o r   n e x t   t r a d e s / o r d e r s   w i t h   d e s i r e d   l o t   s i z e   l o w e r   t h a n   t h e   m i n i m u m .   Y o u   w i l l   n o t   s e e   t h i s   m e s s a g e   a g a i n   u n t i l   y o u   r e s t a r t   t h e   p r o g r a m . " ) ;  
       }  
        
       i f   ( a l i g n = = " a l i g n " )   {  
             i f   ( s i z e < M i n L o t s )   { s i z e = M i n L o t s ; }  
             i f   ( s i z e > M a x L o t s )   { s i z e = M a x L o t s ; }  
       }  
        
       r e t u r n   ( s i z e ) ;  
 }  
  
 s t r i n g   E r r o r M e s s a g e ( i n t   e r r o r _ c o d e = - 1 )  
 {  
 	 s t r i n g   e   =   " " ;  
 	  
 	 i f   ( e r r o r _ c o d e   <   0 )   { e r r o r _ c o d e   =   G e t L a s t E r r o r ( ) ; }  
 	  
 	 s w i t c h ( e r r o r _ c o d e )  
 	 {  
 	 	 / / - -   c o d e s   r e t u r n e d   f r o m   t r a d e   s e r v e r  
 	 	 c a s e   0 : 	 r e t u r n ( " " ) ;  
 	 	 c a s e   1 : 	 e   =   " N o   e r r o r   r e t u r n e d " ;   b r e a k ;  
 	 	 c a s e   2 : 	 e   =   " C o m m o n   e r r o r " ;   b r e a k ;  
 	 	 c a s e   3 : 	 e   =   " I n v a l i d   t r a d e   p a r a m e t e r s " ;   b r e a k ;  
 	 	 c a s e   4 : 	 e   =   " T r a d e   s e r v e r   i s   b u s y " ;   b r e a k ;  
 	 	 c a s e   5 : 	 e   =   " O l d   v e r s i o n   o f   t h e   c l i e n t   t e r m i n a l " ;   b r e a k ;  
 	 	 c a s e   6 : 	 e   =   " N o   c o n n e c t i o n   w i t h   t r a d e   s e r v e r " ;   b r e a k ;  
 	 	 c a s e   7 : 	 e   =   " N o t   e n o u g h   r i g h t s " ;   b r e a k ;  
 	 	 c a s e   8 : 	 e   =   " T o o   f r e q u e n t   r e q u e s t s " ;   b r e a k ;  
 	 	 c a s e   9 : 	 e   =   " M a l f u n c t i o n a l   t r a d e   o p e r a t i o n   ( n e v e r   r e t u r n e d   e r r o r ) " ;   b r e a k ;  
 	 	 c a s e   6 4 :     e   =   " A c c o u n t   d i s a b l e d " ;   b r e a k ;  
 	 	 c a s e   6 5 :     e   =   " I n v a l i d   a c c o u n t " ;   b r e a k ;  
 	 	 c a s e   1 2 8 :   e   =   " T r a d e   t i m e o u t " ;   b r e a k ;  
 	 	 c a s e   1 2 9 :   e   =   " I n v a l i d   p r i c e " ;   b r e a k ;  
 	 	 c a s e   1 3 0 :   e   =   " I n v a l i d   S l   o r   T P " ;   b r e a k ;  
 	 	 c a s e   1 3 1 :   e   =   " I n v a l i d   t r a d e   v o l u m e " ;   b r e a k ;  
 	 	 c a s e   1 3 2 :   e   =   " M a r k e t   i s   c l o s e d " ;   b r e a k ;  
 	 	 c a s e   1 3 3 :   e   =   " T r a d e   i s   d i s a b l e d " ;   b r e a k ;  
 	 	 c a s e   1 3 4 :   e   =   " N o t   e n o u g h   m o n e y " ;   b r e a k ;  
 	 	 c a s e   1 3 5 :   e   =   " P r i c e   c h a n g e d " ;   b r e a k ;  
 	 	 c a s e   1 3 6 :   e   =   " O f f   q u o t e s " ;   b r e a k ;  
 	 	 c a s e   1 3 7 :   e   =   " B r o k e r   i s   b u s y   ( n e v e r   r e t u r n e d   e r r o r ) " ;   b r e a k ;  
 	 	 c a s e   1 3 8 :   e   =   " R e q u o t e " ;   b r e a k ;  
 	 	 c a s e   1 3 9 :   e   =   " O r d e r   i s   l o c k e d " ;   b r e a k ;  
 	 	 c a s e   1 4 0 :   e   =   " O n l y   l o n g   t r a d e s   a l l o w e d " ;   b r e a k ;  
 	 	 c a s e   1 4 1 :   e   =   " T o o   m a n y   r e q u e s t s " ;   b r e a k ;  
 	 	 c a s e   1 4 5 :   e   =   " M o d i f i c a t i o n   d e n i e d   b e c a u s e   o r d e r   t o o   c l o s e   t o   m a r k e t " ;   b r e a k ;  
 	 	 c a s e   1 4 6 :   e   =   " T r a d e   c o n t e x t   i s   b u s y " ;   b r e a k ;  
 	 	 c a s e   1 4 7 :   e   =   " E x p i r a t i o n s   a r e   d e n i e d   b y   b r o k e r " ;   b r e a k ;  
 	 	 c a s e   1 4 8 :   e   =   " A m o u n t   o f   o p e n   a n d   p e n d i n g   o r d e r s   h a s   r e a c h e d   t h e   l i m i t " ;   b r e a k ;  
 	 	 c a s e   1 4 9 :   e   =   " H e d g i n g   i s   p r o h i b i t e d " ;   b r e a k ;  
 	 	 c a s e   1 5 0 :   e   =   " P r o h i b i t e d   b y   F I F O   r u l e s " ;   b r e a k ;  
 	 	  
 	 	 / / - -   m q l 4   e r r o r s  
 	 	 c a s e   4 0 0 0 :   e   =   " N o   e r r o r " ;   b r e a k ;  
 	 	 c a s e   4 0 0 1 :   e   =   " W r o n g   f u n c t i o n   p o i n t e r " ;   b r e a k ;  
 	 	 c a s e   4 0 0 2 :   e   =   " A r r a y   i n d e x   i s   o u t   o f   r a n g e " ;   b r e a k ;  
 	 	 c a s e   4 0 0 3 :   e   =   " N o   m e m o r y   f o r   f u n c t i o n   c a l l   s t a c k " ;   b r e a k ;  
 	 	 c a s e   4 0 0 4 :   e   =   " R e c u r s i v e   s t a c k   o v e r f l o w " ;   b r e a k ;  
 	 	 c a s e   4 0 0 5 :   e   =   " N o t   e n o u g h   s t a c k   f o r   p a r a m e t e r " ;   b r e a k ;  
 	 	 c a s e   4 0 0 6 :   e   =   " N o   m e m o r y   f o r   p a r a m e t e r   s t r i n g " ;   b r e a k ;  
 	 	 c a s e   4 0 0 7 :   e   =   " N o   m e m o r y   f o r   t e m p   s t r i n g " ;   b r e a k ;  
 	 	 c a s e   4 0 0 8 :   e   =   " N o t   i n i t i a l i z e d   s t r i n g " ;   b r e a k ;  
 	 	 c a s e   4 0 0 9 :   e   =   " N o t   i n i t i a l i z e d   s t r i n g   i n   a r r a y " ;   b r e a k ;  
 	 	 c a s e   4 0 1 0 :   e   =   " N o   m e m o r y   f o r   a r r a y   s t r i n g " ;   b r e a k ;  
 	 	 c a s e   4 0 1 1 :   e   =   " T o o   l o n g   s t r i n g " ;   b r e a k ;  
 	 	 c a s e   4 0 1 2 :   e   =   " R e m a i n d e r   f r o m   z e r o   d i v i d e " ;   b r e a k ;  
 	 	 c a s e   4 0 1 3 :   e   =   " Z e r o   d i v i d e " ;   b r e a k ;  
 	 	 c a s e   4 0 1 4 :   e   =   " U n k n o w n   c o m m a n d " ;   b r e a k ;  
 	 	 c a s e   4 0 1 5 :   e   =   " W r o n g   j u m p " ;   b r e a k ;  
 	 	 c a s e   4 0 1 6 :   e   =   " N o t   i n i t i a l i z e d   a r r a y " ;   b r e a k ;  
 	 	 c a s e   4 0 1 7 :   e   =   " d l l   c a l l s   a r e   n o t   a l l o w e d " ;   b r e a k ;  
 	 	 c a s e   4 0 1 8 :   e   =   " C a n n o t   l o a d   l i b r a r y " ;   b r e a k ;  
 	 	 c a s e   4 0 1 9 :   e   =   " C a n n o t   c a l l   f u n c t i o n " ;   b r e a k ;  
 	 	 c a s e   4 0 2 0 :   e   =   " E x p e r t   f u n c t i o n   c a l l s   a r e   n o t   a l l o w e d " ;   b r e a k ;  
 	 	 c a s e   4 0 2 1 :   e   =   " N o t   e n o u g h   m e m o r y   f o r   t e m p   s t r i n g   r e t u r n e d   f r o m   f u n c t i o n " ;   b r e a k ;  
 	 	 c a s e   4 0 2 2 :   e   =   " S y s t e m   i s   b u s y " ;   b r e a k ;  
 	 	 c a s e   4 0 5 0 :   e   =   " I n v a l i d   f u n c t i o n   p a r a m e t e r s   c o u n t " ;   b r e a k ;  
 	 	 c a s e   4 0 5 1 :   e   =   " I n v a l i d   f u n c t i o n   p a r a m e t e r   v a l u e " ;   b r e a k ;  
 	 	 c a s e   4 0 5 2 :   e   =   " S t r i n g   f u n c t i o n   i n t e r n a l   e r r o r " ;   b r e a k ;  
 	 	 c a s e   4 0 5 3 :   e   =   " S o m e   a r r a y   e r r o r " ;   b r e a k ;  
 	 	 c a s e   4 0 5 4 :   e   =   " I n c o r r e c t   s e r i e s   a r r a y   u s i n g " ;   b r e a k ;  
 	 	 c a s e   4 0 5 5 :   e   =   " C u s t o m   i n d i c a t o r   e r r o r " ;   b r e a k ;  
 	 	 c a s e   4 0 5 6 :   e   =   " A r r a y s   a r e   i n c o m p a t i b l e " ;   b r e a k ;  
 	 	 c a s e   4 0 5 7 :   e   =   " G l o b a l   v a r i a b l e s   p r o c e s s i n g   e r r o r " ;   b r e a k ;  
 	 	 c a s e   4 0 5 8 :   e   =   " G l o b a l   v a r i a b l e   n o t   f o u n d " ;   b r e a k ;  
 	 	 c a s e   4 0 5 9 :   e   =   " F u n c t i o n   i s   n o t   a l l o w e d   i n   t e s t i n g   m o d e " ;   b r e a k ;  
 	 	 c a s e   4 0 6 0 :   e   =   " F u n c t i o n   i s   n o t   c o n f i r m e d " ;   b r e a k ;  
 	 	 c a s e   4 0 6 1 :   e   =   " S e n d   m a i l   e r r o r " ;   b r e a k ;  
 	 	 c a s e   4 0 6 2 :   e   =   " S t r i n g   p a r a m e t e r   e x p e c t e d " ;   b r e a k ;  
 	 	 c a s e   4 0 6 3 :   e   =   " I n t e g e r   p a r a m e t e r   e x p e c t e d " ;   b r e a k ;  
 	 	 c a s e   4 0 6 4 :   e   =   " D o u b l e   p a r a m e t e r   e x p e c t e d " ;   b r e a k ;  
 	 	 c a s e   4 0 6 5 :   e   =   " A r r a y   a s   p a r a m e t e r   e x p e c t e d " ;   b r e a k ;  
 	 	 c a s e   4 0 6 6 :   e   =   " R e q u e s t e d   h i s t o r y   d a t a   i n   u p d a t e   s t a t e " ;   b r e a k ;  
 	 	 c a s e   4 0 9 9 :   e   =   " E n d   o f   f i l e " ;   b r e a k ;  
 	 	 c a s e   4 1 0 0 :   e   =   " S o m e   f i l e   e r r o r " ;   b r e a k ;  
 	 	 c a s e   4 1 0 1 :   e   =   " W r o n g   f i l e   n a m e " ;   b r e a k ;  
 	 	 c a s e   4 1 0 2 :   e   =   " T o o   m a n y   o p e n e d   f i l e s " ;   b r e a k ;  
 	 	 c a s e   4 1 0 3 :   e   =   " C a n n o t   o p e n   f i l e " ;   b r e a k ;  
 	 	 c a s e   4 1 0 4 :   e   =   " I n c o m p a t i b l e   a c c e s s   t o   a   f i l e " ;   b r e a k ;  
 	 	 c a s e   4 1 0 5 :   e   =   " N o   o r d e r   s e l e c t e d " ;   b r e a k ;  
 	 	 c a s e   4 1 0 6 :   e   =   " U n k n o w n   s y m b o l " ;   b r e a k ;  
 	 	 c a s e   4 1 0 7 :   e   =   " I n v a l i d   p r i c e   p a r a m e t e r   f o r   t r a d e   f u n c t i o n " ;   b r e a k ;  
 	 	 c a s e   4 1 0 8 :   e   =   " I n v a l i d   t i c k e t " ;   b r e a k ;  
 	 	 c a s e   4 1 0 9 :   e   =   " T r a d e   i s   n o t   a l l o w e d   i n   t h e   e x p e r t   p r o p e r t i e s " ;   b r e a k ;  
 	 	 c a s e   4 1 1 0 :   e   =   " L o n g s   a r e   n o t   a l l o w e d   i n   t h e   e x p e r t   p r o p e r t i e s " ;   b r e a k ;  
 	 	 c a s e   4 1 1 1 :   e   =   " S h o r t s   a r e   n o t   a l l o w e d   i n   t h e   e x p e r t   p r o p e r t i e s " ;   b r e a k ;  
 	 	  
 	 	 / / - -   o b j e c t s   e r r o r s  
 	 	 c a s e   4 2 0 0 :   e   =   " O b j e c t   i s   a l r e a d y   e x i s t " ;   b r e a k ;  
 	 	 c a s e   4 2 0 1 :   e   =   " U n k n o w n   o b j e c t   p r o p e r t y " ;   b r e a k ;  
 	 	 c a s e   4 2 0 2 :   e   =   " O b j e c t   i s   n o t   e x i s t " ;   b r e a k ;  
 	 	 c a s e   4 2 0 3 :   e   =   " U n k n o w n   o b j e c t   t y p e " ;   b r e a k ;  
 	 	 c a s e   4 2 0 4 :   e   =   " N o   o b j e c t   n a m e " ;   b r e a k ;  
 	 	 c a s e   4 2 0 5 :   e   =   " O b j e c t   c o o r d i n a t e s   e r r o r " ;   b r e a k ;  
 	 	 c a s e   4 2 0 6 :   e   =   " N o   s p e c i f i e d   s u b w i n d o w " ;   b r e a k ;  
 	 	 c a s e   4 2 0 7 :   e   =   " G r a p h i c a l   o b j e c t   e r r o r " ;   b r e a k ;      
 	 	 c a s e   4 2 1 0 :   e   =   " U n k n o w n   c h a r t   p r o p e r t y " ;   b r e a k ;  
 	 	 c a s e   4 2 1 1 :   e   =   " C h a r t   n o t   f o u n d " ;   b r e a k ;  
 	 	 c a s e   4 2 1 2 :   e   =   " C h a r t   s u b w i n d o w   n o t   f o u n d " ;   b r e a k ;  
 	 	 c a s e   4 2 1 3 :   e   =   " C h a r t   i n d i c a t o r   n o t   f o u n d " ;   b r e a k ;  
 	 	 c a s e   4 2 2 0 :   e   =   " S y m b o l   s e l e c t   e r r o r " ;   b r e a k ;  
 	 	 c a s e   4 2 5 0 :   e   =   " N o t i f i c a t i o n   e r r o r " ;   b r e a k ;  
 	 	 c a s e   4 2 5 1 :   e   =   " N o t i f i c a t i o n   p a r a m e t e r   e r r o r " ;   b r e a k ;  
 	 	 c a s e   4 2 5 2 :   e   =   " N o t i f i c a t i o n s   d i s a b l e d " ;   b r e a k ;  
 	 	 c a s e   4 2 5 3 :   e   =   " N o t i f i c a t i o n   s e n d   t o o   f r e q u e n t " ;   b r e a k ;  
 	 	  
 	 	 / / - -   f t p   e r r o r s  
 	 	 c a s e   4 2 6 0 :   e   =   " F T P   s e r v e r   i s   n o t   s p e c i f i e d " ;   b r e a k ;  
 	 	 c a s e   4 2 6 1 :   e   =   " F T P   l o g i n   i s   n o t   s p e c i f i e d " ;   b r e a k ;  
 	 	 c a s e   4 2 6 2 :   e   =   " F T P   c o n n e c t i o n   f a i l e d " ;   b r e a k ;  
 	 	 c a s e   4 2 6 3 :   e   =   " F T P   c o n n e c t i o n   c l o s e d " ;   b r e a k ;  
 	 	 c a s e   4 2 6 4 :   e   =   " F T P   p a t h   n o t   f o u n d   o n   s e r v e r " ;   b r e a k ;  
 	 	 c a s e   4 2 6 5 :   e   =   " F i l e   n o t   f o u n d   i n   t h e   M Q L 4 \ \ F i l e s   d i r e c t o r y   t o   s e n d   o n   F T P   s e r v e r " ;   b r e a k ;  
 	 	 c a s e   4 2 6 6 :   e   =   " C o m m o n   e r r o r   d u r i n g   F T P   d a t a   t r a n s m i s s i o n " ;   b r e a k ;  
 	 	  
 	 	 / / - -   f i l e s y s t e m   e r r o r s  
 	 	 c a s e   5 0 0 1 :   e   =   " T o o   m a n y   o p e n e d   f i l e s " ;   b r e a k ;  
 	 	 c a s e   5 0 0 2 :   e   =   " W r o n g   f i l e   n a m e " ;   b r e a k ;  
 	 	 c a s e   5 0 0 3 :   e   =   " T o o   l o n g   f i l e   n a m e " ;   b r e a k ;  
 	 	 c a s e   5 0 0 4 :   e   =   " C a n n o t   o p e n   f i l e " ;   b r e a k ;  
 	 	 c a s e   5 0 0 5 :   e   =   " T e x t   f i l e   b u f f e r   a l l o c a t i o n   e r r o r " ;   b r e a k ;  
 	 	 c a s e   5 0 0 6 :   e   =   " C a n n o t   d e l e t e   f i l e " ;   b r e a k ;  
 	 	 c a s e   5 0 0 7 :   e   =   " I n v a l i d   f i l e   h a n d l e   ( f i l e   c l o s e d   o r   w a s   n o t   o p e n e d ) " ;   b r e a k ;  
 	 	 c a s e   5 0 0 8 :   e   =   " W r o n g   f i l e   h a n d l e   ( h a n d l e   i n d e x   i s   o u t   o f   h a n d l e   t a b l e ) " ;   b r e a k ;  
 	 	 c a s e   5 0 0 9 :   e   =   " F i l e   m u s t   b e   o p e n e d   w i t h   F I L E _ W R I T E   f l a g " ;   b r e a k ;  
 	 	 c a s e   5 0 1 0 :   e   =   " F i l e   m u s t   b e   o p e n e d   w i t h   F I L E _ R E A D   f l a g " ;   b r e a k ;  
 	 	 c a s e   5 0 1 1 :   e   =   " F i l e   m u s t   b e   o p e n e d   w i t h   F I L E _ B I N   f l a g " ;   b r e a k ;  
 	 	 c a s e   5 0 1 2 :   e   =   " F i l e   m u s t   b e   o p e n e d   w i t h   F I L E _ T X T   f l a g " ;   b r e a k ;  
 	 	 c a s e   5 0 1 3 :   e   =   " F i l e   m u s t   b e   o p e n e d   w i t h   F I L E _ T X T   o r   F I L E _ C S V   f l a g " ;   b r e a k ;  
 	 	 c a s e   5 0 1 4 :   e   =   " F i l e   m u s t   b e   o p e n e d   w i t h   F I L E _ C S V   f l a g " ;   b r e a k ;  
 	 	 c a s e   5 0 1 5 :   e   =   " F i l e   r e a d   e r r o r " ;   b r e a k ;  
 	 	 c a s e   5 0 1 6 :   e   =   " F i l e   w r i t e   e r r o r " ;   b r e a k ;  
 	 	 c a s e   5 0 1 7 :   e   =   " S t r i n g   s i z e   m u s t   b e   s p e c i f i e d   f o r   b i n a r y   f i l e " ;   b r e a k ;  
 	 	 c a s e   5 0 1 8 :   e   =   " I n c o m p a t i b l e   f i l e   ( f o r   s t r i n g   a r r a y s - T X T ,   f o r   o t h e r s - B I N ) " ;   b r e a k ;  
 	 	 c a s e   5 0 1 9 :   e   =   " F i l e   i s   d i r e c t o r y ,   n o t   f i l e " ;   b r e a k ;  
 	 	 c a s e   5 0 2 0 :   e   =   " F i l e   d o e s   n o t   e x i s t " ;   b r e a k ;  
 	 	 c a s e   5 0 2 1 :   e   =   " F i l e   c a n n o t   b e   r e w r i t t e n " ;   b r e a k ;  
 	 	 c a s e   5 0 2 2 :   e   =   " W r o n g   d i r e c t o r y   n a m e " ;   b r e a k ;  
 	 	 c a s e   5 0 2 3 :   e   =   " D i r e c t o r y   d o e s   n o t   e x i s t " ;   b r e a k ;  
 	 	 c a s e   5 0 2 4 :   e   =   " S p e c i f i e d   f i l e   i s   n o t   d i r e c t o r y " ;   b r e a k ;  
 	 	 c a s e   5 0 2 5 :   e   =   " C a n n o t   d e l e t e   d i r e c t o r y " ;   b r e a k ;  
 	 	 c a s e   5 0 2 6 :   e   =   " C a n n o t   c l e a n   d i r e c t o r y " ;   b r e a k ;  
 	 	  
 	 	 / / - -   o t h e r   e r r o r s  
 	 	 c a s e   5 0 2 7 :   e   =   " A r r a y   r e s i z e   e r r o r " ;   b r e a k ;  
 	 	 c a s e   5 0 2 8 :   e   =   " S t r i n g   r e s i z e   e r r o r " ;   b r e a k ;  
 	 	 c a s e   5 0 2 9 :   e   =   " S t r u c t u r e   c o n t a i n s   s t r i n g s   o r   d y n a m i c   a r r a y s " ;   b r e a k ;  
 	 	  
 	 	 / / - -   h t t p   r e q u e s t  
 	 	 c a s e   5 2 0 0 :   e   =   " I n v a l i d   U R L " ;   b r e a k ;  
 	 	 c a s e   5 2 0 1 :   e   =   " F a i l e d   t o   c o n n e c t   t o   s p e c i f i e d   U R L " ;   b r e a k ;  
 	 	 c a s e   5 2 0 2 :   e   =   " T i m e o u t   e x c e e d e d " ;   b r e a k ;  
 	 	 c a s e   5 2 0 3 :   e   =   " H T T P   r e q u e s t   f a i l e d " ;   b r e a k ;  
  
 	 	 d e f a u l t : 	 e   =   " U n k n o w n   e r r o r " ;  
 	 }  
  
 	 e   =   S t r i n g C o n c a t e n a t e ( e ,   "   ( " ,   e r r o r _ c o d e ,   " ) " ) ;  
 	  
 	 r e t u r n   e ;  
 }  
  
 v o i d   E x p i r a t i o n D r i v e r ( )  
 {  
 	 s t a t i c   i n t   l a s t _ c h e c k e d _ t i c k e t ;  
 	 s t a t i c   i n t   d b _ t i c k e t s [ ] ;  
 	 s t a t i c   d a t e t i m e   d b _ e x p i r a t i o n s [ ] ;  
  
 	 i n t   t o t a l         =   O r d e r s T o t a l ( ) ;  
 	 i n t   s i z e           =   0 ;  
 	 i n t   d o _ r e s e t   =   f a l s e ;  
 	 s t r i n g   p r i n t ;  
 	 i n t   i ;  
  
 	 / / - -   c h e c k   e x p i r a t i o n s   a n d   c l o s e   t r a d e s  
 	 s i z e   =   A r r a y S i z e ( d b _ t i c k e t s ) ;  
  
 	 i f   ( s i z e   >   0 )  
 	 {  
 	 	 i f   ( t o t a l = = 0 )  
 	 	 {  
 	 	 	 A r r a y R e s i z e ( d b _ t i c k e t s ,   0 ) ;  
 	 	 	 A r r a y R e s i z e ( d b _ e x p i r a t i o n s ,   0 ) ;  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 f o r   ( i   =   0 ;   i   <   s i z e ;   i + + )  
 	 	 	 {  
 	 	 	 	 W a i t T r a d e C o n t e x t I f B u s y ( ) ;  
  
 	 	 	 	 i f   ( ! O r d e r S e l e c t ( d b _ t i c k e t s [ i ] ,   S E L E C T _ B Y _ T I C K E T ,   M O D E _ T R A D E S ) )   { c o n t i n u e ; }  
 	 	 	 	 i f   ( O r d e r S y m b o l ( )   ! =   S y m b o l ( ) )   { c o n t i n u e ; }  
 	 	 	 	  
 	 	 	 	 i f   ( T i m e C u r r e n t ( )   > =   d b _ e x p i r a t i o n s [ i ] )  
 	 	 	 	 {  
 	 	 	 	 	 / / - -   t r y i n g   t o   s k i p   c o n f l i c t s   w i t h   t h e   s a m e   f u n c t i o n a l i t y   r u n n i n g   f r o m   n e i g h b o u r   E A  
 	 	 	 	 	 W a i t T r a d e C o n t e x t I f B u s y ( ) ;  
  
 	 	 	 	 	 i f   ( ! O r d e r S e l e c t ( d b _ t i c k e t s [ i ] , S E L E C T _ B Y _ T I C K E T ,   M O D E _ T R A D E S ) )   { c o n t i n u e ; }  
 	 	 	 	 	 i f   ( O r d e r C l o s e T i m e ( )   >   0 )   { c o n t i n u e ; }  
  
 	 	 	 	 	 / / - -   c l o s i n g   t h e   t r a d e  
 	 	 	 	 	 i f   ( C l o s e T r a d e ( O r d e r T i c k e t ( ) ) )    
 	 	 	 	 	 {  
 	 	 	 	 	 	 p r i n t   =   " # "   +   ( s t r i n g ) O r d e r T i c k e t ( )   +   "   w a s   c l o s e d   d u e   t o   e x p i r a t i o n " ;  
 	 	 	 	 	 	 P r i n t ( p r i n t ) ;  
 	 	 	 	 	 	 l a s t _ c h e c k e d _ t i c k e t   =   0 ;  
 	 	 	 	 	 	 d o _ r e s e t   =   t r u e ;  
 	 	 	 	 	 	 t o t a l         =   O r d e r s T o t a l ( ) ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 / / - -   c h e c k   t h e   t i c k e t   o f   t h e   n e w e s t   t r a d e  
 	 i f   ( d o _ r e s e t   = =   f a l s e   & &   t o t a l   >   0 )  
 	 {  
 	 	 i f   ( O r d e r S e l e c t ( t o t a l - 1 ,   S E L E C T _ B Y _ P O S ) )  
 	 	 {  
 	 	 	 i f   ( O r d e r T i c k e t ( )   ! =   l a s t _ c h e c k e d _ t i c k e t )  
 	 	 	 {  
 	 	 	 	 d o _ r e s e t   =   t r u e ;  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 / / - -   r e b u i l d   t h e   d a t a b a s e   o f   t r a d e s   w i t h   e x p i r a t i o n s  
 	 i f   ( d o _ r e s e t   = =   t r u e )  
 	 {  
 	 	 A r r a y R e s i z e ( d b _ t i c k e t s ,   0 ) ;  
 	 	 A r r a y R e s i z e ( d b _ e x p i r a t i o n s ,   0 ) ;  
  
 	 	 f o r   ( i n t   p o s   =   0 ;   p o s   <   t o t a l ;   p o s + + )  
 	 	 {  
 	 	 	 i f   ( ! O r d e r S e l e c t ( p o s ,   S E L E C T _ B Y _ P O S ) )   { c o n t i n u e ; }  
 	 	 	 l a s t _ c h e c k e d _ t i c k e t   =   O r d e r T i c k e t ( ) ;  
  
 	 	 	 s t r i n g   c o m m e n t   =   O r d e r C o m m e n t ( ) ;  
 	 	 	 i n t   e x p _ p o s _ b e g i n   =   S t r i n g F i n d ( c o m m e n t ,   " [ e x p : " ) ;  
  
 	 	 	 i f   ( e x p _ p o s _ b e g i n   > =   0 )  
 	 	 	 {  
 	 	 	 	 e x p _ p o s _ b e g i n   =   e x p _ p o s _ b e g i n   +   5 ;  
 	 	 	 	 i n t   e x p _ p o s _ e n d   =   S t r i n g F i n d ( c o m m e n t ,   " ] " ,   e x p _ p o s _ b e g i n ) ;  
 	 	 	 	 i f   ( e x p _ p o s _ e n d   = =   - 1 )   { c o n t i n u e ; }  
 	 	 	 	  
 	 	 	 	 s i z e   =   A r r a y S i z e ( d b _ t i c k e t s ) ;  
 	 	 	 	 A r r a y R e s i z e ( d b _ t i c k e t s ,   s i z e + 1 ) ;  
 	 	 	 	 A r r a y R e s i z e ( d b _ e x p i r a t i o n s ,   s i z e + 1 ) ;  
  
 	 	 	 	 d b _ t i c k e t s [ s i z e ]           =   O r d e r T i c k e t ( ) ;  
 	 	 	 	 d b _ e x p i r a t i o n s [ s i z e ]   =   ( d a t e t i m e ) ( ( i n t ) O r d e r O p e n T i m e ( )   +   ( i n t ) S t r i n g T o I n t e g e r ( S t r i n g S u b s t r ( c o m m e n t ,   e x p _ p o s _ b e g i n ,   e x p _ p o s _ e n d ) ) ) ;  
 	 	 	 }  
 	 	 }  
 	 }  
 }  
  
 d a t e t i m e   E x p i r a t i o n T i m e ( s t r i n g   m o d e = " G T C " , i n t   d a y s = 0 ,   i n t   h o u r s = 0 ,   i n t   m i n u t e s = 0 ,   d a t e t i m e   c u s t o m = 0 )  
 {  
 	 d a t e t i m e   n o w                 =   T i m e C u r r e n t ( ) ;  
       d a t e t i m e   e x p i r a t i o n   =   n o w ;  
  
 	           i f   ( m o d e   = =   " G T C "   | |   m o d e   = =   " " )   { e x p i r a t i o n   =   0 ; }  
 	 e l s e   i f   ( m o d e   = =   " t o d a y " )                           { e x p i r a t i o n   =   ( d a t e t i m e ) ( M a t h F l o o r ( ( n o w   +   8 6 4 0 0 . 0 )   /   8 6 4 0 0 . 0 )   *   8 6 4 0 0 . 0 ) ; }  
 	 e l s e   i f   ( m o d e   = =   " s p e c i f i e d " )  
 	 {  
 	 	 e x p i r a t i o n   =   0 ;  
  
 	 	 i f   ( ( d a y s   +   h o u r s   +   m i n u t e s )   >   0 )  
 	 	 {  
 	 	 	 e x p i r a t i o n   =   n o w   +   ( 8 6 4 0 0   *   d a y s )   +   ( 3 6 0 0   *   h o u r s )   +   ( 6 0   *   m i n u t e s ) ;  
 	 	 }  
 	 }  
 	 e l s e  
 	 {  
 	 	 i f   ( c u s t o m   < =   n o w )  
 	 	 {  
 	 	 	 i f   ( c u s t o m   <   3 1 5 5 7 6 0 0 )  
 	 	 	 {  
 	 	 	 	 c u s t o m   =   n o w   +   c u s t o m ;  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 c u s t o m   =   0 ;  
 	 	 	 }  
 	 	 }  
  
 	 	 e x p i r a t i o n   =   c u s t o m ;  
 	 }  
  
 	 r e t u r n   e x p i r a t i o n ;  
 }  
  
 b o o l   F i l t e r O r d e r B y (  
 	 s t r i n g   g r o u p _ m o d e         =   " a l l " ,  
 	 s t r i n g   g r o u p                   =   " 0 " ,  
 	 s t r i n g   m a r k e t _ m o d e       =   " a l l " ,  
 	 s t r i n g   m a r k e t                 =   " " ,  
 	 s t r i n g   B u y s O r S e l l s       =   " b o t h " ,  
 	 s t r i n g   L i m i t s O r S t o p s   =   " b o t h " ,  
 	 i n t   T r a d e s O r d e r s           =   0 ,  
 	 b o o l   o n T r a d e                   =   f a l s e  
 )   {  
 	 / /   T r a d e s O r d e r s   =   0   -   t r a d e s   o n l y  
 	 / /   T r a d e s O r d e r s   =   1   -   o r d e r s   o n l y  
 	 / /   T r a d e s O r d e r s   =   2   -   t r a d e s   a n d   o r d e r s  
  
 	 / / - -   d b  
 	 s t a t i c   s t r i n g   m a r k e t s [ ] ;  
 	 s t a t i c   s t r i n g   m a r k e t 0       =   " - " ;  
 	 s t a t i c   i n t   m a r k e t s _ s i z e   =   0 ;  
 	  
 	 s t a t i c   s t r i n g   g r o u p s [ ] ;  
 	 s t a t i c   s t r i n g   g r o u p 0       =   " - " ;  
 	 s t a t i c   i n t   g r o u p s _ s i z e   =   0 ;  
 	  
 	 / / - -   l o c a l   v a r i a b l e s  
 	 b o o l   t y p e _ p a s s       =   f a l s e ;  
 	 b o o l   m a r k e t _ p a s s   =   f a l s e ;  
 	 b o o l   g r o u p _ p a s s     =   f a l s e ;  
 	  
 	 i n t   i ,   t y p e ,   m a g i c _ n u m b e r ;  
 	 s t r i n g   s y m b o l ;  
  
 	 / /   T r a d e s  
 	 i f   ( o n T r a d e   = =   f a l s e )  
 	 {  
 	 	 t y p e                   =   O r d e r T y p e ( ) ;  
 	 	 m a g i c _ n u m b e r   =   O r d e r M a g i c N u m b e r ( ) ;  
 	 	 s y m b o l               =   O r d e r S y m b o l ( ) ;  
 	 }  
 	 e l s e  
 	 {  
 	 	 t y p e                   =   e _ a t t r T y p e ( ) ;  
 	 	 m a g i c _ n u m b e r   =   e _ a t t r M a g i c N u m b e r ( ) ;  
 	 	 s y m b o l               =   e _ a t t r S y m b o l ( ) ;  
 	 }  
  
 	 i f   ( T r a d e s O r d e r s   = =   0 )  
 	 {  
 	 	 i f   (  
 	 	 	 	 ( B u y s O r S e l l s   = =   " b o t h "     & &   ( t y p e   = =   O P _ B U Y   | |   t y p e   = =   O P _ S E L L ) )  
 	 	 	 | |   ( B u y s O r S e l l s   = =   " b u y s "     & &   t y p e   = =   O P _ B U Y )  
 	 	 	 | |   ( B u y s O r S e l l s   = =   " s e l l s "   & &   t y p e   = =   O P _ S E L L )  
 	 	 	  
 	 	 	 )  
 	 	 {  
 	 	 	 t y p e _ p a s s   =   t r u e ;  
 	 	 }  
 	 }  
 	 / /   P e n d i n g   o r d e r s  
 	 e l s e   i f   ( T r a d e s O r d e r s   = =   1 )  
 	 {  
 	 	 i f   (  
 	 	 	 	 ( B u y s O r S e l l s   = =   " b o t h "   & &   ( t y p e   = =   O P _ B U Y L I M I T   | |   t y p e   = =   O P _ B U Y S T O P   | |   t y p e   = =   O P _ S E L L L I M I T   | |   t y p e   = =   O P _ S E L L S T O P ) )  
 	 	 	 | | 	 ( B u y s O r S e l l s   = =   " b u y s "   & &   ( t y p e   = =   O P _ B U Y L I M I T   | |   t y p e   = =   O P _ B U Y S T O P ) )  
 	 	 	 | |   ( B u y s O r S e l l s   = =   " s e l l s "   & &   ( t y p e   = =   O P _ S E L L L I M I T   | |   t y p e   = =   O P _ S E L L S T O P ) )  
 	 	 	 )  
 	 	 {  
 	 	 	 i f   (  
 	 	 	 	 	 ( L i m i t s O r S t o p s   = =   " b o t h "   & &   ( t y p e   = =   O P _ B U Y S T O P   | |   t y p e   = =   O P _ S E L L S T O P   | |   t y p e   = =   O P _ B U Y L I M I T   | |   t y p e   = =   O P _ S E L L L I M I T ) )  
 	 	 	 	 | | 	 ( L i m i t s O r S t o p s   = =   " s t o p s "   & &   ( t y p e   = =   O P _ B U Y S T O P   | |   t y p e   = =   O P _ S E L L S T O P ) )  
 	 	 	 	 | |   ( L i m i t s O r S t o p s   = =   " l i m i t s "   & &   ( t y p e   = =   O P _ B U Y L I M I T   | |   t y p e   = =   O P _ S E L L L I M I T ) ) 	 	 	 	 	  
 	 	 	 	 )  
 	 	 	 {  
 	 	 	 	 t y p e _ p a s s   =   t r u e ;  
 	 	 	 }  
 	 	 }  
 	 }  
 	 / / - -   T r a d e s   a n d   o r d e r s   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 e l s e  
 	 {  
 	 	 i f   (  
 	 	 	 	 ( B u y s O r S e l l s   = =   " b o t h " )  
 	 	 	 | |   ( B u y s O r S e l l s   = =   " b u y s "     & &   ( t y p e   = =   O P _ B U Y   | |   t y p e   = =   O P _ B U Y L I M I T   | |   t y p e   = =   O P _ B U Y S T O P ) )  
 	 	 	 | |   ( B u y s O r S e l l s   = =   " s e l l s "   & &   ( t y p e   = =   O P _ S E L L   | |   t y p e   = =   O P _ S E L L L I M I T   | |   t y p e   = =   O P _ S E L L S T O P ) )  
 	 	 	 )  
 	 	 {  
 	 	 	 t y p e _ p a s s   =   t r u e ;  
 	 	 }  
 	 }  
  
 	 i f   ( t y p e _ p a s s   = =   f a l s e )  
 	 {  
 	 	 r e t u r n   f a l s e ;  
 	 }  
  
 	 / / - -   c h e c k   g r o u p  
 	 i f   ( g r o u p _ m o d e   = =   " g r o u p " )  
 	 {  
 	 	 i f   ( g r o u p   = =   " " )  
 	 	 {  
 	 	 	 i f   ( m a g i c _ n u m b e r   = =   M a g i c S t a r t )  
       	 	 {  
       	 	 	 g r o u p _ p a s s   =   t r u e ;  
       	 	 }  
 	       }  
 	       e l s e  
 	       {  
 	 	 	 i f   ( g r o u p 0   ! =   g r o u p )  
 	 	 	 {  
 	 	 	 	 g r o u p 0   =   g r o u p ;  
 	 	 	 	 S t r i n g E x p l o d e ( " , " ,   g r o u p , g r o u p s ) ;  
 	 	 	 	 g r o u p s _ s i z e   =   A r r a y S i z e ( g r o u p s ) ;  
  
 	 	 	 	 f o r ( i   =   0 ;   i   <   g r o u p s _ s i z e ;   i + + )  
 	 	 	 	 {  
 	 	 	 	 	 g r o u p s [ i ]   =   S t r i n g T r i m R i g h t ( g r o u p s [ i ] ) ;  
 	 	 	 	 	 g r o u p s [ i ]   =   S t r i n g T r i m L e f t ( g r o u p s [ i ] ) ;  
  
 	 	 	 	 	 i f   ( g r o u p s [ i ]   = =   " " )   { g r o u p s [ i ]   =   " 0 " ; }  
 	 	 	 	 }  
 	 	 	 }  
 	 	  
 	 	 	 f o r ( i   =   0 ;   i   <   g r o u p s _ s i z e ;   i + + )  
 	 	 	 {  
 	 	 	 	 i f   ( m a g i c _ n u m b e r   = =   ( M a g i c S t a r t + ( i n t ) g r o u p s [ i ] ) )  
 	 	 	 	 {  
 	 	 	 	 	 g r o u p _ p a s s   =   t r u e ;  
  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 }  
 	 e l s e   i f   ( g r o u p _ m o d e   = =   " a l l "   | |   ( g r o u p _ m o d e   = =   " m a n u a l "   & &   m a g i c _ n u m b e r   = =   0 ) )  
 	 {  
 	 	 g r o u p _ p a s s   =   t r u e ;      
 	 }  
  
 	 i f   ( g r o u p _ p a s s   = =   f a l s e )  
 	 {  
 	 	 r e t u r n   f a l s e ;  
 	 }  
  
 	 / /   c h e c k   m a r k e t  
 	 i f   ( m a r k e t _ m o d e   = =   " a l l " )  
 	 {  
 	 	 m a r k e t _ p a s s   =   t r u e ;  
 	 }  
 	 e l s e  
 	 {  
 	 	 i f   ( s y m b o l   = =   m a r k e t )  
 	       {  
 	             m a r k e t _ p a s s   =   t r u e ;  
 	       }  
             e l s e  
             {  
 	 	 	 i f   ( m a r k e t 0   ! =   m a r k e t )  
 	 	 	 {  
 	 	 	 	 m a r k e t 0   =   m a r k e t ;  
  
 	 	 	 	 i f   ( m a r k e t   = =   " " )  
 	 	 	 	 {  
 	 	 	 	 	 m a r k e t s _ s i z e   =   1 ;  
 	 	 	 	 	 A r r a y R e s i z e ( m a r k e t s ,   1 ) ;  
 	 	 	 	 	 m a r k e t s [ 0 ]   =   S y m b o l ( ) ;  
 	 	 	 	 }  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 S t r i n g E x p l o d e ( " , " ,   m a r k e t ,   m a r k e t s ) ;  
 	 	 	 	 	 m a r k e t s _ s i z e   =   A r r a y S i z e ( m a r k e t s ) ;  
  
 	 	 	 	 	 f o r ( i   =   0 ;   i   <   m a r k e t s _ s i z e ;   i + + )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 m a r k e t s [ i ]   =   S t r i n g T r i m R i g h t ( m a r k e t s [ i ] ) ;  
 	 	 	 	 	 	 m a r k e t s [ i ]   =   S t r i n g T r i m L e f t ( m a r k e t s [ i ] ) ;  
  
 	 	 	 	 	 	 i f   ( m a r k e t s [ i ]   = =   " " )   { m a r k e t s [ i ]   =   S y m b o l ( ) ; }  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 f o r ( i   =   0 ;   i   <   m a r k e t s _ s i z e ;   i + + )  
 	 	 	 {  
 	 	 	 	 i f   ( s y m b o l   = =   m a r k e t s [ i ] )  
 	 	 	 	 {  
 	 	 	 	 	 m a r k e t _ p a s s   =   t r u e ;  
  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 i f   ( m a r k e t _ p a s s   = =   f a l s e )  
 	 {  
 	 	 r e t u r n   f a l s e ;  
 	 }  
  
 	 r e t u r n   t r u e ;  
 }  
  
 b o o l   H i s t o r y T r a d e S e l e c t B y I n d e x (  
 	 i n t   i n d e x ,  
 	 s t r i n g   g r o u p _ m o d e         =   " a l l " ,  
 	 s t r i n g   g r o u p                   =   " 0 " ,  
 	 s t r i n g   m a r k e t _ m o d e       =   " a l l " ,  
 	 s t r i n g   m a r k e t                 =   " " ,  
 	 s t r i n g   B u y s O r S e l l s       =   " b o t h "  
 )   {  
 	 i f   ( O r d e r S e l e c t ( ( i n t ) i n d e x ,   S E L E C T _ B Y _ P O S ,   M O D E _ H I S T O R Y )   & &   O r d e r T y p e ( )   <   2 )  
 	 {  
 	 	 i f   ( F i l t e r O r d e r B y (  
 	 	 	 g r o u p _ m o d e ,  
 	 	 	 g r o u p ,  
 	 	 	 m a r k e t _ m o d e ,  
 	 	 	 m a r k e t ,  
 	 	 	 B u y s O r S e l l s )  
 	 	 )   {  
 	 	 	 r e t u r n   t r u e ;  
 	 	 }  
 	 }  
  
 	 r e t u r n   f a l s e ;  
 }  
  
 i n t   H i s t o r y T r a d e s T o t a l ( d a t e t i m e   f r o m _ d a t e = 0 ,   d a t e t i m e   t o _ d a t e = 0 )  
 {  
 	 / /   b o t h   i n p u t   p a r a m e t e r s   a r e   d u m m y  
 	 / /   t h e y   e x i s t   o n l y   t o   m a k e   t h e   f u n c t i o n   c o m p a t i b l e   w i t h   M Q L 5 - l i k e   c o d e  
  
 	 r e t u r n   O r d e r s H i s t o r y T o t a l ( ) ;  
 }  
  
 t e m p l a t e < t y p e n a m e   T >  
 b o o l   I n A r r a y ( T   & a r r a y [ ] ,   T   v a l u e )  
 {  
 	 i n t   s i z e   =   A r r a y S i z e ( a r r a y ) ;  
  
 	 i f   ( s i z e   >   0 )  
 	 {  
 	 	 f o r   ( i n t   i   =   0 ;   i   <   s i z e ;   i + + )  
 	 	 {  
 	 	 	 i f   ( a r r a y [ i ]   = =   v a l u e )  
 	 	 	 {  
 	 	 	 	 r e t u r n   t r u e ;  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 r e t u r n   f a l s e ;  
 }  
  
 b o o l   I s O r d e r T y p e S e l l ( )  
 {  
 	 i n t   t y p e   =   O r d e r T y p e ( ) ;  
  
 	 r e t u r n   ( t y p e   = =   O P _ S E L L   | |   t y p e   = =   O P _ S E L L S T O P   | |   t y p e   = =   O P _ S E L L L I M I T ) ;  
 }  
  
 b o o l   M o d i f y O r d e r (  
 	 i n t   t i c k e t ,  
 	 d o u b l e   o p ,  
 	 d o u b l e   s l l   =   0 ,  
 	 d o u b l e   t p l   =   0 ,  
 	 d o u b l e   s l p   =   0 ,  
 	 d o u b l e   t p p   =   0 ,  
 	 d a t e t i m e   e x p   =   0 ,  
 	 c o l o r   c l r   =   c l r N O N E ,  
 	 b o o l   o n t r a d e _ e v e n t   =   t r u e  
 )   {  
 	 i n t   b s   =   1 ;  
  
 	 i f   (  
 	 	       O r d e r T y p e ( )   = =   O P _ S E L L  
 	 	 | |   O r d e r T y p e ( )   = =   O P _ S E L L S T O P  
 	 	 | |   O r d e r T y p e ( )   = =   O P _ S E L L L I M I T  
 	 )  
 	 { b s   =   - 1 ; }   / /   P o s i t i v e   w h e n   B u y ,   n e g a t i v e   w h e n   S e l l  
  
 	 w h i l e   ( t r u e )  
 	 {  
 	 	 u i n t   t i m e 0   =   G e t T i c k C o u n t ( ) ;  
  
 	 	 W a i t T r a d e C o n t e x t I f B u s y ( ) ;  
  
 	 	 i f   ( ! O r d e r S e l e c t ( t i c k e t , S E L E C T _ B Y _ T I C K E T ) )  
 	 	 {  
 	 	 	 r e t u r n   f a l s e ;  
 	 	 }  
  
 	 	 s t r i n g   s y m b o l             =   O r d e r S y m b o l ( ) ;  
 	 	 i n t   t y p e                       =   O r d e r T y p e ( ) ;  
 	 	 d o u b l e   a s k                   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K ) ;  
 	 	 d o u b l e   b i d                   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D ) ;  
 	 	 i n t   d i g i t s                   =   ( i n t ) S y m b o l I n f o I n t e g e r ( s y m b o l ,   S Y M B O L _ D I G I T S ) ;  
 	 	 d o u b l e   p o i n t               =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ P O I N T ) ;  
 	 	 d o u b l e   s t o p l e v e l       =   p o i n t   *   S y m b o l I n f o I n t e g e r ( s y m b o l ,   S Y M B O L _ T R A D E _ S T O P S _ L E V E L ) ;  
 	 	 d o u b l e   f r e e z e l e v e l   =   p o i n t   *   S y m b o l I n f o I n t e g e r ( s y m b o l ,   S Y M B O L _ T R A D E _ F R E E Z E _ L E V E L ) ;  
  
 	 	 i f   ( O r d e r T y p e ( )   <   2 )   { o p   =   O r d e r O p e n P r i c e ( ) ; }   e l s e   { o p   =   N o r m a l i z e D o u b l e ( o p , d i g i t s ) ; }  
  
 	 	 s l l   =   N o r m a l i z e D o u b l e ( s l l ,   d i g i t s ) ;  
 	 	 t p l   =   N o r m a l i z e D o u b l e ( t p l ,   d i g i t s ) ;  
  
 	 	 i f   ( o p   <   0   | |   o p   > =   E M P T Y _ V A L U E   | |   s l l   <   0   | |   s l p   <   0   | |   t p l   <   0   | |   t p p   <   0 )  
 	 	 {  
 	 	 	 b r e a k ;  
 	 	 }  
 	 	  
 	 	 / / - -   O P   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 / /   h t t p s : / / b o o k . m q l 4 . c o m / a p p e n d i x / l i m i t s  
 	 	 i f   ( t y p e   = =   O P _ B U Y L I M I T )  
 	 	 {  
 	 	 	 i f   ( a s k   -   o p   <   s t o p l e v e l )   { o p   =   a s k   -   s t o p l e v e l ; }  
 	 	 	 i f   ( a s k   -   o p   < =   f r e e z e l e v e l )   { o p   =   a s k   -   f r e e z e l e v e l   -   p o i n t ; }  
 	 	 }  
 	 	 e l s e   i f   ( t y p e   = =   O P _ B U Y S T O P )  
 	 	 {  
 	 	 	 i f   ( o p   -   a s k   <   s t o p l e v e l )   { o p   =   a s k   +   s t o p l e v e l ; }  
 	 	 	 i f   ( o p   -   a s k   < =   f r e e z e l e v e l )   { o p   =   a s k   +   f r e e z e l e v e l   +   p o i n t ; }  
 	 	 }  
 	 	 e l s e   i f   ( t y p e   = =   O P _ S E L L L I M I T )  
 	 	 {  
 	 	 	 i f   ( o p   -   b i d   <   s t o p l e v e l )   { o p   =   b i d   +   s t o p l e v e l ; }  
 	 	 	 i f   ( o p   -   b i d   < =   f r e e z e l e v e l )   { o p   =   b i d   +   f r e e z e l e v e l   +   p o i n t ; }  
 	 	 }  
 	 	 e l s e   i f   ( t y p e   = =   O P _ S E L L S T O P )  
 	 	 {  
 	 	 	 i f   ( b i d   -   o p   <   s t o p l e v e l )   { o p   =   b i d   -   s t o p l e v e l ; }  
 	 	 	 i f   ( b i d   -   o p   <   f r e e z e l e v e l )   { o p   =   b i d   -   f r e e z e l e v e l   -   p o i n t ; }  
 	 	 }  
  
 	 	 o p   =   N o r m a l i z e D o u b l e ( o p ,   d i g i t s ) ;  
  
 	 	 / / - -   S L   a n d   T P   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 d o u b l e   s l   =   0 ,   t p   =   0 ,   v s l   =   0 ,   v t p   =   0 ;  
  
 	 	 s l   =   A l i g n S t o p L o s s ( s y m b o l ,   t y p e ,   o p ,   a t t r S t o p L o s s ( ) ,   s l l ,   s l p ) ;  
  
 	 	 i f   ( s l   <   0 )   { b r e a k ; }  
  
 	 	 t p   =   A l i g n T a k e P r o f i t ( s y m b o l ,   t y p e ,   o p ,   a t t r T a k e P r o f i t ( ) ,   t p l ,   t p p ) ;  
  
 	 	 i f   ( t p   <   0 )   { b r e a k ; }  
  
 	 	 i f   ( U S E _ V I R T U A L _ S T O P S )  
 	 	 {  
 	 	 	 / / - -   v i r t u a l   S L   a n d   T P   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 v s l   =   s l ;  
 	 	 	 v t p   =   t p ;  
 	 	 	 s l   =   0 ;  
 	 	 	 t p   =   0 ;  
  
 	 	 	 d o u b l e   a s k b i d   =   a s k ;  
 	 	 	 i f   ( b s   <   0 )   { a s k b i d   =   b i d ; }  
  
 	 	 	 i f   ( v s l   >   0   | |   U S E _ E M E R G E N C Y _ S T O P S   = =   " a l w a y s " )  
 	 	 	 {  
 	 	 	 	 i f   ( E M E R G E N C Y _ S T O P S _ R E L   >   0   | |   E M E R G E N C Y _ S T O P S _ A D D   >   0 )  
 	 	 	 	 {  
 	 	 	 	 	 s l   =   v s l   -   E M E R G E N C Y _ S T O P S _ R E L * M a t h A b s ( a s k b i d - v s l ) * b s ;  
  
 	 	 	 	 	 i f   ( s l   < =   0 )   { s l   =   a s k b i d ; }  
  
 	 	 	 	 	 s l   =   s l   -   t o D i g i t s ( E M E R G E N C Y _ S T O P S _ A D D , s y m b o l ) * b s ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 i f   ( v t p   >   0   | |   U S E _ E M E R G E N C Y _ S T O P S   = =   " a l w a y s " )  
 	 	 	 {  
 	 	 	 	 i f   ( E M E R G E N C Y _ S T O P S _ R E L   >   0   | |   E M E R G E N C Y _ S T O P S _ A D D   >   0 )  
 	 	 	 	 {  
 	 	 	 	 	 t p   =   v t p   +   E M E R G E N C Y _ S T O P S _ R E L * M a t h A b s ( v t p - a s k b i d ) * b s ;  
  
 	 	 	 	 	 i f   ( t p   < =   0 )   { t p   =   a s k b i d ; }  
  
 	 	 	 	 	 t p   =   t p   +   t o D i g i t s ( E M E R G E N C Y _ S T O P S _ A D D , s y m b o l ) * b s ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 v s l   =   N o r m a l i z e D o u b l e ( v s l , d i g i t s ) ;  
 	 	 	 v t p   =   N o r m a l i z e D o u b l e ( v t p , d i g i t s ) ;  
 	 	 }  
  
 	 	 s l   =   N o r m a l i z e D o u b l e ( s l , d i g i t s ) ;  
 	 	 t p   =   N o r m a l i z e D o u b l e ( t p , d i g i t s ) ;  
  
 	 	 / / - -   m o d i f y   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 R e s e t L a s t E r r o r ( ) ;  
 	 	  
 	 	 i f   ( U S E _ V I R T U A L _ S T O P S )  
 	 	 {  
 	 	 	 i f   ( v s l   ! =   a t t r S t o p L o s s ( )   | |   v t p   ! =   a t t r T a k e P r o f i t ( ) )  
 	 	 	 {  
 	 	 	 	 V i r t u a l S t o p s D r i v e r ( " s e t " ,   t i c k e t ,   v s l ,   v t p ,   t o P i p s ( M a t h A b s ( o p - v s l ) ,   s y m b o l ) ,   t o P i p s ( M a t h A b s ( v t p - o p ) ,   s y m b o l ) ) ;  
 	 	 	 }  
 	 	 }  
  
 	 	 b o o l   s u c c e s s   =   f a l s e ;  
  
 	 	 i f   (  
 	 	 	       ( O r d e r T y p e ( )   >   1   & &   o p   ! =   N o r m a l i z e D o u b l e ( O r d e r O p e n P r i c e ( ) , d i g i t s ) )  
 	 	 	 | |   s l   ! =   N o r m a l i z e D o u b l e ( O r d e r S t o p L o s s ( ) , d i g i t s )  
 	 	 	 | |   t p   ! =   N o r m a l i z e D o u b l e ( O r d e r T a k e P r o f i t ( ) , d i g i t s )  
 	 	 	 | |   e x p   ! =   O r d e r E x p i r a t i o n ( )  
 	 	 )   {  
 	 	 	 s u c c e s s   =   O r d e r M o d i f y ( t i c k e t ,   o p ,   s l ,   t p ,   e x p ,   c l r ) ;  
 	 	 }  
  
 	 	 / / - -   e r r o r   c h e c k   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 i n t   e r r a c t i o n   =   C h e c k F o r T r a d i n g E r r o r ( G e t L a s t E r r o r ( ) ,   " M o d i f y   e r r o r " ) ;  
  
 	 	 s w i t c h ( e r r a c t i o n )  
 	 	 {  
 	 	 	 c a s e   0 :   b r e a k ;         / /   n o   e r r o r  
 	 	 	 c a s e   1 :   c o n t i n u e ;   / /   o v e r c o m a b l e   e r r o r  
 	 	 	 c a s e   2 :   b r e a k ;         / /   f a t a l   e r r o r  
 	 	 }  
  
 	 	 / / - -   f i n i s h   w o r k   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 i f   ( s u c c e s s   = =   t r u e )  
 	 	 {  
 	 	 	 i f   ( ! I s T e s t i n g ( )   & &   ! I s V i s u a l M o d e ( ) )  
 	 	 	 {  
 	 	 	 	 P r i n t ( " O p e r a t i o n   d e t a i l s :   S p e e d   "   +   ( s t r i n g ) ( G e t T i c k C o u n t ( ) - t i m e 0 )   +   "   m s " ) ;  
 	 	 	 }  
  
 	 	 	 i f   ( o n t r a d e _ e v e n t   = =   t r u e )  
 	 	 	 {  
 	 	 	 	 O r d e r M o d i f i e d ( t i c k e t ) ;  
 	 	 	 	 R e g i s t e r E v e n t ( " t r a d e " ) ;  
 	 	 	 }  
  
 	 	 	 i f   ( O r d e r S e l e c t ( t i c k e t , S E L E C T _ B Y _ T I C K E T ) )   { }  
  
 	 	 	 r e t u r n   t r u e ;  
 	 	 }  
  
 	 	 b r e a k ;  
 	 }  
  
 	 r e t u r n   f a l s e ;  
 }  
  
 i n t   O C O D r i v e r ( )  
 {  
 	 s t a t i c   i n t   l a s t _ k n o w n _ t i c k e t   =   0 ;  
       s t a t i c   i n t   o r d e r s 1 [ ] ;  
       s t a t i c   i n t   o r d e r s 2 [ ] ;  
       i n t   i ,   s i z e ;  
        
       i n t   t o t a l   =   O r d e r s T o t a l ( ) ;  
        
       f o r   ( i n t   p o s = t o t a l - 1 ;   p o s > = 0 ;   p o s - - )  
       {  
             i f   ( O r d e r S e l e c t ( p o s , S E L E C T _ B Y _ P O S , M O D E _ T R A D E S ) )  
             {  
                   i n t   t i c k e t   =   O r d e r T i c k e t ( ) ;  
                    
                   / / - -   e n d   h e r e   i f   w e   r e a c h   t h e   l a s t   k n o w n   t i c k e t  
                   i f   ( t i c k e t   = =   l a s t _ k n o w n _ t i c k e t )   { b r e a k ; }  
                    
                   / / - -   s e t   t h e   l a s t   k n o w n   t i c k e t ,   o n l y   i f   t h i s   i s   t h e   f i r s t   i t e r a t i o n  
                   i f   ( p o s   = =   t o t a l - 1 )   {  
                         l a s t _ k n o w n _ t i c k e t   =   t i c k e t ;  
                   }  
                    
                   / / - -   w e   a r e   s e a r c h i n g   f o r   p e n d i n g   o r d e r s ,   s k i p   t r a d e s  
                   i f   ( O r d e r T y p e ( )   < =   O P _ S E L L )   { c o n t i n u e ; }  
                    
                   / / - -  
                   i f   ( S t r i n g S u b s t r ( O r d e r C o m m e n t ( ) ,   0 ,   5 )   = =   " [ o c o : " )  
                   {  
                         i n t   t i c k e t _ o c o   =   S t r T o I n t e g e r ( S t r i n g S u b s t r ( O r d e r C o m m e n t ( ) ,   5 ,   S t r i n g L e n ( O r d e r C o m m e n t ( ) ) - 1 ) ) ;    
                          
                         b o o l   f o u n d   =   f a l s e ;  
                         s i z e   =   A r r a y S i z e ( o r d e r s 2 ) ;  
                         f o r   ( i = 0 ;   i < s i z e ;   i + + )  
                         {  
                               i f   ( o r d e r s 2 [ i ]   = =   t i c k e t _ o c o )   {  
                                     f o u n d   =   t r u e ;  
                                     b r e a k ;  
                               }  
                         }  
                          
                         i f   ( f o u n d   = =   f a l s e )   {  
                               A r r a y R e s i z e ( o r d e r s 1 ,   s i z e + 1 ) ;  
                               A r r a y R e s i z e ( o r d e r s 2 ,   s i z e + 1 ) ;  
                               o r d e r s 1 [ s i z e ]   =   t i c k e t _ o c o ;  
                               o r d e r s 2 [ s i z e ]   =   t i c k e t ;  
                         }  
                   }  
             }  
       }  
        
       s i z e   =   A r r a y S i z e ( o r d e r s 1 ) ;  
       i n t   d b r e m o v e   =   f a l s e ;  
       f o r   ( i = s i z e - 1 ;   i > = 0 ;   i - - )  
       {  
             i f   ( O r d e r S e l e c t ( o r d e r s 1 [ i ] ,   S E L E C T _ B Y _ T I C K E T ,   M O D E _ T R A D E S )   = =   f a l s e   | |   O r d e r T y p e ( )   < =   O P _ S E L L )  
             {  
                   i f   ( O r d e r S e l e c t ( o r d e r s 2 [ i ] ,   S E L E C T _ B Y _ T I C K E T ,   M O D E _ T R A D E S ) )   {  
                         i f   ( D e l e t e O r d e r ( o r d e r s 2 [ i ] , c l r W h i t e ) )  
                         {  
                               d b r e m o v e   =   t r u e ;  
                         }  
                   }  
                   e l s e   {  
                         d b r e m o v e   =   t r u e ;  
                   }  
                    
                   i f   ( d b r e m o v e   = =   t r u e )  
                   {  
                         A r r a y S t r i p K e y ( o r d e r s 1 ,   i ) ;  
                         A r r a y S t r i p K e y ( o r d e r s 2 ,   i ) ;  
                   }  
             }  
       }  
        
       s i z e   =   A r r a y S i z e ( o r d e r s 2 ) ;  
       d b r e m o v e   =   f a l s e ;  
       f o r   ( i = s i z e - 1 ;   i > = 0 ;   i - - )  
       {  
             i f   ( O r d e r S e l e c t ( o r d e r s 2 [ i ] ,   S E L E C T _ B Y _ T I C K E T ,   M O D E _ T R A D E S )   = =   f a l s e   | |   O r d e r T y p e ( )   < =   O P _ S E L L )  
             {  
                   i f   ( O r d e r S e l e c t ( o r d e r s 1 [ i ] ,   S E L E C T _ B Y _ T I C K E T ,   M O D E _ T R A D E S ) )   {  
                         i f   ( D e l e t e O r d e r ( o r d e r s 1 [ i ] , c l r W h i t e ) )  
                         {  
                               d b r e m o v e   =   t r u e ;  
                         }  
                   }  
                   e l s e   {  
                         d b r e m o v e   =   t r u e ;  
                   }  
                    
                   i f   ( d b r e m o v e   = =   t r u e )  
                   {  
                         A r r a y S t r i p K e y ( o r d e r s 1 ,   i ) ;  
                         A r r a y S t r i p K e y ( o r d e r s 2 ,   i ) ;  
                   }  
             }  
       }  
        
       r e t u r n   t r u e ;  
 }  
  
 b o o l   O n T i m e r S e t ( d o u b l e   s e c o n d s )  
 {  
       i f   ( F X D _ O N T I M E R _ T A K E N )  
       {  
             i f   ( s e c o n d s < = 0 )   {  
                   F X D _ O N T I M E R _ T A K E N _ I N _ M I L L I S E C O N D S   =   f a l s e ;  
                   F X D _ O N T I M E R _ T A K E N _ T I M E   =   0 ;  
             }  
             e l s e   i f   ( s e c o n d s   <   1 )   {  
                   F X D _ O N T I M E R _ T A K E N _ I N _ M I L L I S E C O N D S   =   t r u e ;  
                   F X D _ O N T I M E R _ T A K E N _ T I M E   =   s e c o n d s * 1 0 0 0 ;    
             }  
             e l s e   {  
                   F X D _ O N T I M E R _ T A K E N _ I N _ M I L L I S E C O N D S   =   f a l s e ;  
                   F X D _ O N T I M E R _ T A K E N _ T I M E   =   s e c o n d s ;  
             }  
              
             r e t u r n   t r u e ;  
       }  
  
       i f   ( s e c o n d s < = 0 )   {  
             E v e n t K i l l T i m e r ( ) ;  
       }  
       e l s e   i f   ( s e c o n d s   <   1 )   {  
             r e t u r n   ( E v e n t S e t M i l l i s e c o n d T i m e r ( ( i n t ) ( s e c o n d s * 1 0 0 0 ) ) ) ;      
       }  
       e l s e   {  
             r e t u r n   ( E v e n t S e t T i m e r ( ( i n t ) s e c o n d s ) ) ;  
       }  
        
       r e t u r n   t r u e ;  
 }  
  
 v o i d   O n T r a d e L i s t e n e r ( )  
 {  
 	 s t a t i c   d a t e t i m e   s t a r t _ t i m e   =   - 1 ;  
 	 s t a t i c   i n t         m e m o r y _ t i [ ] ;   / /   m e m o r y   o f   t i c k e t s  
 	 s t a t i c   i n t         m e m o r y _ t y [ ] ;   / /   m e m o r y   o f   t y p e s  
 	 s t a t i c   d o u b l e   m e m o r y _ s l [ ] ;  
 	 s t a t i c   d o u b l e   m e m o r y _ t p [ ] ;  
 	 s t a t i c   d o u b l e   m e m o r y _ v l [ ] ;  
 	 s t a t i c   d o u b l e   m e m o r y _ o p [ ] ;  
 	 s t a t i c   b o o l   l o a d e d   =   f a l s e ;  
  
 	 i f   ( ! E N A B L E _ E V E N T _ T R A D E )   { r e t u r n ; }  
  
 	 i n t   t n                     =   0 ;     / /   t i c k e t   n o w   ( i n d e x )  
 	 i n t   t i                     =   - 1 ;   / /   t i c k e t  
 	 i n t   t y                     =   - 1 ;   / /   t y p e  
 	 i n t   s i z e                 =   - 1 ;  
 	 i n t   p o s                   =   0 ;  
 	 s t r i n g   e _ r e a s o n   =   " " ;  
 	 s t r i n g   e _ d e t a i l   =   " " ;  
 	 i n t   i   =   - 1 ,   j   =   - 1 ,   k   =   - 1 ;  
 	 i n t   t i c k e t s _ n o w [ ] ;  
 	  
  
 	 i f   ( s t a r t _ t i m e   = =   - 1 )   { s t a r t _ t i m e   =   T i m e C u r r e n t ( ) ; }  
  
 	 / / - -   T R A D E S   A N D   O R D E R S  
 	 A r r a y R e s i z e ( t i c k e t s _ n o w ,   0 ) ;  
  
 	 i n t   t o t a l   =   O r d e r s T o t a l ( ) ;  
  
 	 / /   i n i t i a l   f i l l   o f   t h e   l o c a l   D B  
 	 i f   ( l o a d e d   = =   f a l s e )  
 	 {  
 	 	 l o a d e d   =   t r u e ;  
  
 	 	 f o r   ( p o s   =   t o t a l - 1 ;   p o s   > =   0 ;   p o s - - )  
 	 	 {  
 	 	 	 i f   ( O r d e r S e l e c t ( p o s ,   S E L E C T _ B Y _ P O S ,   M O D E _ T R A D E S ) )  
 	 	 	 {  
 	 	 	 	 A r r a y R e s i z e ( m e m o r y _ t i ,   t n + 1 ) ;  
 	 	 	 	 A r r a y R e s i z e ( m e m o r y _ t y ,   t n + 1 ) ;  
 	 	 	 	 A r r a y R e s i z e ( m e m o r y _ s l ,   t n + 1 ) ;  
 	 	 	 	 A r r a y R e s i z e ( m e m o r y _ t p ,   t n + 1 ) ;  
 	 	 	 	 A r r a y R e s i z e ( m e m o r y _ v l ,   t n + 1 ) ;  
 	 	 	 	 A r r a y R e s i z e ( m e m o r y _ o p ,   t n + 1 ) ;  
 	 	 	 	 m e m o r y _ t i [ t n ]   =   O r d e r T i c k e t ( ) ;  
 	 	 	 	 m e m o r y _ t y [ t n ]   =   O r d e r T y p e ( ) ;  
 	 	 	 	 m e m o r y _ s l [ t n ]   =   a t t r S t o p L o s s ( ) ;  
 	 	 	 	 m e m o r y _ t p [ t n ]   =   a t t r T a k e P r o f i t ( ) ;  
 	 	 	 	 m e m o r y _ v l [ t n ]   =   O r d e r L o t s ( ) ;  
 	 	 	 	 m e m o r y _ o p [ t n ]   =   O r d e r O p e n P r i c e ( ) ;  
  
 	 	 	 	 t n + + ;  
 	 	 	 }  
 	 	 }  
  
 	 	 r e t u r n ;  
 	 }  
  
 	 t n   =   0 ;  
  
 	 b o o l   p e n d i n g _ o p e n s   =   f a l s e ;  
  
 	 f o r   ( p o s   =   t o t a l - 1 ;   p o s   > =   0 ;   p o s - - )  
 	 {  
 	 	 i f   ( O r d e r S e l e c t ( p o s ,   S E L E C T _ B Y _ P O S ,   M O D E _ T R A D E S ) )  
 	 	 {  
 	 	 	 A r r a y R e s i z e ( t i c k e t s _ n o w ,   t n + 1 ) ;  
 	 	 	 t i c k e t s _ n o w [ t n ]   =   O r d e r T i c k e t ( ) ;  
 	 	 	 t n + + ;  
  
 	 	 	 / /   T r a d e s   a n d   O r d e r s  
 	 	 	 i         =   - 1 ;  
 	 	 	 t i       =   - 1 ;  
 	 	 	 t y       =   - 1 ;  
 	 	 	 s i z e   =   A r r a y S i z e ( m e m o r y _ t i ) ;  
  
 	 	 	 i f   ( s i z e   >   0 )  
 	 	 	 {  
 	 	 	 	 f o r   ( i   =   0 ;   i   <   s i z e ;   i + + )  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( m e m o r y _ t i [ i ]   = =   O r d e r T i c k e t ( ) )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 i f   ( m e m o r y _ t y [ i ]   = =   O r d e r T y p e ( ) )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 t y   =   O r d e r T y p e ( ) ;  
 	 	 	 	 	 	 }  
 	 	 	 	 	 	 e l s e  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 p e n d i n g _ o p e n s   =   t r u e ;  
 	 	 	 	 	 	 }  
  
 	 	 	 	 	 	 t i   =   O r d e r T i c k e t ( ) ;  
  
 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	     }  
 	 	 	     }  
 	 	 	 }  
  
 	 	 	 / /   O r d e r   b e c o m e   a   t r a d e  
 	 	 	 i f   ( t i   >   0   & &   t y   <   0 )  
 	 	 	 {  
 	 	 	 	 m e m o r y _ t i [ i ]   =   O r d e r T i c k e t ( ) ;  
 	 	 	 	 m e m o r y _ t y [ i ]   =   O r d e r T y p e ( ) ;  
  
 	 	 	 	 m e m o r y _ s l [ i ]   =   a t t r S t o p L o s s ( ) ;  
 	 	 	 	 m e m o r y _ t p [ i ]   =   a t t r T a k e P r o f i t ( ) ;  
 	 	 	 	 m e m o r y _ v l [ i ]   =   O r d e r L o t s ( ) ;  
 	 	 	 	 m e m o r y _ o p [ i ]   =   O r d e r O p e n P r i c e ( ) ;  
  
 	 	 	 	 e _ r e a s o n   =   " n e w " ;  
 	 	 	 	 e _ d e t a i l   =   " " ;  
  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
  
 	 	 	 / /   N e w   t r a d e / o r d e r   o p e n e d  
 	 	 	 e l s e   i f   ( t i   <   0   & &   t y   <   0 )  
 	 	 	 {  
 	 	 	 	 A r r a y R e s i z e ( m e m o r y _ t i ,   s i z e + 1 ) ;   m e m o r y _ t i [ s i z e ]   =   O r d e r T i c k e t ( ) ;  
 	 	 	 	 A r r a y R e s i z e ( m e m o r y _ t y ,   s i z e + 1 ) ;   m e m o r y _ t y [ s i z e ]   =   O r d e r T y p e ( ) ;  
 	 	 	 	 A r r a y R e s i z e ( m e m o r y _ s l ,   s i z e + 1 ) ;   m e m o r y _ s l [ s i z e ]   =   a t t r S t o p L o s s ( ) ;  
 	 	 	 	 A r r a y R e s i z e ( m e m o r y _ t p ,   s i z e + 1 ) ;   m e m o r y _ t p [ s i z e ]   =   a t t r T a k e P r o f i t ( ) ;  
 	 	 	 	 A r r a y R e s i z e ( m e m o r y _ v l ,   s i z e + 1 ) ;   m e m o r y _ v l [ s i z e ]   =   O r d e r L o t s ( ) ;  
 	 	 	 	 A r r a y R e s i z e ( m e m o r y _ o p ,   s i z e + 1 ) ;   m e m o r y _ o p [ s i z e ]   =   O r d e r O p e n P r i c e ( ) ;  
  
 	 	 	 	 e _ r e a s o n   =   " n e w " ;  
 	 	 	 	 e _ d e t a i l   =   " " ;  
  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
  
 	 	 	 / /   C h e c k   f o r   L o t s ,   S L   o r   T P   m o d i f i c a t i o n  
 	 	 	 e l s e   i f   ( t y   > =   0   & &   i   >   - 1 )  
 	 	 	 {  
 	 	 	 	 i f   ( m e m o r y _ v l [ i ]   ! =   O r d e r L o t s ( ) )  
 	 	 	 	 {  
 	 	 	 	 	 m e m o r y _ v l [ i ]   =   O r d e r L o t s ( ) ;  
 	 	 	 	 	 e _ r e a s o n   =   " m o d i f y " ;  
 	 	 	 	 	 e _ d e t a i l   =   " l o t s " ;  
  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
 	 	 	 	 e l s e   i f   ( m e m o r y _ o p [ i ]   ! =   O r d e r O p e n P r i c e ( ) )  
 	 	 	 	 {  
 	 	 	 	 	 m e m o r y _ o p [ i ]   =   O r d e r O p e n P r i c e ( ) ;  
 	 	 	 	 	 m e m o r y _ s l [ i ]   =   a t t r S t o p L o s s ( ) ;  
 	 	 	 	 	 m e m o r y _ t p [ i ]   =   a t t r T a k e P r o f i t ( ) ;  
 	 	 	 	 	 e _ r e a s o n   =   " m o d i f y " ;  
 	 	 	 	 	 e _ d e t a i l   =   " m o v e " ;  
  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 i f   ( m e m o r y _ s l [ i ]   ! =   a t t r S t o p L o s s ( )   & &   m e m o r y _ t p [ i ]   ! =   a t t r T a k e P r o f i t ( ) )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 m e m o r y _ s l [ i ]   =   a t t r S t o p L o s s ( ) ;  
 	 	 	 	 	 	 m e m o r y _ t p [ i ]   =   a t t r T a k e P r o f i t ( ) ;  
 	 	 	 	 	 	 e _ r e a s o n   =   " m o d i f y " ;  
 	 	 	 	 	 	 e _ d e t a i l   =   " s l t p " ;  
  
 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 }  
 	 	 	 	 	 e l s e   i f   ( m e m o r y _ s l [ i ]   ! =   a t t r S t o p L o s s ( ) )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 m e m o r y _ s l [ i ]   =   a t t r S t o p L o s s ( ) ;  
 	 	 	 	 	 	 e _ r e a s o n   =   " m o d i f y " ;  
 	 	 	 	 	 	 e _ d e t a i l   =   " s l " ;  
  
 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	 	 }  
 	 	 	 	     	 e l s e   i f   ( m e m o r y _ t p [ i ]   ! =   a t t r T a k e P r o f i t ( ) )  
 	 	 	 	     	 {  
 	 	 	 	     	 	 m e m o r y _ t p [ i ]   =   a t t r T a k e P r o f i t ( ) ;  
 	 	 	 	     	 	 e _ r e a s o n   =   " m o d i f y " ;  
 	 	 	 	     	 	 e _ d e t a i l   =   " t p " ;  
  
 	 	 	 	 	 	 b r e a k ;  
 	 	 	 	     	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 / /   C h e c k   f o r   c l o s e d   o r d e r s / t r a d e s  
 	 b o o l   m i s s i n g   =   t r u e ;  
  
 	 i f   (  
 	 	       e _ r e a s o n   = =   " "  
 	 	 & &   p e n d i n g _ o p e n s   = =   f a l s e  
 	 	 & &   A r r a y S i z e ( t i c k e t s _ n o w )   <   A r r a y S i z e ( m e m o r y _ t i )  
 	 )  
 	 {  
 	 	 / /   f o r   e a c h   t i c k e t   i n   t h e   m e m o r y   c h e c k   i f   t r a d e   e x i s t s   n o w  
 	 	 f o r ( i   =   A r r a y S i z e ( m e m o r y _ t i ) - 1 ;   i   > =   0 ;   i - - )  
 	 	 {  
 	 	 	 f o r ( j   =   0 ;   j   <   A r r a y S i z e ( t i c k e t s _ n o w ) ;   j + + )  
 	 	 	 {  
 	 	 	 	 i f   ( m e m o r y _ t i [ i ]   = =   t i c k e t s _ n o w [ j ] )  
 	 	 	 	 {  
 	 	 	 	 	 m i s s i n g   =   f a l s e ;  
  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 i f   ( m i s s i n g   = =   t r u e )  
 	 	 	 {  
 	 	 	 	 i f   ( O r d e r S e l e c t ( m e m o r y _ t i [ i ] ,   S E L E C T _ B Y _ T I C K E T ) )  
 	 	 	 	 {  
 	 	 	 	 	 / /   T h i s   c a n   h a p p e n   m o r e   t h a n   o n c e  
 	 	 	 	 	 A r r a y S t r i p K e y ( m e m o r y _ t i ,   i ) ;  
 	 	 	 	 	 A r r a y S t r i p K e y ( m e m o r y _ t y ,   i ) ;  
 	 	 	 	 	 A r r a y S t r i p K e y ( m e m o r y _ s l ,   i ) ;  
 	 	 	 	 	 A r r a y S t r i p K e y ( m e m o r y _ t p ,   i ) ;  
 	 	 	 	 	 A r r a y S t r i p K e y ( m e m o r y _ v l ,   i ) ;  
 	 	 	 	 	 A r r a y S t r i p K e y ( m e m o r y _ o p ,   i ) ;  
  
 	 	 	 	 	 e _ r e a s o n   =   " c l o s e " ;  
 	 	 	 	 	 e _ d e t a i l   =   " " ;  
 	 	 	 	 	  
 	 	 	 	 	 i f   (  
 	 	 	 	 	 	       S t r i n g F i n d ( O r d e r C o m m e n t ( ) ,   " e x p i r a t i o n " )   > =   0  
 	 	 	 	 	 	 | |   S t r i n g F i n d ( O r d e r C o m m e n t ( ) ,   " [ e x p : " )   > =   0  
 	 	 	 	 	 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 e _ d e t a i l   =   " e x p i r e " ;  
 	 	 	 	 	 }  
  
 	 	 	 	 	 / /   r e m o v e   v i r t u a l   s t o p s   l i n e s  
 	 	 	 	 	 i f   ( U S E _ V I R T U A L _ S T O P S )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 O b j e c t D e l e t e ( " # "   +   ( s t r i n g ) O r d e r T i c k e t ( )   +   "   s l " ) ;  
 	 	 	 	 	 	 O b j e c t D e l e t e ( " # "   +   ( s t r i n g ) O r d e r T i c k e t ( )   +   "   t p " ) ;  
 	 	 	 	 	 }  
  
 	 	 	 	 	 b r e a k ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 m i s s i n g   =   t r u e ;  
 	 	 }  
 	 }  
  
 	 i f   ( e _ r e a s o n   ! =   " " )  
 	 {  
 	 	 U p d a t e E v e n t V a l u e s ( e _ r e a s o n ,   e _ d e t a i l ) ;  
 	 	 E v e n t T r a d e ( ) ;  
 	 	 O n T r a d e L i s t e n e r ( ) ;  
 	 }  
 	  
 	 r e t u r n ;  
 }  
  
 i n t   O n T r a d e Q u e u e ( i n t   q u e u e = 0 )  
 {  
       s t a t i c   i n t   m e m = 0 ;  
       m e m = m e m + q u e u e ;  
       r e t u r n ( m e m ) ;  
 }  
  
 i n t   O r d e r C r e a t e (  
 	 s t r i n g       s y m b o l           =   " " ,  
 	 i n t             t y p e               =   O P _ B U Y ,  
 	 d o u b l e       l o t s               =   0 ,  
 	 d o u b l e       o p                   =   0 ,  
 	 d o u b l e       s l l                 =   0 ,   / /   S L   l e v e l  
 	 d o u b l e       t p l                 =   0 ,   / /   T O   l e v e l  
 	 d o u b l e       s l p                 =   0 ,   / /   S L   a d j u s t   i n   p o i n t s  
 	 d o u b l e       t p p                 =   0 ,   / /   T P   a d j u s t   i n   p o i n t s  
 	 d o u b l e       s l i p p a g e       =   0 ,  
 	 i n t             m a g i c             =   0 ,  
 	 s t r i n g       c o m m e n t         =   " " ,  
 	 c o l o r         a r r o w c o l o r   =   C L R _ N O N E ,  
 	 d a t e t i m e   e x p i r a t i o n   =   0 ,  
 	 b o o l           o c o                 =   f a l s e  
 	 )  
 {  
 	 u i n t   t i m e 0   =   G e t T i c k C o u n t ( ) ;   / /   u s e d   t o   m e a s u r e   s p e e d   o f   e x e c u t i o n   o f   t h e   o r d e r  
  
 	 i n t   t i c k e t   =   - 1 ;  
 	  
 	 / /   c a l c u l a t e   b u y / s e l l   f l a g   ( 1   w h e n   B u y   o r   - 1   w h e n   S e l l )  
 	 i n t   b s   =   1 ;  
  
 	 i f   (  
 	 	       t y p e   = =   O P _ S E L L  
 	 	 | |   t y p e   = =   O P _ S E L L S T O P  
 	 	 | |   t y p e   = =   O P _ S E L L L I M I T  
 	 	 )  
 	 {  
 	 	 b s   =   - 1 ;  
 	 }  
  
 	 i f   ( s y m b o l   = =   " " )   { s y m b o l   =   S y m b o l ( ) ; }  
  
 	 l o t s   =   A l i g n L o t s ( s y m b o l ,   l o t s ) ;  
  
 	 i n t   d i g i t s   =   0 ;  
 	 d o u b l e   a s k   =   0 ,   b i d   =   0 ,   p o i n t   =   0 ,   t i c k s i z e   =   0 ;  
 	 d o u b l e   s l   =   0 ,   t p   =   0 ;  
 	 d o u b l e   v s l   =   0 ,   v t p   =   0 ;  
  
 	 / / - -   a t t e m p t   t o   s e n d   t r a d e / o r d e r   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 w h i l e   ( ! I s S t o p p e d ( ) )  
 	 {  
 	 	 W a i t T r a d e C o n t e x t I f B u s y ( ) ;  
  
 	 	 s t a t i c   b o o l   n o t _ a l l o w e d _ m e s s a g e   =   f a l s e ;  
  
 	 	 i f   (  
 	 	 	       ! M Q L I n f o I n t e g e r ( M Q L _ T E S T E R )  
 	 	 	 & &   ! M a r k e t I n f o ( s y m b o l ,   M O D E _ T R A D E A L L O W E D )  
 	 	 )   {  
 	 	 	 i f   ( n o t _ a l l o w e d _ m e s s a g e   = =   f a l s e )  
 	 	 	 {  
 	 	 	 	 P r i n t ( " M a r k e t   ( " + s y m b o l + " )   i s   c l o s e d " ) ;  
 	 	 	 }  
  
 	 	 	 n o t _ a l l o w e d _ m e s s a g e   =   t r u e ;  
  
 	 	 	 r e t u r n   f a l s e ;  
 	 	 }  
  
 	 	 n o t _ a l l o w e d _ m e s s a g e   =   f a l s e ;  
 	 	  
 	 	 d i g i t s       =   ( i n t ) M a r k e t I n f o ( s y m b o l ,   M O D E _ D I G I T S ) ;  
 	 	 a s k             =   M a r k e t I n f o ( s y m b o l ,   M O D E _ A S K ) ;  
 	 	 b i d             =   M a r k e t I n f o ( s y m b o l ,   M O D E _ B I D ) ;  
 	 	 p o i n t         =   M a r k e t I n f o ( s y m b o l ,   M O D E _ P O I N T ) ;  
 	 	 t i c k s i z e   =   M a r k e t I n f o ( s y m b o l ,   M O D E _ T I C K S I Z E ) ;  
 	 	  
 	 	 / / -   n o t   e n o u g h   m o n e y   c h e c k :   f i x   m a x i m u m   p o s s i b l e   l o t   b y   m a r g i n   r e q u i r e d ,   o r   q u i t  
 	 	 i f   ( t y p e = = O P _ B U Y   | |   t y p e = = O P _ S E L L )  
 	 	 {  
 	 	 	 d o u b l e   L o t S t e p                     =   M a r k e t I n f o ( s y m b o l , M O D E _ L O T S T E P ) ;  
 	 	 	 d o u b l e   M i n L o t s                     =   M a r k e t I n f o ( s y m b o l , M O D E _ M I N L O T ) ;  
 	 	 	 d o u b l e   m a r g i n _ r e q u i r e d     =   M a r k e t I n f o ( s y m b o l , M O D E _ M A R G I N R E Q U I R E D ) ;  
 	 	 	 s t a t i c   b o o l   n o t _ e n o u g h _ m e s s a g e   =   f a l s e ;  
 	 	 	  
 	 	 	 i f   ( m a r g i n _ r e q u i r e d   ! =   0 )  
 	 	 	 {  
 	 	 	 	 d o u b l e   m a x _ s i z e _ b y _ m a r g i n   =   A c c o u n t F r e e M a r g i n ( )   /   m a r g i n _ r e q u i r e d ;  
  
 	 	 	 	 i f   ( l o t s   >   m a x _ s i z e _ b y _ m a r g i n )  
 	 	 	 	 {  
 	 	 	 	 	 d o u b l e   s i z e _ o l d   =   l o t s ;  
 	 	 	 	 	 l o t s   =   m a x _ s i z e _ b y _ m a r g i n ;  
  
 	 	 	 	 	 i f   ( l o t s   <   M i n L o t s )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 i f   ( n o t _ e n o u g h _ m e s s a g e   = =   f a l s e )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 P r i n t ( " N o t   e n o u g h   m o n e y   t o   t r a d e   : (   T h e   r o b o t   i s   s t i l l   w o r k i n g ,   w a i t i n g   f o r   s o m e   f u n d s   t o   a p p e a r . . . " ) ;  
 	 	 	 	 	 	 }  
  
 	 	 	 	 	 	 n o t _ e n o u g h _ m e s s a g e   =   t r u e ;  
 	 	 	 	 	 	 r e t u r n   f a l s e ;  
 	 	 	 	 	 }  
 	 	 	 	 	 e l s e  
 	 	 	 	 	 {  
 	 	 	 	 	 	 l o t s   =   M a t h F l o o r ( l o t s   /   L o t S t e p )   *   L o t S t e p ;  
  
 	 	 	 	 	 	 P r i n t ( " N o t   e n o u g h   m o n e y   t o   t r a d e   "   +   D o u b l e T o S t r i n g ( s i z e _ o l d ,   2 ) + " ,   t h e   v o l u m e   t o   t r a d e   w i l l   b e   t h e   m a x i m u m   p o s s i b l e   o f   "   +   D o u b l e T o S t r i n g ( l o t s ,   2 ) ) ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 n o t _ e n o u g h _ m e s s a g e   =   f a l s e ;  
 	 	 }  
 	 	  
 	 	 / /   f i x   t h e   c o m m e n t ,   b e c a u s e   i t   s e e m s   t h a t   t h e   c o m m e n t   i s   d e l e t e d   i f   i t s   l e n g h t   i s   >   3 1   s y m b o l s  
 	 	 i f   ( S t r i n g L e n ( c o m m e n t )   >   3 1 )  
 	 	 {  
 	 	 	 c o m m e n t   =   S t r i n g S u b s t r ( c o m m e n t , 0 , 3 1 ) ;  
 	 	 }  
 	 	  
 	 	 / / -   e x p i r a t i o n   f o r   t r a d e s  
 	 	 i f   ( t y p e   = =   O P _ B U Y   | |   t y p e   = =   O P _ S E L L )  
 	 	 {  
 	 	 	 i f   ( e x p i r a t i o n   >   0 )  
 	 	 	 {  
 	 	 	 	 / / -   c o n v e r t   U N I X   t o   s e c o n d s  
 	 	 	 	 i f   ( e x p i r a t i o n   >   T i m e C u r r e n t ( ) - 1 0 0 )   {  
 	 	 	 	 	 e x p i r a t i o n   =   e x p i r a t i o n   -   T i m e C u r r e n t ( ) ;  
 	 	 	 	 }  
 	 	 	 	  
 	 	 	 	 / / -   b o   b r o k e r ?  
 	 	 	 	 i f   (  
 	 	 	 	 	       S t r i n g L e n ( s y m b o l )   >   6  
 	 	 	 	 	 & &   S t r i n g S u b s t r ( s y m b o l ,   S t r i n g L e n ( s y m b o l )   -   2 )   = =   " b o "  
 	 	 	 	 )   {  
 	 	 	 	 	 c o m m e n t   =   " B O   e x p : "   +   ( s t r i n g ) e x p i r a t i o n ;  
 	 	 	 	 }  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 s t r i n g   e x p i r a t i o n _ s t r   =   " [ e x p : "   +   I n t e g e r T o S t r i n g ( e x p i r a t i o n )   +   " ] " ;  
 	 	 	 	 	 i n t   e x p i r a t i o n _ l e n         =   S t r i n g L e n ( e x p i r a t i o n _ s t r ) ;  
 	 	 	 	 	 i n t   c o m m e n t _ l e n               =   S t r i n g L e n ( c o m m e n t ) ;  
  
 	 	 	 	 	 i f   ( c o m m e n t _ l e n   >   ( 2 7   -   e x p i r a t i o n _ l e n ) )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 c o m m e n t   =   S t r i n g S u b s t r ( c o m m e n t ,   0 ,   ( 2 7   -   e x p i r a t i o n _ l e n ) ) ;  
 	 	 	 	 	 }  
  
 	 	 	 	 	 c o m m e n t   =   c o m m e n t   +   e x p i r a t i o n _ s t r ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
  
 	 	 i f   ( t y p e   = =   O P _ B U Y   | |   t y p e   = =   O P _ S E L L )  
 	 	 {  
 	 	 	 o p   =   ( b s   >   0 )   ?   a s k   :   b i d ;  
 	 	 }  
  
 	 	 o p     =   N o r m a l i z e D o u b l e ( o p ,   d i g i t s ) ;  
 	 	 s l l   =   N o r m a l i z e D o u b l e ( s l l ,   d i g i t s ) ;  
 	 	 t p l   =   N o r m a l i z e D o u b l e ( t p l ,   d i g i t s ) ;  
  
 	 	 i f   ( o p   <   0   | |   o p   > =   E M P T Y _ V A L U E   | |   s l l   <   0   | |   s l p   <   0   | |   t p l   <   0   | |   t p p   <   0 )  
 	 	 {  
 	 	 	 b r e a k ;  
 	 	 }  
  
 	 	 / / - -   S L   a n d   T P   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 v s l   =   0 ;   v t p   =   0 ;  
 	 	  
 	 	 s l   =   A l i g n S t o p L o s s ( s y m b o l ,   t y p e ,   o p ,   0 ,   N o r m a l i z e D o u b l e ( s l l ,   d i g i t s ) ,   s l p ) ;  
  
 	 	 i f   ( s l   <   0 )   { b r e a k ; }  
  
 	 	 t p   =   A l i g n T a k e P r o f i t ( s y m b o l ,   t y p e ,   o p ,   0 ,   N o r m a l i z e D o u b l e ( t p l ,   d i g i t s ) ,   t p p ) ;  
  
 	 	 i f   ( t p   <   0 )   { b r e a k ; }  
 	 	  
 	 	 i f   ( U S E _ V I R T U A L _ S T O P S )  
 	 	 {  
 	 	 	 / / - -   v i r t u a l   S L   a n d   T P   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 v s l   =   s l ;  
 	 	 	 v t p   =   t p ;  
 	 	 	 s l   =   0 ;  
 	 	 	 t p   =   0 ;  
  
 	 	 	 d o u b l e   a s k b i d   =   ( b s   >   0 )   ?   a s k   :   b i d ;  
  
 	 	 	 i f   ( v s l   >   0   | |   U S E _ E M E R G E N C Y _ S T O P S   = =   " a l w a y s " )  
 	 	 	 {  
 	 	 	 	 i f   ( E M E R G E N C Y _ S T O P S _ R E L   >   0   | |   E M E R G E N C Y _ S T O P S _ A D D   >   0 )  
 	 	 	 	 {  
 	 	 	 	 	 s l   =   v s l   -   E M E R G E N C Y _ S T O P S _ R E L   *   M a t h A b s ( a s k b i d   -   v s l )   *   b s ;  
  
 	 	 	 	 	 i f   ( s l   < =   0 )   { s l   =   a s k b i d ; }  
  
 	 	 	 	 	 s l   =   s l   -   t o D i g i t s ( E M E R G E N C Y _ S T O P S _ A D D ,   s y m b o l )   *   b s ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 i f   ( v t p   >   0   | |   U S E _ E M E R G E N C Y _ S T O P S   = =   " a l w a y s " )  
 	 	 	 {  
 	 	 	 	 i f   ( E M E R G E N C Y _ S T O P S _ R E L   >   0   | |   E M E R G E N C Y _ S T O P S _ A D D   >   0 )  
 	 	 	 	 {  
 	 	 	 	 	 t p   =   v t p   +   E M E R G E N C Y _ S T O P S _ R E L   *   M a t h A b s ( v t p   -   a s k b i d )   *   b s ;  
  
 	 	 	 	 	 i f   ( t p   < =   0 )   { t p   =   a s k b i d ; }  
  
 	 	 	 	 	 t p   =   t p   +   t o D i g i t s ( E M E R G E N C Y _ S T O P S _ A D D ,   s y m b o l )   *   b s ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 v s l   =   N o r m a l i z e D o u b l e ( v s l ,   d i g i t s ) ;  
 	 	 	 v t p   =   N o r m a l i z e D o u b l e ( v t p ,   d i g i t s ) ;  
 	 	 }  
  
 	 	 s l   =   N o r m a l i z e D o u b l e ( s l ,   d i g i t s ) ;  
 	 	 t p   =   N o r m a l i z e D o u b l e ( t p ,   d i g i t s ) ;  
  
 	 	 / / - -   f i x   e x p i r a t i o n   f o r   p e n d i n g   o r d e r s   - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 i f   ( e x p i r a t i o n   >   0   & &   t y p e   >   O P _ S E L L )  
 	 	 {  
 	 	 	 i f   ( ( e x p i r a t i o n   -   T i m e C u r r e n t ( ) )   <   ( 1 1   *   6 0 ) )  
 	 	 	 {  
 	 	 	 	 P r i n t ( " E x p i r a t i o n   t i m e   c a n n o t   b e   l e s s   t h a n   1 1   m i n u t e s ,   s o   i t   w a s   a u t o m a t i c a l l y   m o d i f i e d   t o   1 1   m i n u t e s . " ) ;  
 	 	 	 	 e x p i r a t i o n   =   T i m e C u r r e n t ( )   +   ( 1 1   *   6 0 ) ;  
 	 	 	 }  
 	 	 }  
  
 	 	 / / - -   f i x   p r i c e s   b y   t i c k s i z e  
 	 	 o p   =   M a t h R o u n d ( o p   /   t i c k s i z e )   *   t i c k s i z e ;  
 	 	 s l   =   M a t h R o u n d ( s l   /   t i c k s i z e )   *   t i c k s i z e ;  
 	 	 t p   =   M a t h R o u n d ( t p   /   t i c k s i z e )   *   t i c k s i z e ;  
  
 	 	 / / - -   s e n d   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 R e s e t L a s t E r r o r ( ) ;  
  
 	 	 t i c k e t   =   O r d e r S e n d (  
 	 	 	 s y m b o l ,  
 	 	 	 t y p e ,  
 	 	 	 l o t s ,  
 	 	 	 o p ,  
 	 	 	 ( i n t ) ( s l i p p a g e   *   P i p V a l u e ( s y m b o l ) ) ,  
 	 	 	 s l ,  
 	 	 	 t p ,  
 	 	 	 c o m m e n t ,  
 	 	 	 m a g i c ,  
 	 	 	 e x p i r a t i o n ,  
 	 	 	 a r r o w c o l o r  
 	 	 ) ;  
  
 	 	 / / - -   e r r o r   c h e c k   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 s t r i n g   m s g _ p r e f i x   =   ( t y p e   >   O P _ S E L L )   ?   " N e w   o r d e r   e r r o r "   :   " N e w   t r a d e   e r r o r " ;  
  
 	 	 i n t   e r r a c t i o n   =   C h e c k F o r T r a d i n g E r r o r ( G e t L a s t E r r o r ( ) ,   m s g _ p r e f i x ) ;  
  
 	 	 s w i t c h ( e r r a c t i o n )  
 	 	 {  
 	 	 	 c a s e   0 :   b r e a k ;         / /   n o   e r r o r  
 	 	 	 c a s e   1 :   c o n t i n u e ;   / /   o v e r c o m a b l e   e r r o r  
 	 	 	 c a s e   2 :   b r e a k ;         / /   f a t a l   e r r o r  
 	 	 }  
  
 	 	 / / - -   f i n i s h   w o r k   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 i f   ( t i c k e t   >   0 )  
 	 	 {  
 	 	 	 i f   ( U S E _ V I R T U A L _ S T O P S )  
 	 	 	 {  
 	 	 	 	 V i r t u a l S t o p s D r i v e r ( " s e t " ,   t i c k e t ,   v s l ,   v t p ,   t o P i p s ( M a t h A b s ( o p - v s l ) ,   s y m b o l ) ,   t o P i p s ( M a t h A b s ( v t p - o p ) ,   s y m b o l ) ) ;  
 	 	 	 }  
 	 	 	  
 	 	 	 / / - -   s h o w   s o m e   i n f o  
 	 	 	 d o u b l e   s l i p   =   0 ;  
  
 	 	 	 i f   ( O r d e r S e l e c t ( t i c k e t ,   S E L E C T _ B Y _ T I C K E T ) )  
 	 	 	 {  
 	 	 	 	 i f   (  
 	 	 	 	 	       ! M Q L I n f o I n t e g e r ( M Q L _ T E S T E R )  
 	 	 	 	 	 & &   ! M Q L I n f o I n t e g e r ( M Q L _ V I S U A L _ M O D E )  
 	 	 	 	 	 & &   ! M Q L I n f o I n t e g e r ( M Q L _ O P T I M I Z A T I O N )  
 	 	 	 	 )   {  
 	 	 	 	 	 s l i p   =   O r d e r O p e n P r i c e ( )   -   o p ;  
  
 	 	 	 	 	 P r i n t (  
 	 	 	 	 	 	 " O p e r a t i o n   d e t a i l s :   S p e e d   " ,  
 	 	 	 	 	 	 ( G e t T i c k C o u n t ( )   -   t i m e 0 ) ,  
 	 	 	 	 	 	 "   m s   |   S l i p p a g e   " ,  
 	 	 	 	 	 	 D o u b l e T o S t r ( t o P i p s ( s l i p ,   s y m b o l ) ,   1 ) ,  
 	 	 	 	 	 	 "   p i p s "  
 	 	 	 	 	 ) ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 / / - -   f i x   s t o p s   i n   c a s e   o f   s l i p p a g e  
 	 	 	 i f   (  
 	 	 	 	       ! M Q L I n f o I n t e g e r ( M Q L _ T E S T E R )  
 	 	 	 	 & &   ! M Q L I n f o I n t e g e r ( M Q L _ V I S U A L _ M O D E )  
 	 	 	 	 & & ! M Q L I n f o I n t e g e r ( M Q L _ O P T I M I Z A T I O N )  
 	 	 	 )   {  
 	 	 	 	 s l i p   =   N o r m a l i z e D o u b l e ( O r d e r O p e n P r i c e ( ) ,   d i g i t s )   -   N o r m a l i z e D o u b l e ( o p ,   d i g i t s ) ;  
  
 	 	 	 	 i f   ( s l i p   ! =   0   & &   ( O r d e r S t o p L o s s ( )   ! =   0   | |   O r d e r T a k e P r o f i t ( )   ! =   0 ) )  
 	 	 	 	 {  
 	 	 	 	 	 P r i n t ( " C o r r e c t i n g   s t o p s   b e c a u s e   o f   s l i p p a g e . . . " ) ;  
  
 	 	 	 	 	 s l   =   O r d e r S t o p L o s s ( ) ;  
 	 	 	 	 	 t p   =   O r d e r T a k e P r o f i t ( ) ;  
  
 	 	 	 	 	 i f   ( s l   ! =   0   | |   t p   ! =   0 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 i f   ( s l   ! =   0 )   { s l   =   N o r m a l i z e D o u b l e ( O r d e r S t o p L o s s ( )   +   s l i p ,   d i g i t s ) ; }  
 	 	 	 	 	 	 i f   ( t p   ! =   0 )   { t p   =   N o r m a l i z e D o u b l e ( O r d e r T a k e P r o f i t ( )   +   s l i p ,   d i g i t s ) ; }  
  
 	 	 	 	 	 	 M o d i f y O r d e r ( t i c k e t ,   O r d e r O p e n P r i c e ( ) ,   s l ,   t p ,   0 ,   0 ,   0 ,   C L R _ N O N E ,   f a l s e ) ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 R e g i s t e r E v e n t ( " t r a d e " ) ;  
  
 	 	 	 b r e a k ;  
 	 	 }  
  
 	 	 b r e a k ;  
 	 }  
  
 	 i f   ( o c o   = =   t r u e   & &   t i c k e t   >   0 )  
 	 {  
 	 	 i f   ( U S E _ V I R T U A L _ S T O P S )  
 	 	 {  
 	 	 	 s l   =   v s l ;  
 	 	 	 t p   =   v t p ;  
 	 	 }  
  
 	 	 s l   =   ( s l   >   0 )   ?   N o r m a l i z e D o u b l e ( M a t h A b s ( o p - s l ) ,   d i g i t s )   :   0 ;  
 	 	 t p   =   ( t p   >   0 )   ?   N o r m a l i z e D o u b l e ( M a t h A b s ( o p - t p ) ,   d i g i t s )   :   0 ;  
  
 	 	 i n t   t y p e o c o   =   t y p e ;  
  
 	 	 i f   ( t y p e o c o   = =   O P _ B U Y S T O P )  
 	 	 {  
 	 	 	 t y p e o c o   =   O P _ S E L L S T O P ;  
 	 	 	 o p   =   b i d   -   M a t h A b s ( o p   -   a s k ) ;  
 	 	 }  
 	 	 e l s e   i f   ( t y p e o c o   = =   O P _ B U Y L I M I T )  
 	 	 {  
 	 	 	 t y p e o c o   =   O P _ S E L L L I M I T ;  
 	 	 	 o p   =   b i d   +   M a t h A b s ( o p   -   a s k ) ;  
 	 	 }  
 	 	 e l s e   i f   ( t y p e o c o   = =   O P _ S E L L S T O P )  
 	 	 {  
 	 	 	 t y p e o c o   =   O P _ B U Y S T O P ;  
 	 	 	 o p   =   a s k   +   M a t h A b s ( o p   -   b i d ) ;  
 	 	 }  
 	 	 e l s e   i f   ( t y p e o c o   = =   O P _ S E L L L I M I T )  
 	 	 {  
 	 	 	 t y p e o c o   =   O P _ B U Y L I M I T ;  
 	 	 	 o p   =   a s k   -   M a t h A b s ( o p   -   b i d ) ;  
 	 	 }  
  
 	 	 i f   ( t y p e o c o   = =   O P _ B U Y S T O P   | |   t y p e o c o   = =   O P _ B U Y L I M I T )  
 	 	 {  
 	 	 	 s l   =   ( s l   >   0 )   ?   o p   -   s l   :   0 ;  
 	 	 	 t p   =   ( t p   >   0 )   ?   o p   +   t p   :   0 ;  
 	 	 	 a r r o w c o l o r   =   c l r B l u e ;  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 s l   =   ( s l   >   0 )   ?   o p   +   s l   :   0 ;  
 	 	 	 t p   =   ( t p   >   0 )   ?   o p   -   t p   :   0 ;  
 	 	 	 a r r o w c o l o r   =   c l r R e d ;  
 	 	 }  
  
 	 	 c o m m e n t   =   " [ o c o : "   +   ( s t r i n g ) t i c k e t   +   " ] " ;  
  
 	 	 O r d e r C r e a t e ( s y m b o l ,   t y p e o c o ,   l o t s ,   o p ,   s l ,   t p ,   0 ,   0 ,   s l i p p a g e ,   m a g i c ,   c o m m e n t ,   a r r o w c o l o r ,   e x p i r a t i o n ,   f a l s e ) ;  
 	 }  
  
 	 r e t u r n   t i c k e t ;  
 }  
  
 / * *  
 T h i s   i s   a   r e p l a c e m e n t   f o r   t h e   s y s t e m   f u n c t i o n .  
 T h e   d i f f e r e n c e   i s   t h a t   t h i s   c h e c k s   t h e   e x p i r a t i o n   f o r   t r a d e s .  
 * /  
 d a t e t i m e   O r d e r E x p i r a t i o n ( b o o l   c h e c k _ t r a d e )  
 {  
 	 i f   ( O r d e r T y p e ( )   >   1 )  
 	 {  
 	 	 r e t u r n   O r d e r E x p i r a t i o n ( ) ;  
 	 }  
 	 e l s e   i f   ( c h e c k _ t r a d e )  
 	 {  
 	 	 s t r i n g   c o m m e n t   =   O r d e r C o m m e n t ( ) ;  
 	 	 i n t   e x p _ p o s         =   S t r i n g F i n d ( c o m m e n t ,   " [ e x p : " ) ;  
  
 	 	 i f   ( e x p _ p o s   = =   - 1 )   r e t u r n   0 ;  
 	 	  
 	 	 i n t   e x p _ p o s _ e n d   =   S t r i n g F i n d ( c o m m e n t ,   " ] " ,   e x p _ p o s ) ;  
 	 	  
 	 	 i f   ( e x p _ p o s _ e n d   < =   0 )   r e t u r n   0 ;  
  
 	 	 i n t   e x p i r a t i o n _ s e c o n d s   =   ( i n t ) S t r i n g T o I n t e g e r ( S t r i n g S u b s t r ( c o m m e n t ,   e x p _ p o s   +   5 ,   e x p _ p o s _ e n d   -   ( e x p _ p o s   +   5 ) ) ) ;  
  
 	 	 r e t u r n   ( d a t e t i m e ) ( ( i n t ) O r d e r O p e n T i m e ( )   +   e x p i r a t i o n _ s e c o n d s ) ;  
 	 }  
 	  
 	 r e t u r n   0 ;  
 }  
  
 b o o l   O r d e r M o d i f i e d ( u l o n g   t i c k e t   =   0 ,   s t r i n g   a c t i o n   =   " s e t " )  
 {  
 	 s t a t i c   u l o n g   m e m o r y [ ] ;  
  
 	 i f   ( t i c k e t   = =   0 )  
 	 {  
 	 	 t i c k e t   =   O r d e r T i c k e t ( ) ;  
 	 	 a c t i o n   =   " g e t " ;  
 	 }  
 	 e l s e   i f   ( t i c k e t   >   0   & &   a c t i o n   ! =   " c l e a r " )  
 	 {  
 	 	 a c t i o n   =   " s e t " ;  
 	 }  
  
 	 b o o l   m o d i f i e d _ s t a t u s   =   I n A r r a y ( m e m o r y ,   t i c k e t ) ;  
 	  
 	 i f   ( a c t i o n   = =   " g e t " )  
 	 {  
 	 	 r e t u r n   m o d i f i e d _ s t a t u s ;  
 	 }  
 	 e l s e   i f   ( a c t i o n   = =   " s e t " )  
 	 {  
 	 	 A r r a y E n s u r e V a l u e ( m e m o r y ,   t i c k e t ) ;  
  
 	 	 r e t u r n   t r u e ;  
 	 }  
 	 e l s e   i f   ( a c t i o n   = =   " c l e a r " )  
 	 {  
 	 	 A r r a y S t r i p V a l u e ( m e m o r y ,   t i c k e t ) ;  
  
 	 	 r e t u r n   t r u e ;  
 	 }  
  
 	 r e t u r n   f a l s e ;  
 }  
  
 b o o l   P e n d i n g O r d e r S e l e c t B y T i c k e t ( u l o n g   t i c k e t )  
 {  
 	 i f   ( O r d e r S e l e c t ( ( i n t ) t i c k e t ,   S E L E C T _ B Y _ T I C K E T ,   M O D E _ T R A D E S )   & &   O r d e r T y p e ( )   >   1 )  
 	 {  
 	 	 r e t u r n   t r u e ;  
 	 }  
  
 	 r e t u r n   f a l s e ;  
 }  
  
 d o u b l e   P i p V a l u e ( s t r i n g   s y m b o l )  
 {  
 	 i f   ( s y m b o l   = =   " " )   s y m b o l   =   S y m b o l ( ) ;  
  
 	 r e t u r n   C u s t o m P o i n t ( s y m b o l )   /   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ P O I N T ) ;  
 }  
  
 / /   C o l l e c t   e v e n t s ,   i f   a n y  
 v o i d   R e g i s t e r E v e n t ( s t r i n g   c o m m a n d = " " )  
 {  
       i n t   t i c k e t = O r d e r T i c k e t ( ) ;  
 	 O n T r a d e L i s t e n e r ( ) ;  
       t i c k e t = O r d e r S e l e c t ( t i c k e t , S E L E C T _ B Y _ T I C K E T ) ;  
       r e t u r n ;  
 }  
  
 i n t   S e c o n d s F r o m C o m p o n e n t s ( d o u b l e   d a y s ,   d o u b l e   h o u r s ,   d o u b l e   m i n u t e s ,   i n t   s e c o n d s )  
 {  
 	 i n t   r e t v a l   =  
 	 	 8 6 4 0 0   *   ( i n t ) M a t h F l o o r ( d a y s )  
 	 	 +   3 6 0 0   *   ( i n t ) ( M a t h F l o o r ( h o u r s )   +   ( 2 4   *   ( d a y s   -   M a t h F l o o r ( d a y s ) ) ) )  
 	 	 +   6 0   *   ( i n t ) ( M a t h F l o o r ( m i n u t e s )   +   ( 6 0   *   ( h o u r s   -   M a t h F l o o r ( h o u r s ) ) ) )  
 	 	 +   ( i n t ) ( ( d o u b l e ) s e c o n d s   +   ( 6 0   *   ( m i n u t e s   -   M a t h F l o o r ( m i n u t e s ) ) ) ) ;  
  
 	 r e t u r n   r e t v a l ;  
 }  
  
 i n t   S e l l N o w (  
 	 s t r i n g   s y m b o l ,  
 	 d o u b l e   l o t s ,  
 	 d o u b l e   s l l ,  
 	 d o u b l e   t p l ,  
 	 d o u b l e   s l p ,  
 	 d o u b l e   t p p ,  
 	 d o u b l e   s l i p p a g e   =   0 ,  
 	 i n t   m a g i c   =   0 ,  
 	 s t r i n g   c o m m e n t   =   " " ,  
 	 c o l o r   a r r o w c o l o r   =   c l r N O N E ,  
 	 d a t e t i m e   e x p i r a t i o n   =   0  
 	 )  
 {  
 	 r e t u r n   O r d e r C r e a t e (  
 	 	 s y m b o l ,  
 	 	 O P _ S E L L ,  
 	 	 l o t s ,  
 	 	 0 ,  
 	 	 s l l ,  
 	 	 t p l ,  
 	 	 s l p ,  
 	 	 t p p ,  
 	 	 s l i p p a g e ,  
 	 	 m a g i c ,  
 	 	 c o m m e n t ,  
 	 	 a r r o w c o l o r ,  
 	 	 e x p i r a t i o n  
 	 ) ;  
 }  
  
 t e m p l a t e < t y p e n a m e   T >  
 v o i d   S t r i n g E x p l o d e ( s t r i n g   d e l i m i t e r ,   s t r i n g   i n p u t S t r i n g ,   T   & o u t p u t [ ] )  
 {  
 	 i n t   b e g i n       =   0 ;  
 	 i n t   e n d           =   0 ;  
 	 i n t   e l e m e n t   =   0 ;  
 	 i n t   l e n g t h     =   S t r i n g L e n ( i n p u t S t r i n g ) ;  
 	 i n t   l e n g t h _ d e l i m i t e r   =   S t r i n g L e n ( d e l i m i t e r ) ;  
 	 T   e m p t y _ v a l     =   ( t y p e n a m e ( T )   = =   " s t r i n g " )   ?   ( T ) " "   :   ( T ) 0 ;  
  
 	 i f   ( l e n g t h   >   0 )  
 	 {  
 	 	 w h i l e   ( t r u e )  
 	 	 {  
 	 	 	 e n d   =   S t r i n g F i n d ( i n p u t S t r i n g ,   d e l i m i t e r ,   b e g i n ) ;  
  
 	 	 	 A r r a y R e s i z e ( o u t p u t ,   e l e m e n t   +   1 ) ;  
 	 	 	 o u t p u t [ e l e m e n t ]   =   e m p t y _ v a l ;  
 	  
 	 	 	 i f   ( e n d   ! =   - 1 )  
 	 	 	 {  
 	 	 	 	 i f   ( e n d   >   b e g i n )  
 	 	 	 	 {  
 	 	 	 	 	 o u t p u t [ e l e m e n t ]   =   ( T ) S t r i n g S u b s t r ( i n p u t S t r i n g ,   b e g i n ,   e n d   -   b e g i n ) ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 o u t p u t [ e l e m e n t ]   =   ( T ) S t r i n g S u b s t r ( i n p u t S t r i n g ,   b e g i n ,   l e n g t h   -   b e g i n ) ;  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
 	 	 	  
 	 	 	 b e g i n   =   e n d   +   1   +   ( l e n g t h _ d e l i m i t e r   -   1 ) ;  
 	 	 	 e l e m e n t + + ;  
 	 	 }  
 	 }  
 	 e l s e  
 	 {  
 	 	 A r r a y R e s i z e ( o u t p u t ,   1 ) ;  
 	 	 o u t p u t [ e l e m e n t ]   =   e m p t y _ v a l ;  
 	 }  
 }  
  
 t e m p l a t e < t y p e n a m e   T >  
 s t r i n g   S t r i n g I m p l o d e ( s t r i n g   d e l i m e t e r ,   T   & a r r a y [ ] )  
 {  
       s t r i n g   r e t v a l   =   " " ;  
       i n t   s i z e             =   A r r a y S i z e ( a r r a y ) ;  
  
       f o r   ( i n t   i   =   0 ;   i   <   s i z e ;   i + + )  
 	 {  
             r e t v a l   =   S t r i n g C o n c a t e n a t e ( r e t v a l ,   ( s t r i n g ) a r r a y [ i ] ,   d e l i m e t e r ) ;  
       }  
 	  
       r e t u r n   S t r i n g S u b s t r ( r e t v a l ,   0 ,   ( S t r i n g L e n ( r e t v a l )   -   S t r i n g L e n ( d e l i m e t e r ) ) ) ;  
 }  
  
 d a t e t i m e   S t r i n g T o T i m e E x ( s t r i n g   s t r ,   s t r i n g   m o d e = " s e r v e r " )  
 {  
 	 / /   m o d e :   s e r v e r ,   l o c a l ,   g m t  
 	 i f   ( S t r i n g F i n d ( s t r ,   "   " )   ! =   - 1 )   {  
 	       r e t u r n   S t r i n g T o T i m e ( s t r ) ;  
 	 }  
 	  
 	 d a t e t i m e   n o w   =   0 ;  
 	 d a t e t i m e   r e t v a l   =   0 ;  
 	  
 	 i f   ( m o d e   = =   " s e r v e r " )   { n o w   =   T i m e C u r r e n t ( ) ; }  
 	 e l s e   i f   ( m o d e   = =   " l o c a l " )   { n o w   =   T i m e L o c a l ( ) ; }  
 	 e l s e   i f   ( m o d e   = =   " g m t " )   { n o w   =   T i m e G M T ( ) ; }  
 	  
 	 r e t u r n   S t r i n g T o T i m e ( ( s t r i n g ) T i m e Y e a r ( n o w ) + " . " + ( s t r i n g ) T i m e M o n t h ( n o w ) + " . " + ( s t r i n g ) T i m e D a y ( n o w ) + "   " + s t r ) ;  
 }  
  
 s t r i n g   S t r i n g T r i m ( s t r i n g   t e x t )  
 {  
       t e x t   =   S t r i n g T r i m R i g h t ( t e x t ) ;  
       t e x t   =   S t r i n g T r i m L e f t ( t e x t ) ;  
 	  
 	 r e t u r n   t e x t ;  
 }  
  
 d o u b l e   S y m b o l A s k ( s t r i n g   s y m b o l )  
 {  
 	 i f   ( s y m b o l   = =   " " )   s y m b o l   =   S y m b o l ( ) ;  
  
 	 r e t u r n   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K ) ;  
 }  
  
 d o u b l e   S y m b o l B i d ( s t r i n g   s y m b o l )  
 {  
 	 i f   ( s y m b o l   = =   " " )   s y m b o l   =   S y m b o l ( ) ;  
  
 	 r e t u r n   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D ) ;  
 }  
  
 i n t   S y m b o l D i g i t s ( s t r i n g   s y m b o l )  
 {  
 	 i f   ( s y m b o l   = =   " " )   s y m b o l   =   S y m b o l ( ) ;  
  
 	 r e t u r n   ( i n t ) S y m b o l I n f o I n t e g e r ( s y m b o l ,   S Y M B O L _ D I G I T S ) ;  
 }  
  
 d o u b l e   T i c k s D a t a ( s t r i n g   s y m b o l   =   " " ,   i n t   t y p e   =   0 ,   i n t   s h i f t   =   0 )  
 {  
 	 s t a t i c   b o o l   c o l l e c t i n g _ t i c k s   =   f a l s e ;  
 	 s t a t i c   s t r i n g   s y m b o l s [ ] ;  
 	 s t a t i c   i n t   z e r o _ s i d [ ] ;  
 	 s t a t i c   d o u b l e   m e m o r y A S K [ ] [ 1 0 0 ] ;  
 	 s t a t i c   d o u b l e   m e m o r y B I D [ ] [ 1 0 0 ] ;  
  
 	 i n t   s i d   =   0 ,   s i z e   =   0 ,   i   =   0 ,   i d   =   0 ;  
 	 d o u b l e   a s k   =   0 ,   b i d   =   0 ,   r e t v a l   =   0 ;  
 	 b o o l   e x i s t s   =   f a l s e ;  
  
 	 i f   ( A r r a y S i z e ( s y m b o l s )   = =   0 )  
 	 {  
 	 	 A r r a y R e s i z e ( s y m b o l s ,   1 ) ;  
 	 	 A r r a y R e s i z e ( z e r o _ s i d ,   1 ) ;  
 	 	 A r r a y R e s i z e ( m e m o r y A S K ,   1 ) ;  
 	 	 A r r a y R e s i z e ( m e m o r y B I D ,   1 ) ;  
  
 	 	 s y m b o l s [ 0 ]   =   _ S y m b o l ;  
 	 }  
  
 	 i f   ( t y p e   >   0   & &   s h i f t   >   0 )  
 	 {  
 	 	 c o l l e c t i n g _ t i c k s   =   t r u e ;  
 	 }  
  
 	 i f   ( c o l l e c t i n g _ t i c k s   = =   f a l s e )  
 	 {  
 	 	 i f   ( t y p e   >   0   & &   s h i f t   = =   0 )  
 	 	 {  
 	 	 	 / /   g o i n g   t o   g e t   t i c k s  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 r e t u r n   0 ;  
 	 	 }  
 	 }  
  
 	 i f   ( s y m b o l   = =   " " )   s y m b o l   =   _ S y m b o l ;  
  
 	 i f   ( t y p e   = =   0 )  
 	 {  
 	 	 e x i s t s   =   f a l s e ;  
 	 	 s i z e       =   A r r a y S i z e ( s y m b o l s ) ;  
  
 	 	 i f   ( s i z e   = =   0 )   { A r r a y R e s i z e ( s y m b o l s ,   1 ) ; }  
  
 	 	 f o r   ( i = 0 ;   i < s i z e ;   i + + )  
 	 	 {  
 	 	 	 i f   ( s y m b o l s [ i ]   = =   s y m b o l )  
 	 	 	 {  
 	 	 	 	 e x i s t s   =   t r u e ;  
 	 	 	 	 s i d         =   i ;  
 	 	 	 	 b r e a k ;  
 	 	 	 }  
 	 	 }  
  
 	 	 i f   ( e x i s t s   = =   f a l s e )  
 	 	 {  
 	 	 	 i n t   n e w s i z e   =   A r r a y S i z e ( s y m b o l s )   +   1 ;  
  
 	 	 	 A r r a y R e s i z e ( s y m b o l s ,   n e w s i z e ) ;  
 	 	 	 s y m b o l s [ n e w s i z e - 1 ]   =   s y m b o l ;  
  
 	 	 	 A r r a y R e s i z e ( z e r o _ s i d ,   n e w s i z e ) ;  
 	 	 	 A r r a y R e s i z e ( m e m o r y A S K ,   n e w s i z e ) ;  
 	 	 	 A r r a y R e s i z e ( m e m o r y B I D ,   n e w s i z e ) ;  
  
 	 	 	 s i d = n e w s i z e ;  
 	 	 }  
  
 	 	 i f   ( s i d   > =   0 )  
 	 	 {  
 	 	 	 a s k   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K ) ;  
 	 	 	 b i d   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D ) ;  
  
 	 	 	 i f   ( b i d   = =   0   & &   M Q L I n f o I n t e g e r ( M Q L _ T E S T E R ) )  
 	 	 	 {  
 	 	 	 	 P r i n t ( " T i c k s   d a t a   c o l l e c t o r   e r r o r :   "   +   s y m b o l   +   "   c a n n o t   b e   b a c k t e s t e d .   O n l y   t h e   c u r r e n t   s y m b o l   c a n   b e   b a c k t e s t e d .   T h e   E A   w i l l   b e   t e r m i n a t e d . " ) ;  
 	 	 	 	 E x p e r t R e m o v e ( ) ;  
 	 	 	 }  
  
 	 	 	 i f   (  
 	 	 	 	       s y m b o l   = =   _ S y m b o l  
 	 	 	 	 | |   a s k   ! =   m e m o r y A S K [ s i d ] [ 0 ]  
 	 	 	 	 | |   b i d   ! =   m e m o r y B I D [ s i d ] [ 0 ]  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 m e m o r y A S K [ s i d ] [ z e r o _ s i d [ s i d ] ]   =   a s k ;  
 	 	 	 	 m e m o r y B I D [ s i d ] [ z e r o _ s i d [ s i d ] ]   =   b i d ;  
 	 	 	 	 z e r o _ s i d [ s i d ]                                   =   z e r o _ s i d [ s i d ]   +   1 ;  
  
 	 	 	 	 i f   ( z e r o _ s i d [ s i d ]   = =   1 0 0 )  
 	 	 	 	 {  
 	 	 	 	 	 z e r o _ s i d [ s i d ]   =   0 ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 }  
 	 e l s e  
 	 {  
 	 	 i f   ( s h i f t   < =   0 )  
 	 	 {  
 	 	 	 i f   ( t y p e   = =   S Y M B O L _ A S K )  
 	 	 	 {  
 	 	 	 	 r e t u r n   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K ) ;  
 	 	 	 }  
 	 	 	 e l s e   i f   ( t y p e   = =   S Y M B O L _ B I D )  
 	 	 	 {  
 	 	 	 	 r e t u r n   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D ) ;    
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 d o u b l e   m i d   =   ( ( S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K )   +   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D ) )   /   2 ) ;  
  
 	 	 	 	 r e t u r n   m i d ;  
 	 	 	 }  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 s i z e   =   A r r a y S i z e ( s y m b o l s ) ;  
  
 	 	 	 f o r   ( i   =   0 ;   i   <   s i z e ;   i + + )  
 	 	 	 {  
 	 	 	 	 i f   ( s y m b o l s [ i ]   = =   s y m b o l )  
 	 	 	 	 {  
 	 	 	 	 	 s i d   =   i ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 i f   ( s h i f t   <   1 0 0 )  
 	 	 	 {  
 	 	 	 	 i d   =   z e r o _ s i d [ s i d ]   -   s h i f t   -   1 ;  
  
 	 	 	 	 i f ( i d   <   0 )   { i d   =   i d   +   1 0 0 ; }  
  
 	 	 	 	 i f   ( t y p e   = =   S Y M B O L _ A S K )  
 	 	 	 	 {  
 	 	 	 	 	 r e t v a l   =   m e m o r y A S K [ s i d ] [ i d ] ;  
  
 	 	 	 	 	 i f   ( r e t v a l   = =   0 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 r e t v a l   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K ) ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 	 e l s e   i f   ( t y p e   = =   S Y M B O L _ B I D )  
 	 	 	 	 {  
 	 	 	 	 	 r e t v a l   =   m e m o r y B I D [ s i d ] [ i d ] ;  
  
 	 	 	 	 	 i f   ( r e t v a l   = =   0 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 r e t v a l   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D ) ;  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 }  
  
 	 r e t u r n   r e t v a l ;  
 }  
  
 i n t   T i c k s P e r S e c o n d ( b o o l   g e t _ m a x   =   f a l s e ,   b o o l   s e t   =   f a l s e )  
 {  
 	 s t a t i c   d a t e t i m e   t i m e 0   =   0 ;  
 	 s t a t i c   i n t   t i c k s             =   0 ;  
 	 s t a t i c   i n t   t p s                 =   0 ;  
 	 s t a t i c   i n t   t p s m a x           =   0 ;  
  
 	 d a t e t i m e   t i m e 1   =   T i m e L o c a l ( ) ;  
  
 	 i f   ( s e t   = =   t r u e )  
 	 {  
 	 	 i f   ( t i m e 1   >   t i m e 0 )  
 	 	 {  
 	 	 	 i f   ( t i m e 1   -   t i m e 0   >   1 )  
 	 	 	 {  
 	 	 	 	 t p s   =   0 ;  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 t p s   =   t i c k s ;  
 	 	 	 }  
  
 	 	 	 t i m e 0   =   t i m e 1 ;  
 	 	 	 t i c k s   =   0 ;  
 	 	 }  
  
 	 	 t i c k s + + ;  
  
 	 	 i f   ( t p s   >   t p s m a x )   { t p s m a x   =   t p s ; }  
 	 }  
  
 	 i f   ( g e t _ m a x )  
 	 {  
 	 	 r e t u r n   t p s m a x ;  
 	 }  
  
 	 r e t u r n   t p s ;  
 }  
  
 d a t e t i m e   T i m e A t S t a r t ( s t r i n g   c m d   =   " s e r v e r " )  
 {  
 	 s t a t i c   d a t e t i m e   l o c a l     =   0 ;  
 	 s t a t i c   d a t e t i m e   s e r v e r   =   0 ;  
  
 	 i f   ( c m d   = =   " l o c a l " )  
 	 {  
 	 	 r e t u r n   l o c a l ;  
 	 }  
 	 e l s e   i f   ( c m d   = =   " s e r v e r " )  
 	 {  
 	 	 r e t u r n   s e r v e r ;  
 	 }  
 	 e l s e   i f   ( c m d   = =   " s e t " )  
 	 {  
 	 	 l o c a l     =   T i m e L o c a l ( ) ;  
 	 	 s e r v e r   =   T i m e C u r r e n t ( ) ;  
 	 }  
  
 	 r e t u r n   0 ;  
 }  
  
 d a t e t i m e   T i m e F r o m C o m p o n e n t s (  
 	 i n t   t i m e _ s r c   =   0 ,  
 	 i n t         y   =   0 ,  
 	 i n t         m   =   0 ,  
 	 d o u b l e   d   =   0 ,  
 	 d o u b l e   h   =   0 ,  
 	 d o u b l e   i   =   0 ,  
 	 i n t         s   =   0  
 )   {  
 	 M q l D a t e T i m e   t m ;  
  
 	           i f   ( t i m e _ s r c   = =   0 )   { T i m e C u r r e n t ( t m ) ; }  
 	 e l s e   i f   ( t i m e _ s r c   = =   1 )   { T i m e L o c a l ( t m ) ; }  
 	 e l s e   i f   ( t i m e _ s r c   = =   2 )   { T i m e G M T ( t m ) ; }  
  
 	 i f   ( y   >   0 )  
 	 {  
 	 	 i f   ( y   <   1 0 0 )   { y   =   2 0 0 0   +   y ; }  
 	 	 t m . y e a r   =   y ;  
 	 }  
 	 i f   ( m   >   0 )   { t m . m o n   =   m ; }  
 	 i f   ( d   >   0 )   { t m . d a y   =   ( i n t ) M a t h F l o o r ( d ) ; }  
  
 	 t m . h o u r   =   ( i n t ) ( M a t h F l o o r ( h )   +   ( 2 4   *   ( d   -   M a t h F l o o r ( d ) ) ) ) ;  
 	 t m . m i n     =   ( i n t ) ( M a t h F l o o r ( i )   +   ( 6 0   *   ( h   -   M a t h F l o o r ( h ) ) ) ) ;  
 	 t m . s e c     =   ( i n t ) ( ( d o u b l e ) s   +   ( 6 0   *   ( i   -   M a t h F l o o r ( i ) ) ) ) ;  
  
 	 r e t u r n   S t r u c t T o T i m e ( t m ) ;  
 }  
  
 b o o l   T r a d e S e l e c t B y I n d e x (  
 	 i n t   i n d e x ,  
 	 s t r i n g   g r o u p _ m o d e         =   " a l l " ,  
 	 s t r i n g   g r o u p                   =   " 0 " ,  
 	 s t r i n g   m a r k e t _ m o d e       =   " a l l " ,  
 	 s t r i n g   m a r k e t                 =   " " ,  
 	 s t r i n g   B u y s O r S e l l s       =   " b o t h "  
 )   {  
 	 i f   ( O r d e r S e l e c t ( ( i n t ) i n d e x ,   S E L E C T _ B Y _ P O S ,   M O D E _ T R A D E S )   & &   O r d e r T y p e ( )   <   2 )  
 	 {  
 	 	 i f   ( F i l t e r O r d e r B y (  
 	 	 	 g r o u p _ m o d e ,  
 	 	 	 g r o u p ,  
 	 	 	 m a r k e t _ m o d e ,  
 	 	 	 m a r k e t ,  
 	 	 	 B u y s O r S e l l s ,  
 	 	 	 " b o t h " ,  
 	 	 	 0 )  
 	 	 )   {  
 	 	 	 r e t u r n   t r u e ;  
 	 	 }  
 	 }  
  
 	 r e t u r n   f a l s e ;  
 }  
  
 b o o l   T r a d e S e l e c t B y T i c k e t ( u l o n g   t i c k e t )  
 {  
 	 i f   ( O r d e r S e l e c t ( ( i n t ) t i c k e t ,   S E L E C T _ B Y _ T I C K E T ,   M O D E _ T R A D E S )   & &   O r d e r T y p e ( )   <   2 )  
 	 {  
 	 	 r e t u r n   t r u e ;  
 	 }  
  
 	 r e t u r n   f a l s e ;  
 }  
  
 i n t   T r a d e s T o t a l ( )  
 {  
 	 r e t u r n   O r d e r s T o t a l ( ) ;  
 }  
  
 v o i d   U p d a t e E v e n t V a l u e s ( s t r i n g   e _ r e a s o n   =   " " , s t r i n g   e _ d e t a i l   =   " " )  
 {  
 	 O n T r a d e Q u e u e ( 1 ) ;  
 	 e _ R e a s o n               ( t r u e ,   e _ r e a s o n ) ;  
 	 e _ R e a s o n D e t a i l   ( t r u e ,   e _ d e t a i l ) ;  
  
 	 e _ a t t r C l o s e P r i c e     ( t r u e ,   O r d e r C l o s e P r i c e ( ) ) ;  
 	 e _ a t t r C l o s e T i m e       ( t r u e ,   O r d e r C l o s e T i m e ( ) ) ;  
 	 e _ a t t r C o m m e n t           ( t r u e ,   O r d e r C o m m e n t ( ) ) ;  
 	 e _ a t t r C o m m i s s i o n     ( t r u e ,   O r d e r C o m m i s s i o n ( ) ) ;  
 	 e _ a t t r E x p i r a t i o n     ( t r u e ,   O r d e r E x p i r a t i o n ( ) ) ;  
 	 e _ a t t r L o t s                 ( t r u e ,   O r d e r L o t s ( ) ) ;  
 	 e _ a t t r M a g i c N u m b e r   ( t r u e ,   O r d e r M a g i c N u m b e r ( ) ) ;  
 	 e _ a t t r O p e n P r i c e       ( t r u e ,   O r d e r O p e n P r i c e ( ) ) ;  
 	 e _ a t t r O p e n T i m e         ( t r u e ,   O r d e r O p e n T i m e ( ) ) ;  
 	 e _ a t t r P r o f i t             ( t r u e ,   O r d e r P r o f i t ( ) ) ;  
 	 e _ a t t r S t o p L o s s         ( t r u e ,   a t t r S t o p L o s s ( ) ) ;  
 	 e _ a t t r S w a p                 ( t r u e ,   O r d e r S w a p ( ) ) ;  
 	 e _ a t t r S y m b o l             ( t r u e ,   O r d e r S y m b o l ( ) ) ;  
 	 e _ a t t r T a k e P r o f i t     ( t r u e ,   a t t r T a k e P r o f i t ( ) ) ;  
 	 e _ a t t r T i c k e t             ( t r u e ,   O r d e r T i c k e t ( ) ) ;  
 	 e _ a t t r T y p e                 ( t r u e ,   O r d e r T y p e ( ) ) ;  
 }  
  
 d o u b l e   V i r t u a l S t o p s D r i v e r (  
 	 s t r i n g   c o m m a n d   =   " " ,  
 	 u l o n g   t i               =   0 ,  
 	 d o u b l e   s l             =   0 ,  
 	 d o u b l e   t p             =   0 ,  
 	 d o u b l e   s l p           =   0 ,  
 	 d o u b l e   t p p           =   0  
 )  
 {  
 	 s t a t i c   b o o l   i n i t i a l i z e d           =   f a l s e ;  
 	 s t a t i c   s t r i n g   n a m e                     =   " " ;  
 	 s t a t i c   s t r i n g   l o o p _ n a m e [ 2 ]     =   { " s l " ,   " t p " } ;  
 	 s t a t i c   c o l o r     l o o p _ c o l o r [ 2 ]   =   { D e e p P i n k ,   D o d g e r B l u e } ;  
 	 s t a t i c   d o u b l e   l o o p _ p r i c e [ 2 ]   =   { 0 ,   0 } ;  
 	 s t a t i c   u l o n g   m e m _ t o _ t i [ ] ;   / /   t i c k e t s  
 	 s t a t i c   i n t   m e m _ t o [ ] ;             / /   t i m e o u t s  
 	 s t a t i c   b o o l   t r a d e _ p a s s   =   f a l s e ;  
 	 i n t   i   =   0 ;  
  
 	 / /   A r e   V i r t u a l   S t o p s   e v e n   e n a b l e d ?  
 	 i f   ( ! U S E _ V I R T U A L _ S T O P S )  
 	 {  
 	 	 r e t u r n   0 ;  
 	 }  
 	  
 	 i f   ( i n i t i a l i z e d   = =   f a l s e   | |   c o m m a n d   = =   " i n i t i a l i z e " )  
 	 {  
 	 	 i n i t i a l i z e d   =   t r u e ;  
 	 }  
  
 	 / /   L i s t e n  
 	 i f   ( c o m m a n d   = =   " "   | |   c o m m a n d   = =   " l i s t e n " )  
 	 {  
 	 	 i n t   t o t a l           =   O b j e c t s T o t a l ( 0 ,   - 1 ,   O B J _ H L I N E ) ;  
 	 	 i n t   l e n g t h         =   0 ;  
 	 	 c o l o r   c l r           =   c l r N O N E ;  
 	 	 i n t   s l t p             =   0 ;  
 	 	 u l o n g   t i c k e t     =   0 ;  
 	 	 d o u b l e   l e v e l     =   0 ;  
 	 	 d o u b l e   a s k b i d   =   0 ;  
 	 	 i n t   p o l a r i t y     =   0 ;  
 	 	 s t r i n g   s y m b o l   =   " " ;  
  
 	 	 f o r   ( i   =   t o t a l   -   1 ;   i   > =   0 ;   i - - )  
 	 	 {  
 	 	 	 n a m e   =   O b j e c t N a m e ( 0 ,   i ,   - 1 ,   O B J _ H L I N E ) ;   / /   f o r   e x a m p l e :   # 1   s l  
  
 	 	 	 i f   ( S t r i n g S u b s t r ( n a m e ,   0 ,   1 )   ! =   " # " )  
 	 	 	 {  
 	 	 	 	 c o n t i n u e ;  
 	 	 	 }  
  
 	 	 	 l e n g t h   =   S t r i n g L e n ( n a m e ) ;  
  
 	 	 	 i f   ( l e n g t h   <   5 )  
 	 	 	 {  
 	 	 	 	 c o n t i n u e ;  
 	 	 	 }  
  
 	 	 	 c l r   =   ( c o l o r ) O b j e c t G e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ) ;  
  
 	 	 	 i f   ( c l r   ! =   l o o p _ c o l o r [ 0 ]   & &   c l r   ! =   l o o p _ c o l o r [ 1 ] )  
 	 	 	 {  
 	 	 	 	 c o n t i n u e ;  
 	 	 	 }  
  
 	 	 	 s t r i n g   l a s t _ s y m b o l s   =   S t r i n g S u b s t r ( n a m e ,   l e n g t h - 2 ,   2 ) ;  
  
 	 	 	 i f   ( l a s t _ s y m b o l s   = =   " s l " )  
 	 	 	 {  
 	 	 	 	 s l t p   =   - 1 ;  
 	 	 	 }  
 	 	 	 e l s e   i f   ( l a s t _ s y m b o l s   = =   " t p " )  
 	 	 	 {  
 	 	 	 	 s l t p   =   1 ;  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 c o n t i n u e ; 	  
 	 	 	 }  
  
 	 	 	 u l o n g   t i c k e t 0   =   S t r i n g T o I n t e g e r ( S t r i n g S u b s t r ( n a m e ,   1 ,   l e n g t h   -   4 ) ) ;  
  
 	 	 	 / /   p r e v e n t   l o a d i n g   t h e   s a m e   t i c k e t   n u m b e r   t w i c e   i n   a   r o w  
 	 	 	 i f   ( t i c k e t 0   ! =   t i c k e t )  
 	 	 	 {  
 	 	 	 	 t i c k e t   =   t i c k e t 0 ;  
  
 	 	 	 	 i f   ( T r a d e S e l e c t B y T i c k e t ( t i c k e t ) )  
 	 	 	 	 {  
 	 	 	 	 	 s y m b o l           =   O r d e r S y m b o l ( ) ;  
 	 	 	 	 	 p o l a r i t y       =   ( O r d e r T y p e ( )   = =   0 )   ?   1   :   - 1 ;  
 	 	 	 	 	 a s k b i d       =   ( O r d e r T y p e ( )   = =   0 )   ?   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ B I D )   :   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ A S K ) ;  
 	 	 	 	 	  
 	 	 	 	 	 t r a d e _ p a s s   =   t r u e ;  
 	 	 	 	 }  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 t r a d e _ p a s s   =   f a l s e ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 i f   ( t r a d e _ p a s s )  
 	 	 	 {  
 	 	 	 	 l e v e l         =   O b j e c t G e t D o u b l e ( 0 ,   n a m e ,   O B J P R O P _ P R I C E ,   0 ) ;  
  
 	 	 	 	 i f   ( l e v e l   >   0 )  
 	 	 	 	 {  
 	 	 	 	 	 / /   p o l a r i z e   l e v e l s  
 	 	 	 	 	 d o u b l e   l e v e l _ p     =   p o l a r i t y   *   l e v e l ;  
 	 	 	 	 	 d o u b l e   a s k b i d _ p   =   p o l a r i t y   *   a s k b i d ;  
  
 	 	 	 	 	 i f   (  
 	 	 	 	 	 	       ( s l t p   = =   - 1   & &   ( l e v e l _ p   -   a s k b i d _ p )   > =   0 )   / /   s l  
 	 	 	 	 	 	 | |   ( s l t p   = =   1   & &   ( a s k b i d _ p   -   l e v e l _ p )   > =   0 )     / /   t p  
 	 	 	 	 	 )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 / / - -   V i r t u a l   S t o p s   S L   T i m e o u t  
 	 	 	 	 	 	 i f   (  
 	 	 	 	 	 	 	       ( V I R T U A L _ S T O P S _ T I M E O U T   >   0 )  
 	 	 	 	 	 	 	 & &   ( s l t p   = =   - 1   & &   ( l e v e l _ p   -   a s k b i d _ p )   > =   0 )   / /   s l  
 	 	 	 	 	 	 )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 / /   s t a r t   t i m e o u t ?  
 	 	 	 	 	 	 	 i n t   i n d e x   =   A r r a y S e a r c h ( m e m _ t o _ t i ,   t i c k e t ) ;  
  
 	 	 	 	 	 	 	 i f   ( i n d e x   <   0 )  
 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 i n t   s i z e   =   A r r a y S i z e ( m e m _ t o _ t i ) ;  
 	 	 	 	 	 	 	 	 A r r a y R e s i z e ( m e m _ t o _ t i ,   s i z e + 1 ) ;  
 	 	 	 	 	 	 	 	 A r r a y R e s i z e ( m e m _ t o ,   s i z e + 1 ) ;  
 	 	 	 	 	 	 	 	 m e m _ t o _ t i [ s i z e ]   =   t i c k e t ;  
 	 	 	 	 	 	 	 	 m e m _ t o [ s i z e ]         =   ( i n t ) T i m e L o c a l ( ) ;  
  
 	 	 	 	 	 	 	 	 P r i n t (  
 	 	 	 	 	 	 	 	 	 " # " ,  
 	 	 	 	 	 	 	 	 	 t i c k e t ,  
 	 	 	 	 	 	 	 	 	 "   t i m e o u t   o f   " ,  
 	 	 	 	 	 	 	 	 	 V I R T U A L _ S T O P S _ T I M E O U T ,  
 	 	 	 	 	 	 	 	 	 "   s e c o n d s   s t a r t e d "  
 	 	 	 	 	 	 	 	 ) ;  
  
 	 	 	 	 	 	 	 	 r e t u r n   0 ;  
 	 	 	 	 	 	 	 }  
 	 	 	 	 	 	 	 e l s e  
 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 i f   ( T i m e L o c a l ( )   -   m e m _ t o [ i n d e x ]   < =   V I R T U A L _ S T O P S _ T I M E O U T )  
 	 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 	 r e t u r n   0 ;  
 	 	 	 	 	 	 	 	 }  
 	 	 	 	 	 	 	 }  
 	 	 	 	 	 	 }  
  
 	 	 	 	 	 	 i f   ( C l o s e T r a d e ( t i c k e t ) )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 / /   c h e c k   t h i s   b e f o r e   d e l e t i n g   t h e   l i n e s  
 	 	 	 	 	 	 	 / / O n T r a d e L i s t e n e r ( ) ;  
  
 	 	 	 	 	 	 	 / /   d e l e t e   o b j e c t s  
 	 	 	 	 	 	 	 O b j e c t D e l e t e ( 0 ,   " # "   +   ( s t r i n g ) t i c k e t   +   "   s l " ) ;  
 	 	 	 	 	 	 	 O b j e c t D e l e t e ( 0 ,   " # "   +   ( s t r i n g ) t i c k e t   +   "   t p " ) ;  
 	 	 	 	 	 	 }  
 	 	 	 	 	 }  
 	 	 	 	 	 e l s e  
 	 	 	 	 	 {  
 	 	 	 	 	 	 i f   ( V I R T U A L _ S T O P S _ T I M E O U T   >   0 )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 i   =   A r r a y S e a r c h ( m e m _ t o _ t i ,   t i c k e t ) ;  
  
 	 	 	 	 	 	 	 i f   ( i   > =   0 )  
 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 A r r a y S t r i p K e y ( m e m _ t o _ t i ,   i ) ;  
 	 	 	 	 	 	 	 	 A r r a y S t r i p K e y ( m e m _ t o ,   i ) ;  
 	 	 	 	 	 	 	 }  
 	 	 	 	 	 	 }  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 e l s e   i f   (  
 	 	 	 	 	 ! P e n d i n g O r d e r S e l e c t B y T i c k e t ( t i c k e t )  
 	 	 	 	 | |   O r d e r C l o s e T i m e ( )   >   0   / /   i n   c a s e   t h e   o r d e r   h a s   b e e n   c l o s e d  
 	 	 	 )  
 	 	 	 {  
 	 	 	 	 O b j e c t D e l e t e ( 0 ,   n a m e ) ;  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 P e n d i n g O r d e r S e l e c t B y T i c k e t ( t i c k e t ) ;  
 	 	 	 }  
 	 	 }  
 	 }  
 	 / /   G e t   S L   o r   T P  
 	 e l s e   i f   (  
 	 	 t i   >   0  
 	 	 & &   (  
 	 	 	       c o m m a n d   = =   " g e t   s l "  
 	 	 	 | |   c o m m a n d   = =   " g e t   t p "  
 	 	 )  
 	 )  
 	 {  
 	 	 d o u b l e   v a l u e   =   0 ;  
  
 	 	 n a m e   =   " # "   +   I n t e g e r T o S t r i n g ( t i )   +   "   "   +   S t r i n g S u b s t r ( c o m m a n d ,   4 ,   2 ) ;  
  
 	 	 i f   ( O b j e c t F i n d ( 0 ,   n a m e )   >   - 1 )  
 	 	 {  
 	 	 	 v a l u e   =   O b j e c t G e t D o u b l e ( 0 ,   n a m e ,   O B J P R O P _ P R I C E ,   0 ) ;  
 	 	 }  
  
 	 	 r e t u r n   v a l u e ;  
 	 }  
 	 / /   S e t   S L   a n d   T P  
 	 e l s e   i f   (  
 	 	 t i   >   0  
 	 	 & &   (  
 	 	 	       c o m m a n d   = =   " s e t "  
 	 	 	 | |   c o m m a n d   = =   " m o d i f y "  
 	 	 	 | |   c o m m a n d   = =   " c l e a r "  
 	 	 	 | |   c o m m a n d   = =   " p a r t i a l "  
 	 	 )  
 	 )  
 	 {  
 	 	 l o o p _ p r i c e [ 0 ]   =   s l ;  
 	 	 l o o p _ p r i c e [ 1 ]   =   t p ;  
  
 	 	 f o r   ( i   =   0 ;   i   <   2 ;   i + + )  
 	 	 {  
 	 	 	 n a m e   =   " # "   +   I n t e g e r T o S t r i n g ( t i )   +   "   "   +   l o o p _ n a m e [ i ] ;  
 	 	 	  
 	 	 	 i f   ( l o o p _ p r i c e [ i ]   >   0 )  
 	 	 	 {  
 	 	 	 	 / /   1 )   c r e a t e   a   n e w   l i n e  
 	 	 	 	 i f   ( O b j e c t F i n d ( 0 ,   n a m e )   = =   - 1 )  
 	 	 	 	 {  
 	 	 	 	 	 	   O b j e c t C r e a t e ( 0 ,   n a m e ,   O B J _ H L I N E ,   0 ,   0 ,   l o o p _ p r i c e [ i ] ) ;  
 	 	 	 	 	 O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ W I D T H ,   1 ) ;  
 	 	 	 	 	 O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ C O L O R ,   l o o p _ c o l o r [ i ] ) ;  
 	 	 	 	 	 O b j e c t S e t I n t e g e r ( 0 ,   n a m e ,   O B J P R O P _ S T Y L E ,   S T Y L E _ D O T ) ;  
 	 	 	 	 	 O b j e c t S e t S t r i n g ( 0 ,   n a m e ,   O B J P R O P _ T E X T ,   n a m e   +   "   ( v i r t u a l ) " ) ;  
 	 	 	 	 }  
 	 	 	 	 / /   2 )   m o d i f y   e x i s t i n g   l i n e  
 	 	 	 	 e l s e  
 	 	 	 	 {  
 	 	 	 	 	 O b j e c t S e t D o u b l e ( 0 ,   n a m e ,   O B J P R O P _ P R I C E ,   0 ,   l o o p _ p r i c e [ i ] ) ;  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 / /   3 )   d e l e t e   e x i s t i n g   l i n e  
 	 	 	 	 O b j e c t D e l e t e ( 0 ,   n a m e ) ;  
 	 	 	 }  
 	 	 }  
  
 	 	 / /   p r i n t   m e s s a g e  
 	 	 i f   ( c o m m a n d   = =   " s e t "   | |   c o m m a n d   = =   " m o d i f y " )  
 	 	 {  
 	 	 	 P r i n t (  
 	 	 	 	 c o m m a n d ,  
 	 	 	 	 "   # " ,  
 	 	 	 	 I n t e g e r T o S t r i n g ( t i ) ,  
 	 	 	 	 " :   v i r t u a l   s l   " ,  
 	 	 	 	 D o u b l e T o S t r ( s l ,   ( i n t ) S y m b o l I n f o I n t e g e r ( S y m b o l ( ) , S Y M B O L _ D I G I T S ) ) ,  
 	 	 	 	 "   t p   " ,  
 	 	 	 	 D o u b l e T o S t r ( t p , ( i n t ) S y m b o l I n f o I n t e g e r ( S y m b o l ( ) , S Y M B O L _ D I G I T S ) )  
 	 	 	 ) ;  
 	 	 }  
  
 	 	 r e t u r n   1 ;  
 	 }  
  
 	 r e t u r n   1 ;  
 }  
  
 v o i d   W a i t T r a d e C o n t e x t I f B u s y ( )  
 {  
 	 i f ( I s T r a d e C o n t e x t B u s y ( ) )   {  
             w h i l e ( t r u e )  
             {  
                   S l e e p ( 1 ) ;  
                   i f ( ! I s T r a d e C o n t e x t B u s y ( ) )   {  
                         R e f r e s h R a t e s ( ) ;  
                         b r e a k ;  
                   }  
             }  
       }  
       r e t u r n ;  
 }  
  
 d o u b l e   a t t r S t o p L o s s ( )  
 {  
 	 i f   ( U S E _ V I R T U A L _ S T O P S )  
 	 {  
 	 	 r e t u r n   V i r t u a l S t o p s D r i v e r ( " g e t   s l " ,   O r d e r T i c k e t ( ) ) ;  
 	 }  
  
 	 r e t u r n   O r d e r S t o p L o s s ( ) ;  
 }  
  
 d o u b l e   a t t r T a k e P r o f i t ( )  
 {  
 	 i f   ( U S E _ V I R T U A L _ S T O P S )  
 	 {  
 	 	 r e t u r n   V i r t u a l S t o p s D r i v e r ( " g e t   t p " ,   O r d e r T i c k e t ( ) ) ;  
 	 }  
  
       r e t u r n   O r d e r T a k e P r o f i t ( ) ;  
 }  
  
 s t r i n g   e _ R e a s o n ( b o o l   s e t = f a l s e ,   s t r i n g   i n p = " " )   {  
       s t a t i c   s t r i n g   m e m [ ] ;  
       i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ;  
       i f ( s e t = = t r u e ) {  
             A r r a y R e s i z e ( m e m , q u e u e + 1 ) ;  
             m e m [ q u e u e ] = i n p ;  
       }  
       r e t u r n ( m e m [ q u e u e ] ) ;  
 }  
  
 s t r i n g   e _ R e a s o n D e t a i l ( b o o l   s e t = f a l s e ,   s t r i n g   i n p = " " )   { s t a t i c   s t r i n g   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 d o u b l e   e _ a t t r C l o s e P r i c e ( b o o l   s e t = f a l s e ,   d o u b l e   i n p = - 1 )   { s t a t i c   d o u b l e   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 d a t e t i m e   e _ a t t r C l o s e T i m e ( b o o l   s e t = f a l s e ,   d a t e t i m e   i n p = - 1 )   { s t a t i c   d a t e t i m e   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 s t r i n g   e _ a t t r C o m m e n t ( b o o l   s e t = f a l s e ,   s t r i n g   i n p = " " )   { s t a t i c   s t r i n g   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 d o u b l e   e _ a t t r C o m m i s s i o n ( b o o l   s e t = f a l s e ,   d o u b l e   i n p = 0 )   { s t a t i c   d o u b l e   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 d a t e t i m e   e _ a t t r E x p i r a t i o n ( b o o l   s e t = f a l s e ,   d a t e t i m e   i n p = 0 )   { s t a t i c   d a t e t i m e   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 d o u b l e   e _ a t t r L o t s ( b o o l   s e t = f a l s e ,   d o u b l e   i n p = - 1 )   { s t a t i c   d o u b l e   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 i n t   e _ a t t r M a g i c N u m b e r ( b o o l   s e t = f a l s e ,   i n t   i n p = - 1 )   { s t a t i c   i n t   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 d o u b l e   e _ a t t r O p e n P r i c e ( b o o l   s e t = f a l s e ,   d o u b l e   i n p = - 1 )   { s t a t i c   d o u b l e   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 d a t e t i m e   e _ a t t r O p e n T i m e ( b o o l   s e t = f a l s e ,   d a t e t i m e   i n p = - 1 )   { s t a t i c   d a t e t i m e   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 d o u b l e   e _ a t t r P r o f i t ( b o o l   s e t = f a l s e ,   d o u b l e   i n p = 0 )   { s t a t i c   d o u b l e   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 d o u b l e   e _ a t t r S t o p L o s s ( b o o l   s e t = f a l s e ,   d o u b l e   i n p = - 1 )   { s t a t i c   d o u b l e   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 d o u b l e   e _ a t t r S w a p ( b o o l   s e t = f a l s e ,   d o u b l e   i n p = 0 )   { s t a t i c   d o u b l e   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 s t r i n g   e _ a t t r S y m b o l ( b o o l   s e t = f a l s e ,   s t r i n g   i n p = " " )   { s t a t i c   s t r i n g   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 d o u b l e   e _ a t t r T a k e P r o f i t ( b o o l   s e t = f a l s e ,   d o u b l e   i n p = - 1 )   { s t a t i c   d o u b l e   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 i n t   e _ a t t r T i c k e t ( b o o l   s e t = f a l s e ,   i n t   i n p = - 1 )   { s t a t i c   i n t   m e m [ ] ; i n t   q u e u e = O n T r a d e Q u e u e ( ) - 1 ; i f ( s e t = = t r u e ) { A r r a y R e s i z e ( m e m , q u e u e + 1 ) ; m e m [ q u e u e ] = i n p ; } r e t u r n ( m e m [ q u e u e ] ) ; }  
  
 i n t   e _ a t t r T y p e ( b o o l   s e t = f a l s e ,   i n t   i n p = - 1 )  
 {  
 	 s t a t i c   i n t   m e m [ ] ;  
 	 i n t   q u e u e   =   O n T r a d e Q u e u e ( ) - 1 ;  
  
 	 i f   ( s e t   = =   t r u e )  
 	 {  
 	 	 A r r a y R e s i z e ( m e m , q u e u e + 1 ) ;  
 	 	 m e m [ q u e u e ]   =   i n p ;  
 	 }  
 	  
 	 r e t u r n   m e m [ q u e u e ] ;  
 }  
  
 i n t   i C a n d l e I D ( s t r i n g   S Y M B O L ,   E N U M _ T I M E F R A M E S   T I M E F R A M E ,   d a t e t i m e   t i m e _ s t a m p )  
 {  
       b o o l   T i m e S t a m p P r e v D a y S h i f t   =   t r u e ;  
       i n t   C a n d l e I D   =   0 ;  
       / / = =   c a l c u l a t e   c a n d l e   I D  
       / / - -   g e t   t h e   t i m e   r e s o l u t i o n   o f   t h e   d e s i r e d   p e r i o d ,   i n   m i n u t e s  
       i n t   m i n s _ t f   =   T I M E F R A M E ;  
       i n t   m i n s _ t f 0   =   0 ;  
       i f   ( T I M E F R A M E   = =   P E R I O D _ C U R R E N T )  
       {  
             m i n s _ t f   =   ( i n t ) P e r i o d S e c o n d s ( P E R I O D _ C U R R E N T )   /   6 0 ;  
       }  
        
       / / - -   g e t   t h e   d i f f e r e n c e   b e t w e e n   n o w   a n d   t h e   t i m e   w e   w a n t ,   i n   m i n u t e s  
       / / i n t   t i m e _ s t a m p   =   S t r T o T i m e ( T i m e S t a m p ) ;  
       i n t   d a y s _ a d j u s t   =   0 ;  
       i f   ( T i m e S t a m p P r e v D a y S h i f t )  
       {  
             / / - -   a u t o m a t i c a l l y   s h i f t   t o   t h e   p r e v i o u s   d a y  
             i f   ( t i m e _ s t a m p   >   T i m e C u r r e n t ( ) )  
             {  
                   t i m e _ s t a m p   =   t i m e _ s t a m p   -   8 6 4 0 0 ;  
             }  
             / / - -   a l s o   s h i f t   w e e k d a y s  
             w h i l e   ( t r u e )  
             {  
                   i n t   d o w   =   T i m e D a y O f W e e k ( t i m e _ s t a m p ) ;  
                    
                   i f   ( d o w   >   0   & &   d o w   <   6 )   { b r e a k ; }  
                   t i m e _ s t a m p   =   t i m e _ s t a m p   -   8 6 4 0 0 ;  
                   d a y s _ a d j u s t + + ;  
             }  
       }  
        
       i n t   m i n s _ d i f f   =   ( i n t ) ( T i m e C u r r e n t ( )   -   t i m e _ s t a m p ) ;  
       m i n s _ d i f f   =   m i n s _ d i f f   -   d a y s _ a d j u s t * 8 6 4 0 0 ;  
       m i n s _ d i f f   =   m i n s _ d i f f   /   6 0 ;  
        
       / / - -   t h e   d i f f e r e n c e   i s   n e g a t i v e   = >   q u i t   h e r e  
       i f   ( m i n s _ d i f f   <   0 )   { r e t u r n   ( i n t ) E M P T Y _ V A L U E ; }  
        
       / / - -   n o w   c a l c u l a t e   t h e   c a n d l e   I D ,   i t   i s   r e l a t i v e   t o   t h e   c u r r e n t   t i m e  
       i f   ( m i n s _ d i f f   >   0 )   {  
             C a n d l e I D   =   ( i n t ) M a t h C e i l ( ( d o u b l e ) m i n s _ d i f f / ( d o u b l e ) m i n s _ t f ) ;  
       }  
       / / P r i n t ( T i m e T o S t r ( T i m e C u r r e n t ( ) ) + "   " + T i m e T o S t r ( t i m e _ s t a m p )   + "   : : :   "   +   m i n s _ t f   +   "   "   +   d a y s _ a d j u s t   +   "   "   +   ( d a y s _ a d j u s t * 1 4 4 0 / m i n s _ t f )   +   "   "   +   C a n d l e I D ) ;  
        
        
       / / - -   n o w ,   a f t e r   a l l   t h e   s h i f t i n g   a n d   i n   c a s e   o f   m i s s i n g   c a n d l e s ,   t h e   c a l c u l a t e d   c a n d l e   i d   c a n   b e   f e w   c a n d l e s   e a r l y  
       / /   s o   w e   w i l l   s e a r c h   f o r   t h e   r i g h t   c a n d l e  
       w h i l e ( t r u e )  
       {  
             i f   ( i T i m e ( S Y M B O L ,   T I M E F R A M E ,   C a n d l e I D )   > =   t i m e _ s t a m p )   { b r e a k ; }  
              
             C a n d l e I D - - ;  
 	 	  
 	 	 i f   ( C a n d l e I D   < =   0 )   { C a n d l e I D   =   0 ;   b r e a k ; }  
       }  
        
       r e t u r n   C a n d l e I D ;  
        
       / *  
       / /   t h i s   m e t h o d   d o e s   t h e   s a m e ,   b u t   i t   i s   s l o w e r  
        
       i f   ( 0 )  
       {  
             C a n d l e I D   =   0 ;  
             d a t e t i m e   t   =   S t r T o T i m e ( T i m e S t a m p ) ;  
             d a t e t i m e   n o w   =   T i m e C u r r e n t ( ) ;  
             d a t e t i m e   c t i m e ;  
             w h i l e ( t r u e )  
             {  
                   c t i m e   =   i T i m e ( S Y M B O L ,   T I M E F R A M E ,   C a n d l e I D ) ;  
                   / /  
                   i f   ( c t i m e   <   t )  
                   {  
                         / / - -   i f   t h e   t i m e   i s   s t i l l   i n   t h e   f u t u r e ,   w e   w i l l   s h i f t   t o   a   p r e v i o u s   d a y  
                         i f   ( t   >   n o w )  
                         {  
                               i f   ( T i m e S t a m p P r e v D a y S h i f t )  
                               {  
                                     / / - -   s h i f t   t o   t h e   l a s t   d a y   t h a t   i s   n o t   s a t / s u n  
                                     w h i l e ( t r u e )  
                                     {  
                                           t   =   t   -   8 6 4 0 0 ;  
                                           i n t   d o w   =   T i m e D a y O f W e e k ( t ) ;  
                                           i f   ( d o w   >   0   & &   d o w   <   6 )   { b r e a k ; }  
                                     }  
                                     c o n t i n u e ;  
                               }  
                               r e t u r n   E M P T Y _ V A L U E ;  
                         }  
                         b r e a k ;  
                   }  
                   C a n d l e I D + + ;  
             }  
       }  
        
       * /  
 }  
  
 d o u b l e   t o D i g i t s ( d o u b l e   p i p s ,   s t r i n g   s y m b o l )  
 {  
 	 i f   ( s y m b o l   = =   " " )   s y m b o l   =   S y m b o l ( ) ;  
  
 	 i n t   d i g i t s       =   ( i n t ) S y m b o l I n f o I n t e g e r ( s y m b o l ,   S Y M B O L _ D I G I T S ) ;  
 	 d o u b l e   p o i n t   =   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ P O I N T ) ;  
  
 	 r e t u r n   N o r m a l i z e D o u b l e ( p i p s   *   P i p V a l u e ( s y m b o l )   *   p o i n t ,   d i g i t s ) ;  
 }  
  
 d o u b l e   t o P i p s ( d o u b l e   d i g i t s ,   s t r i n g   s y m b o l )  
 {  
 	 i f   ( s y m b o l   = =   " " )   s y m b o l   =   S y m b o l ( ) ;  
  
       r e t u r n   d i g i t s   /   ( P i p V a l u e ( s y m b o l )   *   S y m b o l I n f o D o u b l e ( s y m b o l ,   S Y M B O L _ P O I N T ) ) ;  
 }  
  
  
  
  
  
  
 c l a s s   F x d W a i t i n g  
 {  
 	 p r i v a t e :  
 	 	 i n t   b e g i n n i n g _ i d ;  
 	 	 u s h o r t   b a n k     [ ] [ 2 ] [ 2 0 ] ;   / /   2   b a n k s ,   2 0   p o s s i b l e   p a r a l l e l   w a i t i n g   b l o c k s   p e r   c h a i n   o f   b l o c k s  
 	 	 u s h o r t   s t a t e   [ ] [ 2 ] ;           / /   s e c o n d   d i m e n t i o n   v a l u e s :   0   -   c o u n t   o f   t h e   b l o c k s   p u t   o n   h o l d ,   1   -   c u r r e n t   b a n k   i d  
  
 	 p u b l i c :  
 	 	 v o i d   I n i t i a l i z e ( i n t   c o u n t )  
 	 	 {  
 	 	 	 A r r a y R e s i z e ( b a n k ,   c o u n t ) ;  
 	 	 	 A r r a y R e s i z e ( s t a t e ,   c o u n t ) ;  
 	 	 }  
  
 	 	 b o o l   R u n ( i n t   i d   =   0 )  
 	 	 {  
 	 	 	 b e g i n n i n g _ i d   =   i d ;  
  
 	 	 	 i n t   r a n g e   =   A r r a y R a n g e ( s t a t e ,   0 ) ;  
 	 	 	 i f   ( r a n g e   <   i d + 1 )   {  
 	 	 	 	 A r r a y R e s i z e ( b a n k ,   i d + 1 ) ;  
 	 	 	 	 A r r a y R e s i z e ( s t a t e ,   i d + 1 ) ;  
  
 	 	 	 	 / /   s e t   v a l u e s   t o   0 ,   o t h e r w i s e   t h e y   h a v e   r a n d o m   v a l u e s  
 	 	 	 	 f o r   ( i n t   i i   =   r a n g e ;   i i   <   i d + 1 ;   i i + + )  
 	 	 	 	 {  
 	 	 	 	       s t a t e [ i i ] [ 0 ]   =   0 ;  
 	 	 	 	       s t a t e [ i i ] [ 1 ]   =   0 ;  
 	 	 	 	 }  
 	 	 	 }  
  
 	 	 	 / /   a r e   t h e r e   b l o c k s   p u t   o n   h o l d ?  
 	 	 	 i n t   c o u n t   =   s t a t e [ i d ] [ 0 ] ;  
 	 	 	 i n t   b a n k _ i d   =   s t a t e [ i d ] [ 1 ] ;  
  
 	 	 	 / /   i f   n o   b l o c k   a r e   p u t   o n   h o l d   - >   e s c a p e  
 	 	 	 i f   ( c o u n t   = =   0 )   { r e t u r n   f a l s e ; }  
 	 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 s t a t e [ i d ] [ 0 ]   =   0 ;   / /   n u l l   t h e   c o u n t  
 	 	 	 	 s t a t e [ i d ] [ 1 ]   =   ( b a n k _ i d )   ?   0   :   1 ;   / /   s w i t c h   t o   t h e   o t h e r   b a n k  
 	 	 	 }  
  
 	 	 	 / / = =   n o w   w e   w i l l   r u n   t h e   b l o c k s   p u t   o n   h o l d  
  
 	 	 	 f o r   ( i n t   i   =   0 ;   i   <   c o u n t ;   i + + )  
 	 	 	 {  
 	 	 	 	 i n t   b l o c k _ t o _ r u n   =   b a n k [ i d ] [ b a n k _ i d ] [ i ] ;  
 	 	 	 	 _ b l o c k s _ [ b l o c k _ t o _ r u n ] . r u n ( ) ;  
 	 	 	 }  
  
 	 	 	 r e t u r n   t r u e ;  
 	 	 }  
  
 	 	 v o i d   A c c u m u l a t e ( i n t   b l o c k _ i d   =   0 )  
 	 	 {  
 	 	 	 i n t   c o u n t       =   + + s t a t e [ b e g i n n i n g _ i d ] [ 0 ] ;  
 	 	 	 i n t   b a n k _ i d   =   s t a t e [ b e g i n n i n g _ i d ] [ 1 ] ;  
  
 	 	 	 b a n k [ b e g i n n i n g _ i d ] [ b a n k _ i d ] [ c o u n t - 1 ]   =   ( u s h o r t ) b l o c k _ i d ;  
 	 	 }  
 } ;  
 F x d W a i t i n g   f x d W a i t ;  
  
  
  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
 / / |   E N D                                                                                                                             |  
 / / |   C r e a t e d   w i t h   f x D r e e m a   E A   B u i l d e r                       h t t p s : / / f x d r e e m a . c o m /   |  
 / / + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +  
  
 / * < f x d r e e m a : e N r t X M 1 y 2 8 g R v u 9 T s L h V O d k 0 f g j + O Z U q i p S 8 q i I t R a Q 3 l V x Q I D C k J g I x y G A o i d n y G + w h l U u O + z B 5 o X 2 E d A 9 m 8 G d Q F i 1 6 V 4 q 5 B 5 t A 9 / T 0 3 9 e Y b m D t D b q D n 5 K B a Q 6 a P o s i 4 g v K o q T 5 1 h u Y x u A n O j D g l 4 0 c z q C 5 p C Q M m m 8 T W N I c n 5 4 N P 0 z m e N U Z N B O 2 4 T 7 B C 5 B j q 5 v C 4 y s i 1 M 1 2 8 + 1 H O j D 3 l 9 a t k 9 a T 0 q z 9 p X X q p P W l N H t / a V a d N F N K a x 9 C m g X S D C n O 2 V + c W a e c L a V 1 9 p S m 9 N g l r n u I O O A e q e t 6 + 4 v r 1 y n X l d L 6 X 2 C r u U v c R 3 l 7 E T L / p o A R z G r L x D 1 6 E k W C s 1 C S 2 3 g P B E 4 Y X l n q i k o V T N D H 9 6 I g J I m r / s b b F Q l d p T m 9 + G E y U l r R U c i S 1 H K 4 m r K A j O T 6 M x o F J 1 t l Q 7 o J S E t p 5 + N i V v Q H z T l d k 5 n w 1 j F e w w a G M T B 0 i G f b 9 Y K F e G E M m u r e J e G U B W r x 5 e n V + c X Y H U t h 4 I P m 6 O L q 6 n Q 0 P 7 9 4 n 6 1 C X 3 X R m H X s c R 2 n P y n t r u o c 0 o Z f U U B 9 T z C e u H Q 6 r P F H T 3 l 5 O o w z h U C u o 4 I 6 H S b X d K k j Z i g B 0 + G a i G u m P T K 9 G J + 6 s 1 S 8 C d s P 4 z i k J L j k V O U T L L 2 8 O h + d u q P J x e z 0 U U 5 B 5 Z V X R h / A F + / n y q 8 z r Y 9 a 9 Y C 3 k O R z l i R 3 N B D X h W q S i t d u c M m 9 4 B 4 6 A 5 L v o 4 w H k j w a E Y 6 L 2 h h c / 0 Y Z G 9 D E W 4 Q E l F x A L Z d O g v W E p z U + l Z C H I M 8 P C l m 5 S Q R b 6 4 U 9 n f c p I B A z 2 0 S Q t d p n D W k Y u l R n y I h B J P F R I s X C p p A E H k S B Q G R 9 x n i Q l D 0 Z U 3 j 2 Z E q C 3 x L f C 4 k i R o y v v V B 7 L y E o C 3 M k t w C 1 E Z 7 Y J F l a g Q g W s e W y + Z Z K k e C V w B N e 7 n D J I q h I d 6 m q D A J h s b R V C Q Q B I c F Q w n P H A Q 4 b V r M Y L 8 2 2 g + K A 4 c 6 j Q t s A E m 8 9 T t H 5 B U X B E 2 w j 4 o 1 I i o I p 3 M N 1 Z q o o U Z c G i o V 9 / E R y y y q G k F 9 4 / s 2 K s 0 0 U v P Z Z y L h K / u / P z s a j Y V 8 l X k a B o H 6 v 0 3 o J i f L 6 j t D V t S h 6 A l G w g K A Q / j o R 2 9 Q j E F M B 6 k c r v F Q P 2 9 o i 5 + A 9 s P Y d a B R j N V I K o I a 6 u r z T v w s o S A G l F 8 h 8 0 g i r g x u q f 7 L Z J h d 8 R s I w U Z m + Y I i U g 6 P A O g A K E L P v 2 U V M I L E v 0 L f J 1 8 a C n T 6 M N I 4 x Z v l v u 1 h P n o y X H t r W g D q U R W 8 3 X E y n j J e e 8 T z g M u y P + m d n X w K X B 6 p x H Z T S d e k J s x Z C v d 8 f Q q n m M k + n N N o I U k x K U H c W 0 j j 2 V i Q / z q c q D D l n d 6 P M e d h G h H x M S H x J o 5 u v g E z 7 E M g E O f I M l Y L z h T y i M D 5 S 6 x R 2 y S N w Z 5 R w Z 9 m H A p 7 x N O C 1 O z 1 r 0 a 4 C D y l L + d 8 O + B X c / A Q Q t n c + x 3 S X U E V a L Z T g 7 x 9 Z u F m T A l y X 9 F 5 l U 0 a d 0 X 8 S l f R G y z D 1 c y E n X t H k R h 2 K H a O 8 V p P A s 1 Z L n n B N W 9 P g 5 O m T S C i y m R 7 d z Z 4 m n y A S C j w a O O j V o K j Z J 4 d w E 9 M h 3 B B X / l l z A t e p + 6 O m 2 2 j a 5 z o B V O 0 M 3 X P l w R H r Q 0 R F n W e c I t O Y h C k Y Q D n L 0 P T 1 e r o 6 h + X U C y d M J B U F e i n D d B M K G o f b i 2 j C k q T 4 T L e M K s c l Z 0 s q i q d f r A X I M w w C 3 K I k J N W j X 2 E o y S i p e k U A n D U S u i X y L h 1 M 2 + r s N t b W L F f k F o p W l o V e q L p D K e O M L t h O G Z a F L G O o Y + s F 4 e I z j s 3 4 d m x o S Y 0 m 3 o J t / G v C y W 5 x n T L j h C Z C Z 5 / 5 y n p l v 2 q / c l 5 1 c l / n r L t s l V v P y D 9 O v I T U b G g q c h 4 K W G 3 D V p 3 S 6 t p Q W I q 4 a + u O R t 2 H G J r S C V 3 T U s M H y 2 d Q g X H f 2 l p R o F / S u J Q m m K 0 Z L U V z 1 q V K 3 D i O D n S F b X 5 Z K Q 0 g K Q g 1 0 0 F w n / n n 4 Y 4 2 i A + 6 a 9 m k h / Y N D r p v s U w 9 s D E e b r w b k m Z R b b h L H J 8 E 3 C p R H w h 5 v 4 Z x N q l 4 y M K g 5 2 y / W d h x 3 / j A + z 4 u 8 L h z c O C d H x d 6 w O D p f f H w L l j g b d X B B i h j b 1 s 5 U s P N H 9 i G J 1 W v o p h P j u B 4 O A R C j U G G  
 N k j Q d a 0 9 + r C D u s 0 V T 3 Y g M N Q o s D h N N T 4 3 I 0 Q 3 I 7 F u t q g l T j 1 + Q 0 q F s F 9 c h L + W e N 6 u P h Y l C 1 v H L I K M / i v x e F F E r 0 K f g p 3 X R Y Z O h W G c h k C T q / L R / 3 r o a 5 W U z H a Q k a g + / U s s M w L u D k o s d u 7 t W W E g a W U V Q B P Q w G K Y 8 d y Q E a V 1 J W p x 6 V 8 I u S k R 7 Q J R Z 1 s W l e L K L O s q X k s 3 / S T 1 S u T U 2 F r y D Y 1 R p 0 B t 3 c Y B E i I I 0 b G j g w R X T r f g y L U 6 p x Z M y R t L a F k V j K C 1 P J G g P H h b 2 T 5 A W 9 m R 3 f V 7 d v e 1 G 0 q n M O c x d s 9 5 s N f J f z s Z / y G a 0 a 6 0 t R G l x j 7 c h n b K b a h t O F + n D T X 3 b E M N o 2 e k 9 W y v N l S O T P A 1 0 h c 0 o W A l J 7 7 I p 6 q d b 2 S q i p a + w I n q g U Y 3 + 0 x L b a M M l 5 7 z j U 5 L u 8 d p 6 Z M f a 9 2 X N y 1 9 y s P t Q C 8 3 9 p 6 0 W v 3 y G w 6 r f Z y 0 p t 9 x H C e t x 0 n r c d J 6 n L Q e J 6 3 H S e t x 0 n q c t B 4 n r c d J 6 3 H S + o w m r e 1 i U 4 q N r j q H Q 1 9 6 R Y K v 0 J L 2 D t C S 4 l M Y V H 3 m o 9 b D f W q H x j 5 q 1 m q b l V m r a T y P W e t y a f z u s 9 b + 8 T P 9 R 3 6 m / 8 f j Z / r P / D P 9 / v E z / c 9 P 5 X r G N / i d v m n s K n O W m p u f a / T + n 4 G 7 W v H 2 h D W e B z c 8 Y r d y p l / o F 5 1 D n 4 K y / 5 3 u i Q C 2 0 E n o s R G W o w 9 x I b A v A s 3 Y g 0 v 9 G / / 9 z x 9 W 4 m 2 j Z M D D L 5 W t 5 4 v t d s f 6 D V + T m e Y R 7 y 8 A 7 + b B 8 T 6 O X j T e w 7 3 w 3 j a 6 F b y 3 v 0 m 8 p w 0 + O E n Q a J X a 0 9 U q e r 6 g t 8 T d l b U o N O b s 7 9 A T u Z E a B 4 H O k P 5 8 W 6 W L b a z z g t w D 6 o U e e / i Q j m 4 I p 4 2 N m i / A B t M / T 9 r Z K y 9 P g A a c e O k k x 2 r j G y X L e G 1 Y r 8 3 + 3 L A H j j k w r J b Z b f + t t A T S n C 6 3 j 1 2 y 9 l b U d y E Z u e 4 S H b t r a 4 j c 0 o R C B r g h X X C P b 9 3 s u 4 A S t n C 4 p D k l A H f x Y d J B F 8 b d J B / I g K s 6 h t Y m Z j Q S L t + o p L P 1 P 5 u g M 2 3 J E e 3 B w G g Z h p k u F k z d M P W / i l D H / C m 7 k S 6 w d i 6 o X / E x L Q + b h L i 3 l I u N F 4 L z W K x N i V j u u g J V j j k l L F J 0 o 8 d Q B A F n r E j k b 2 u E I E + F 7 n I S V q d 6 V R Y v K E / 1 4 A e 5 J Z F I M D F 0 n g m d y P 2 M 6 m 9 9 C J 9 + L K l J D Z I j r A F u E k M m B q 4 s i a U Z n Z 2 z q I q W E 7 F K C Q L h h 4 h f s z s 3 f z 5 W B 6 g r 7 s X X L u M U d P G y L g o 4 5 i y e s x M m Z J l P h 6 k a W Q A n y n N m I 0 3 2 l u G 0 L P 2 I 8 F m 8 5 b p c y P c U + B V C Y 0 T F t j E 2 G 9 N h w 2 n c 5 m / b A p L 4 n M a Z S B t A / e s v P / / r J G S r x r U Q c T J 4 8 0 Z + y M C W P s h o Q b a v k p i J F j T 9 3 / 3 6 y 7 9 / P n + X 8 d 3 d 3 b V o B E 4 B 2 9 b I k K 5 0 c e G b V q v 1 H U p u z E l I k C E X 3 1 q T N 1 J N F 9 U 8 u 1 c h C + V n L S m o 5 z t U U J U U 3 / g p E 7 o 4 5 5 B o K T y J Q a d I J K V + u q b W g + 0 e x L x c / T P R O L L 7 + D / D 0 R 5 8  
 : f x d r e e m a > * / 