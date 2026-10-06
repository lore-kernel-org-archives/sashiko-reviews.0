Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76CE459AE4
	for <sashiko-reviews@lists.linux.dev>; Tue,  6 Oct 2026 13:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291945; cv=none; b=YxkFJ3LMZKSEaC/Li4SkzyUNPxlQGGa+JovFJ/2WJzUSvSUg8rAdcPYOF2f+wIcBtdNPPIa5pDIQ/rbk2lXLc9dHwi4aV5eJMX4vPpl8CGUPCzbFsg+GZOBM+9xLPAvxzyc6Guj+EOUwabO/J7B4hRBuM+OinKj9gaW0JMBpWlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291945; c=relaxed/simple;
	bh=mhNwfCszmkilBWyo+m9QZdTp6GtGco/mHT1PhE+IiFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XtQbTexx6mklczOtntDDsjMiM4N7te6ZJMsCqSmWItfsBF31Ai7GuCyoqG50sDRtA3nUmfDrz01KqLUhJGQRcIrY5HENvuPGG5mVDELQVClrU9kGevYEpqYgTmPnHf5WP8Y5VidBZHXmCh+qjvZYt2O4RAibGumf1YAEjrQXpUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=pOG53iOD; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="pOG53iOD"
Received: by dvalin.narfation.org (Postfix) id 8A05020411;
	Tue, 06 Oct 2026 13:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1791291925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=leMROTpkwTJLP4gquGwlXc+Y9Mr/ZVFaEnXalX39paE=;
	b=pOG53iODMpPMRnZQIsNIS7WPci8nCkm1zav21wIRMWyBhsxOuqFNzrEPjeVhD6Z+vd5aeO
	fyXuL+K/wwdsGwxJr6Z32B0u0hof9ySoXHUPR1tbsGxtEU0ENc1OdqKzD+uJuJV5Zh2ctF
	rJh2M4zV9PdZebl5+9gTBeKAmb0Teqg=
From: Sven Eckelmann <sven@narfation.org>
To: Linus =?UTF-8?B?TMO8c3Npbmc=?= <linus.luessing@c0d3.blue>
Cc: sashiko-reviews@lists.linux.dev, b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [batadv,v13 5/5] batman-adv: avoid superfluous DAT DHT_PUT additions to
 local DAT
Date: Tue, 06 Oct 2026 15:05:22 +0200
Message-ID: <3435112.aeNJFYEL58@sven-l14>
In-Reply-To: <20261006121937.398DD1F000FF@smtp.kernel.org>
References:
 <20261006120647.8646-1-linus.luessing@c0d3.blue>
 <20261006120647.8646-6-linus.luessing@c0d3.blue>
 <20261006121937.398DD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3441699.44csPzL39Z";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3441699.44csPzL39Z
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Linus =?UTF-8?B?TMO8c3Npbmc=?= <linus.luessing@c0d3.blue>
Cc: sashiko-reviews@lists.linux.dev, b.a.t.m.a.n@lists.open-mesh.org
Date: Tue, 06 Oct 2026 15:05:22 +0200
Message-ID: <3435112.aeNJFYEL58@sven-l14>
In-Reply-To: <20261006121937.398DD1F000FF@smtp.kernel.org>
MIME-Version: 1.0

On Tuesday, 6 October 2026 14:19:36 CEST sashiko-bot@kernel.org wrote:> > d=
iff --git a/net/batman-adv/routing.c b/net/batman-adv/routing.c
> > index 5cf26e8b3257a..8dd4094d134bd 100644
> > --- a/net/batman-adv/routing.c
> > +++ b/net/batman-adv/routing.c
> > @@ -1094,7 +1096,8 @@ int batadv_recv_unicast_packet(struct sk_buff *sk=
b,
> >  			unicast_4addr_packet =3D
> >  				(struct batadv_unicast_4addr_packet *)skb->data;
> >  			subtype =3D unicast_4addr_packet->subtype;
> > -			batadv_dat_inc_counter(bat_priv, subtype);
> > +			flags =3D unicast_4addr_packet->flags;
> > +			batadv_dat_inc_counter(bat_priv, subtype, flags);
>=20
> [Severity: Low]
> This passes three arguments to batadv_dat_inc_counter(). However, looking
> at net/batman-adv/distributed-arp-table.h, the dummy fallback implementat=
ion=20
> of this function used when CONFIG_BATMAN_ADV_DAT is disabled seems to onl=
y=20
> accept two arguments:
>=20
> static inline void batadv_dat_inc_counter(struct batadv_priv *bat_priv,
> 					  u8 subtype)
> {
> }
>=20
> Will this cause a build failure when compiling the kernel with
> CONFIG_BATMAN_ADV_DAT=3Dn?

Confirmed (+ some extra):

Name of failed tests
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

pu
=2D-

 * checkpatch include/uapi/linux/batadv_packet.h
 * kerneldoc
 * sparse v5.18 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dy BATMAN=
_V=3Dn
 * sparse v5.19 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dy BATMAN=
_V=3Dn
 * sparse v6.0 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dy BATMAN_=
V=3Dn
 * sparse v6.0 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dy BATMAN_=
V=3Dn
 * sparse v6.1.188 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dn BAT=
MAN_V=3Dn
 * sparse v6.10 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dn BATMAN=
_V=3Dn
 * sparse v6.11 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dy BATMAN=
_V=3Dy
 * sparse v6.11 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dn BATMAN=
_V=3Dy
 * sparse v6.12 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dn BATMAN=
_V=3Dy
 * sparse v6.12.110 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dn BA=
TMAN_V=3Dy
 * sparse v6.12.110 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dn BA=
TMAN_V=3Dn
 * sparse v6.12.110 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dn BA=
TMAN_V=3Dy
 * sparse v6.17 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dn BATMAN=
_V=3Dn
 * sparse v6.17 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dy BATMAN=
_V=3Dy
 * sparse v6.18 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dn BATMAN=
_V=3Dn
 * sparse v6.18.51 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dy BAT=
MAN_V=3Dn
 * sparse v6.18.51 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dy BAT=
MAN_V=3Dy
 * sparse v6.2 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dy BATMAN_=
V=3Dn
 * sparse v6.3 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dn BATMAN_=
V=3Dy
 * sparse v6.4 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dn BATMAN_=
V=3Dy
 * sparse v6.4 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dy BATMAN_=
V=3Dn
 * sparse v6.6 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dy BATMAN_=
V=3Dy
 * sparse v6.6 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dn BATMAN_=
V=3Dy
 * sparse v6.6.157 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dy BAT=
MAN_V=3Dy
 * sparse v6.8 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dn BATMAN_=
V=3Dn
 * sparse v6.9 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dy BATMAN_=
V=3Dn
 * sparse v7.0 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dy BATMAN_=
V=3Dy
 * sparse v7.0 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dn BATMAN_=
V=3Dn
 * sparse v7.1 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dn BATMAN_=
V=3Dn
 * sparse v7.2 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dy BATMAN_=
V=3Dy
 * sparse v7.2 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dy BATMAN_=
V=3Dn
 * sparse v7.2.5 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dn BATMA=
N_V=3Dy
 * sparse v7.3-rc3 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dy BAT=
MAN_V=3Dn
 * sparse v7.3-rc3 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dn BAT=
MAN_V=3Dy
 * sparse v7.3-rc3 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dn BAT=
MAN_V=3Dy
 * unused_symbols v5.18 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3D=
y BATMAN_V=3Dn
 * unused_symbols v5.19 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3D=
y BATMAN_V=3Dn
 * unused_symbols v6.0 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dy=
 BATMAN_V=3Dn
 * unused_symbols v6.0 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dy=
 BATMAN_V=3Dn
 * unused_symbols v6.1.188 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=
=3Dn BATMAN_V=3Dn
 * unused_symbols v6.10 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3D=
n BATMAN_V=3Dn
 * unused_symbols v6.11 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3D=
y BATMAN_V=3Dy
 * unused_symbols v6.11 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3D=
n BATMAN_V=3Dy
 * unused_symbols v6.12 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3D=
n BATMAN_V=3Dy
 * unused_symbols v6.12.110 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAS=
T=3Dn BATMAN_V=3Dy
 * unused_symbols v6.12.110 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAS=
T=3Dn BATMAN_V=3Dn
 * unused_symbols v6.12.110 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAS=
T=3Dn BATMAN_V=3Dy
 * unused_symbols v6.17 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3D=
n BATMAN_V=3Dn
 * unused_symbols v6.17 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3D=
y BATMAN_V=3Dy
 * unused_symbols v6.18 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3D=
n BATMAN_V=3Dn
 * unused_symbols v6.18.51 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=
=3Dy BATMAN_V=3Dn
 * unused_symbols v6.18.51 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=
=3Dy BATMAN_V=3Dy
 * unused_symbols v6.2 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dy=
 BATMAN_V=3Dn
 * unused_symbols v6.3 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dn=
 BATMAN_V=3Dy
 * unused_symbols v6.4 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dn=
 BATMAN_V=3Dy
 * unused_symbols v6.4 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dy=
 BATMAN_V=3Dn
 * unused_symbols v6.6 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dy=
 BATMAN_V=3Dy
 * unused_symbols v6.6 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dn=
 BATMAN_V=3Dy
 * unused_symbols v6.6.157 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=
=3Dy BATMAN_V=3Dy
 * unused_symbols v6.8 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dn=
 BATMAN_V=3Dn
 * unused_symbols v6.9 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dy=
 BATMAN_V=3Dn
 * unused_symbols v7.0 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dy=
 BATMAN_V=3Dy
 * unused_symbols v7.0 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dn=
 BATMAN_V=3Dn
 * unused_symbols v7.1 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dn=
 BATMAN_V=3Dn
 * unused_symbols v7.2 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dy=
 BATMAN_V=3Dy
 * unused_symbols v7.2 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dy=
 BATMAN_V=3Dn
 * unused_symbols v7.2.5 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=
=3Dn BATMAN_V=3Dy
 * unused_symbols v7.3-rc3 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=
=3Dy BATMAN_V=3Dn
 * unused_symbols v7.3-rc3 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=
=3Dn BATMAN_V=3Dy
 * unused_symbols v7.3-rc3 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=
=3Dn BATMAN_V=3Dy


Output of different failed tests
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

pu: checkpatch include/uapi/linux/batadv_packet.h
=2D------------------------------------------------

    CHECK: Please don't use multiple blank lines
    #85: FILE: include/uapi/linux/batadv_packet.h:85:
    +
    +
   =20
    total: 0 errors, 0 warnings, 1 checks, 688 lines checked

pu: kerneldoc
=2D------------

    Warning: ./net/batman-adv/distributed-arp-table.c:1032 Excess function =
parameter 'hw_dst' description in 'batadv_dat_dht_get_self_reply' (did you =
mean one of: 'ip_dst', 'hw_src')
    Warning: ./net/batman-adv/distributed-arp-table.c:1286 Excess function =
parameter 'hw_dst' description in 'batadv_dat_forward_dht_get' (did you mea=
n one of: 'ip_dst', 'hw_src')
    Warning: ./net/batman-adv/distributed-arp-table.c:1032 Excess function =
parameter 'hw_dst' description in 'batadv_dat_dht_get_self_reply' (did you =
mean one of: 'ip_dst', 'hw_src')
    Warning: ./net/batman-adv/distributed-arp-table.c:1286 Excess function =
parameter 'hw_dst' description in 'batadv_dat_forward_dht_get' (did you mea=
n one of: 'ip_dst', 'hw_src')
    4 errors

pu: sparse v5.18 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dy BATMA=
N_V=3Dn
=2D---------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[3]: *** [scripts/Makefile.build:288: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[2]: *** [scripts/Makefile.build:550: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[1]: *** [Makefile:1834: /home/build_test/build_env/tmp.FzAjE3FV2V]=
 Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v5.19 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dy BATMA=
N_V=3Dn
=2D---------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[3]: *** [scripts/Makefile.build:249: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[2]: *** [scripts/Makefile.build:466: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[1]: *** [Makefile:1843: /home/build_test/build_env/tmp.FzAjE3FV2V]=
 Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.0 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dy BATMAN=
_V=3Dn
=2D--------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[3]: *** [scripts/Makefile.build:249: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[2]: *** [scripts/Makefile.build:465: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[1]: *** [Makefile:1852: /home/build_test/build_env/tmp.FzAjE3FV2V]=
 Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.1.188 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dn BA=
TMAN_V=3Dn
=2D------------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[3]: *** [scripts/Makefile.build:250: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[2]: *** [scripts/Makefile.build:503: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[1]: *** [Makefile:2025: /home/build_test/build_env/tmp.FzAjE3FV2V]=
 Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.10 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dn BATMA=
N_V=3Dn
=2D---------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[4]: *** [scripts/Makefile.build:244: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[3]: *** [scripts/Makefile.build:485: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v6.10/Makefi=
le:1934: /home/build_test/build_env/tmp.FzAjE3FV2V] Error 2
    make[1]: *** [Makefile:240: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.11 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dy BATMA=
N_V=3Dy
=2D---------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[4]: *** [scripts/Makefile.build:244: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[3]: *** [scripts/Makefile.build:485: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v6.11/Makefi=
le:1926: /home/build_test/build_env/tmp.FzAjE3FV2V] Error 2
    make[1]: *** [Makefile:224: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.12 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dn BATMA=
N_V=3Dy
=2D---------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[4]: *** [scripts/Makefile.build:229: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[3]: *** [scripts/Makefile.build:478: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v6.12/Makefi=
le:1936: /home/build_test/build_env/tmp.FzAjE3FV2V] Error 2
    make[1]: *** [Makefile:224: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.12.110 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dn B=
ATMAN_V=3Dy
=2D-------------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[4]: *** [scripts/Makefile.build:229: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[3]: *** [scripts/Makefile.build:466: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v6.12.110/Ma=
kefile:1967: /home/build_test/build_env/tmp.FzAjE3FV2V] Error 2
    make[1]: *** [Makefile:224: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.17 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dy BATMA=
N_V=3Dy
=2D---------------------------------------------------------------------

    net/batman-adv/routing.c: In function =E2=80=98batadv_recv_unicast_pack=
et=E2=80=99:
    net/batman-adv/routing.c:1100:25: error: too many arguments to function=
 =E2=80=98batadv_dat_inc_counter=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from net/batman-adv/routing.c:30:
    net/batman-adv/distributed-arp-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[5]: *** [/home/build_test/build_env/linux-build/linux/v6.17/script=
s/Makefile.build:287: net/batman-adv/routing.o] Error 1
    make[4]: *** [/home/build_test/build_env/linux-build/linux/v6.17/script=
s/Makefile.build:556: net/batman-adv] Error 2
    make[3]: *** [/home/build_test/build_env/linux-build/linux/v6.17/Makefi=
le:2011: .] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v6.17/Makefi=
le:248: __sub-make] Error 2
    make[1]: *** [Makefile:248: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.18 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dn BATMA=
N_V=3Dn
=2D---------------------------------------------------------------------

    net/batman-adv/routing.c: In function =E2=80=98batadv_recv_unicast_pack=
et=E2=80=99:
    net/batman-adv/routing.c:1100:25: error: too many arguments to function=
 =E2=80=98batadv_dat_inc_counter=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from net/batman-adv/routing.c:30:
    net/batman-adv/distributed-arp-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[5]: *** [/home/build_test/build_env/linux-build/linux/v6.18/script=
s/Makefile.build:287: net/batman-adv/routing.o] Error 1
    make[4]: *** [/home/build_test/build_env/linux-build/linux/v6.18/script=
s/Makefile.build:556: net/batman-adv] Error 2
    make[3]: *** [/home/build_test/build_env/linux-build/linux/v6.18/Makefi=
le:2010: .] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v6.18/Makefi=
le:248: __sub-make] Error 2
    make[1]: *** [Makefile:248: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.18.51 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dy BA=
TMAN_V=3Dn
=2D------------------------------------------------------------------------

    net/batman-adv/routing.c: In function =E2=80=98batadv_recv_unicast_pack=
et=E2=80=99:
    net/batman-adv/routing.c:1100:25: error: too many arguments to function=
 =E2=80=98batadv_dat_inc_counter=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from net/batman-adv/routing.c:30:
    net/batman-adv/distributed-arp-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[5]: *** [/home/build_test/build_env/linux-build/linux/v6.18.51/scr=
ipts/Makefile.build:287: net/batman-adv/routing.o] Error 1
    make[4]: *** [/home/build_test/build_env/linux-build/linux/v6.18.51/scr=
ipts/Makefile.build:544: net/batman-adv] Error 2
    make[3]: *** [/home/build_test/build_env/linux-build/linux/v6.18.51/Mak=
efile:2050: .] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v6.18.51/Mak=
efile:248: __sub-make] Error 2
    make[1]: *** [Makefile:248: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.2 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dy BATMAN=
_V=3Dn
=2D--------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[3]: *** [scripts/Makefile.build:252: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[2]: *** [scripts/Makefile.build:504: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[1]: *** [Makefile:2021: /home/build_test/build_env/tmp.FzAjE3FV2V]=
 Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.3 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dn BATMAN=
_V=3Dy
=2D--------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[3]: *** [scripts/Makefile.build:252: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[2]: *** [scripts/Makefile.build:494: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[1]: *** [Makefile:2025: /home/build_test/build_env/tmp.FzAjE3FV2V]=
 Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.4 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dn BATMAN=
_V=3Dy
=2D--------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[3]: *** [scripts/Makefile.build:252: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[2]: *** [scripts/Makefile.build:494: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[1]: *** [Makefile:2026: /home/build_test/build_env/tmp.FzAjE3FV2V]=
 Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.6 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dy BATMAN=
_V=3Dy
=2D--------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[4]: *** [scripts/Makefile.build:243: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[3]: *** [scripts/Makefile.build:480: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v6.6/Makefil=
e:1913: /home/build_test/build_env/tmp.FzAjE3FV2V] Error 2
    make[1]: *** [Makefile:234: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.6.157 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dy BA=
TMAN_V=3Dy
=2D------------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[4]: *** [scripts/Makefile.build:243: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[3]: *** [scripts/Makefile.build:480: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v6.6.157/Mak=
efile:1933: /home/build_test/build_env/tmp.FzAjE3FV2V] Error 2
    make[1]: *** [Makefile:234: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.8 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dn BATMAN=
_V=3Dn
=2D--------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[4]: *** [scripts/Makefile.build:243: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[3]: *** [scripts/Makefile.build:481: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v6.8/Makefil=
e:1921: /home/build_test/build_env/tmp.FzAjE3FV2V] Error 2
    make[1]: *** [Makefile:240: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v6.9 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dy BATMAN=
_V=3Dn
=2D--------------------------------------------------------------------

    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c: In =
function =E2=80=98batadv_recv_unicast_packet=E2=80=99:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/routing.c:1100=
:25: error: too many arguments to function =E2=80=98batadv_dat_inc_counter=
=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from /home/build_test/build_env/tmp.FzAjE3FV2V/net/bat=
man-adv/routing.c:30:
    /home/build_test/build_env/tmp.FzAjE3FV2V/net/batman-adv/distributed-ar=
p-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[4]: *** [scripts/Makefile.build:244: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv/routing.o] Error 1
    make[3]: *** [scripts/Makefile.build:485: /home/build_test/build_env/tm=
p.FzAjE3FV2V/net/batman-adv] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v6.9/Makefil=
e:1919: /home/build_test/build_env/tmp.FzAjE3FV2V] Error 2
    make[1]: *** [Makefile:240: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v7.0 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3Dn BATMAN=
_V=3Dn
=2D--------------------------------------------------------------------

    net/batman-adv/routing.c: In function =E2=80=98batadv_recv_unicast_pack=
et=E2=80=99:
    net/batman-adv/routing.c:1100:25: error: too many arguments to function=
 =E2=80=98batadv_dat_inc_counter=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from net/batman-adv/routing.c:30:
    net/batman-adv/distributed-arp-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[5]: *** [/home/build_test/build_env/linux-build/linux/v7.0/scripts=
/Makefile.build:289: net/batman-adv/routing.o] Error 1
    make[4]: *** [/home/build_test/build_env/linux-build/linux/v7.0/scripts=
/Makefile.build:548: net/batman-adv] Error 2
    make[3]: *** [/home/build_test/build_env/linux-build/linux/v7.0/Makefil=
e:2105: .] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v7.0/Makefil=
e:248: __sub-make] Error 2
    make[1]: *** [Makefile:248: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v7.1 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dn BATMAN=
_V=3Dn
=2D--------------------------------------------------------------------

    net/batman-adv/routing.c: In function =E2=80=98batadv_recv_unicast_pack=
et=E2=80=99:
    net/batman-adv/routing.c:1100:25: error: too many arguments to function=
 =E2=80=98batadv_dat_inc_counter=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from net/batman-adv/routing.c:30:
    net/batman-adv/distributed-arp-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[5]: *** [/home/build_test/build_env/linux-build/linux/v7.1/scripts=
/Makefile.build:289: net/batman-adv/routing.o] Error 1
    make[4]: *** [/home/build_test/build_env/linux-build/linux/v7.1/scripts=
/Makefile.build:548: net/batman-adv] Error 2
    make[3]: *** [/home/build_test/build_env/linux-build/linux/v7.1/Makefil=
e:2144: .] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v7.1/Makefil=
e:248: __sub-make] Error 2
    make[1]: *** [Makefile:248: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v7.2 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3Dy BATMAN=
_V=3Dy
=2D--------------------------------------------------------------------

    net/batman-adv/routing.c: In function =E2=80=98batadv_recv_unicast_pack=
et=E2=80=99:
    net/batman-adv/routing.c:1100:25: error: too many arguments to function=
 =E2=80=98batadv_dat_inc_counter=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from net/batman-adv/routing.c:30:
    net/batman-adv/distributed-arp-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[5]: *** [/home/build_test/build_env/linux-build/linux/v7.2/scripts=
/Makefile.build:289: net/batman-adv/routing.o] Error 1
    make[4]: *** [/home/build_test/build_env/linux-build/linux/v7.2/scripts=
/Makefile.build:549: net/batman-adv] Error 2
    make[3]: *** [/home/build_test/build_env/linux-build/linux/v7.2/Makefil=
e:2187: .] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v7.2/Makefil=
e:248: __sub-make] Error 2
    make[1]: *** [Makefile:248: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v7.2.5 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=3Dn BATM=
AN_V=3Dy
=2D----------------------------------------------------------------------

    net/batman-adv/routing.c: In function =E2=80=98batadv_recv_unicast_pack=
et=E2=80=99:
    net/batman-adv/routing.c:1100:25: error: too many arguments to function=
 =E2=80=98batadv_dat_inc_counter=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from net/batman-adv/routing.c:30:
    net/batman-adv/distributed-arp-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[5]: *** [/home/build_test/build_env/linux-build/linux/v7.2.5/scrip=
ts/Makefile.build:289: net/batman-adv/routing.o] Error 1
    make[4]: *** [/home/build_test/build_env/linux-build/linux/v7.2.5/scrip=
ts/Makefile.build:550: net/batman-adv] Error 2
    make[3]: *** [/home/build_test/build_env/linux-build/linux/v7.2.5/Makef=
ile:2198: .] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v7.2.5/Makef=
ile:248: __sub-make] Error 2
    make[1]: *** [Makefile:248: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: sparse v7.3-rc3 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=3Dy BA=
TMAN_V=3Dn
=2D------------------------------------------------------------------------

    net/batman-adv/routing.c: In function =E2=80=98batadv_recv_unicast_pack=
et=E2=80=99:
    net/batman-adv/routing.c:1100:25: error: too many arguments to function=
 =E2=80=98batadv_dat_inc_counter=E2=80=99
     1100 |                         batadv_dat_inc_counter(bat_priv, subtyp=
e, flags);
          |                         ^~~~~~~~~~~~~~~~~~~~~~
    In file included from net/batman-adv/routing.c:30:
    net/batman-adv/distributed-arp-table.h:197:20: note: declared here
      197 | static inline void batadv_dat_inc_counter(struct batadv_priv *b=
at_priv,
          |                    ^~~~~~~~~~~~~~~~~~~~~~
    make[5]: *** [/home/build_test/build_env/linux-build/linux/v7.3-rc3/scr=
ipts/Makefile.build:290: net/batman-adv/routing.o] Error 1
    make[4]: *** [/home/build_test/build_env/linux-build/linux/v7.3-rc3/scr=
ipts/Makefile.build:551: net/batman-adv] Error 2
    make[3]: *** [/home/build_test/build_env/linux-build/linux/v7.3-rc3/Mak=
efile:2229: .] Error 2
    make[2]: *** [/home/build_test/build_env/linux-build/linux/v7.3-rc3/Mak=
efile:248: __sub-make] Error 2
    make[1]: *** [Makefile:248: __sub-make] Error 2
    make: *** [Makefile:65: all] Error 2

pu: unused_symbols v6.0 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=3D=
y BATMAN_V=3Dn
=2D------------------------------------------------------------------------=
=2D-

    batadv_bla_check_bcast_duplist
    batadv_bla_is_backbone_gw
    batadv_frag_send_packet
    batadv_frag_skb_buffer
    batadv_frag_skb_fwd
    batadv_gw_get_selected_orig
    batadv_hardif_no_broadcast
    batadv_interface_rx
    batadv_netdev_get_wifi_flags
    batadv_netlink_tpmeter_notify
    batadv_orig_node_vlan_get
    batadv_orig_node_vlan_new
    batadv_orig_node_vlan_release
    batadv_skb_head_push

pu: unused_symbols v6.10 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=
=3Dn BATMAN_V=3Dn
=2D------------------------------------------------------------------------=
=2D-

    batadv_frag_send_packet
    batadv_frag_skb_buffer
    batadv_frag_skb_fwd
    batadv_gw_get_selected_orig
    batadv_hardif_no_broadcast
    batadv_interface_rx
    batadv_is_my_mac
    batadv_netdev_get_wifi_flags
    batadv_netlink_tpmeter_notify
    batadv_orig_node_vlan_get
    batadv_orig_node_vlan_new
    batadv_orig_node_vlan_release
    batadv_skb_head_push

pu: unused_symbols v6.11 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAST=
=3Dy BATMAN_V=3Dy
=2D------------------------------------------------------------------------=
=2D-

    batadv_frag_send_packet
    batadv_frag_skb_buffer
    batadv_frag_skb_fwd
    batadv_gw_get_selected_orig
    batadv_interface_rx
    batadv_netdev_get_wifi_flags
    batadv_netlink_tpmeter_notify
    batadv_orig_node_vlan_get
    batadv_orig_node_vlan_new
    batadv_orig_node_vlan_release
    batadv_skb_head_push

pu: unused_symbols v6.17 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dy MCAST=
=3Dy BATMAN_V=3Dy
=2D------------------------------------------------------------------------=
=2D-

    batadv_bla_check_bcast_duplist
    batadv_bla_is_backbone_gw
    batadv_frag_send_packet
    batadv_frag_skb_buffer
    batadv_frag_skb_fwd
    batadv_gw_get_selected_orig
    batadv_interface_rx
    batadv_netdev_get_wifi_flags
    batadv_netlink_tpmeter_notify
    batadv_orig_node_vlan_get
    batadv_orig_node_vlan_new
    batadv_orig_node_vlan_release
    batadv_skb_head_push

pu: unused_symbols v6.8 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dn TRACING=3Dn MCAST=3D=
n BATMAN_V=3Dn
=2D------------------------------------------------------------------------=
=2D-

    batadv_bla_check_bcast_duplist
    batadv_bla_is_backbone_gw
    batadv_bla_is_backbone_gw_orig
    batadv_frag_send_packet
    batadv_frag_skb_buffer
    batadv_frag_skb_fwd
    batadv_gw_get_selected_orig
    batadv_hardif_no_broadcast
    batadv_interface_rx
    batadv_is_my_mac
    batadv_netdev_get_wifi_flags
    batadv_netlink_tpmeter_notify
    batadv_orig_node_vlan_get
    batadv_orig_node_vlan_new
    batadv_orig_node_vlan_release
    batadv_skb_head_push

pu: unused_symbols v7.2.5 cfg: BLA=3Dy DAT=3Dn DEBUG=3Dy TRACING=3Dn MCAST=
=3Dn BATMAN_V=3Dy
=2D------------------------------------------------------------------------=
=2D-

    batadv_bla_check_bcast_duplist
    batadv_bla_is_backbone_gw
    batadv_bla_is_backbone_gw_orig
    batadv_frag_send_packet
    batadv_frag_skb_buffer
    batadv_frag_skb_fwd
    batadv_gw_get_selected_orig
    batadv_interface_rx
    batadv_netdev_get_wifi_flags
    batadv_netlink_tpmeter_notify
    batadv_orig_node_vlan_get
    batadv_orig_node_vlan_new
    batadv_orig_node_vlan_release
    batadv_skb_head_push

pu: unused_symbols v7.3-rc3 cfg: BLA=3Dn DAT=3Dn DEBUG=3Dn TRACING=3Dy MCAS=
T=3Dy BATMAN_V=3Dn
=2D------------------------------------------------------------------------=
=2D-

    batadv_frag_send_packet
    batadv_frag_skb_buffer
    batadv_frag_skb_fwd
    batadv_gw_get_selected_orig
    batadv_hardif_no_broadcast
    batadv_interface_rx
    batadv_netdev_get_wifi_flags
    batadv_netlink_tpmeter_notify
    batadv_orig_node_vlan_get
    batadv_orig_node_vlan_new
    batadv_orig_node_vlan_release
    batadv_skb_head_push

--nextPart3441699.44csPzL39Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCasTyEgAKCRBND3cr0xT1
y1GcAP9hBU7w6GeFcgUCtLKhk+fFvaBxrauWYZFINQs7qWDF+gD/eGtnKFTwfiTF
4o6iS6Nx6yDjpPX7EUUCpLtJY+8BKQ8=
=zO+Q
-----END PGP SIGNATURE-----

--nextPart3441699.44csPzL39Z--



