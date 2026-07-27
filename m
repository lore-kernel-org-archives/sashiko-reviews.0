Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35017306486
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 05:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785128598; cv=pass; b=fEaxUf44cfsbtOyd38TfcjU61T1UqrhYVvxXRwDt2hhJWHEIS1bDY0p6K/ju3tyz9JsDYQ/SxxJLdNp2WBp6Ez7hl1SPKXkqMHsiklZpEToZnSJx69Qu2Itn+GOxObiGyIZFL7EAfZAtDPjGsVj94uiB3MNZNHBKEPVCs/LlFs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785128598; c=relaxed/simple;
	bh=Pk/FtZDZl0PQfrLIsdI+VKyZ+R7vH46HV2PrUSu/YjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMJcYrXOa9121Kd6qkZBSSwcRbgUTCZoSmMoT7/BLiotSXgXIEmEY7XZYqiilSOyphiJRjH/6IRZfLTdoccDB+OWWvqBoOAlJMQdoUaJZEQ93vICnjAbWdawPiDO+/um+uZiFWyTCdiKTQIKyR66MZJY9m2c7IHo2RQ8E7NeK7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRvF70Y3; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRvF70Y3"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so3234633a12.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 22:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785128595; cv=none;
        d=google.com; s=arc-20260327;
        b=RNx15ZejmcARlBLdftG6WePD4VWuBAM9PeFavCCKi0U7qy/yYln3GTyNfmULChsebq
         IoW55ybtcQ7KpHL649Q5LPTXMLQPt6nuWXI8JEcH8UvNFf2COD1hl02qj35uF2v5BRjx
         3uy1XFGOSGCjd0dEv3cBq8jvSlm13soo91mR3EMLNKdRpnBGcePaZR8dAG8CSa3vz8Ja
         USkLtCneGI+tZcnaymnMIPSlo5+DQcynH72FmT6Y59QcxXHpUgM9y2wnZ4+59LFvJnrc
         O+y4Z+g7+Mx12VVMCgV/9YPq68W1JhJlTPhasYBkjLODfPV9GnzdeQanYrd1EMym236i
         D6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lHItxVHx/YdftcT7BamSTgJdXuSOFb2Tw3ZgxEEjhpI=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=PPypzZHZpxECwJTktuRkA9WN/3yYJlZsGqN2RImf6Q+JJqhsVBG6yRb3WHENnKvAK/
         /x27/rXTpclYrrES4J6S91pbZaKDsedZcqrwe/ZGH3kEVZo40vmewk+RymBiYVJ4CLLc
         DY7N46MtNGaHDztx2m7WDMVBlTlCFRejHej+kuzyr6S2qgAZTl/bdgVHjg0N8OuBmI9t
         M/W0tNVXryVFL8885glbiRtyxOc41ZtTMrjlAFoWToX93thi1MS7rq2/PAlHfx9DAWP1
         rJUqQFj/8au0r+zs1qQe70v65dlh+SeTZV4Wxw6IjoBAeUDdUfbObMP7DUkvd+PjYuLZ
         KXbA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785128595; x=1785733395; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lHItxVHx/YdftcT7BamSTgJdXuSOFb2Tw3ZgxEEjhpI=;
        b=QRvF70Y3/lWC9nTAorxSRlY4jQH6xHWNJ17U7SblBYX/Sf6ZhUonVI+jE+yggrAjBu
         uUd1/fT7roL/wxQnvirabxjTOiNoHE9bK9ZlTSg3h9PbGfqc9g33SEX+jeeO8N6Wj52U
         reGMkh81JJfbaH/sb0uTwLRCcV7m54B//PAVDXySWNbd+zHlPyJuax6cneTsHmf4N3gC
         r/XgS6R52cBBfpO5EGdOMxPAb2nsHm0RnQ065DRQrMavCXgd0VCjfNpe13pv1sVI1awp
         FxOg+AFYRlvIB4F4AOtYwNTKa9DoOJ14l+Rl78qmh/O47h0Ni461u1ijOTALDersNFb+
         U+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785128595; x=1785733395;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lHItxVHx/YdftcT7BamSTgJdXuSOFb2Tw3ZgxEEjhpI=;
        b=dHokjOmMVO/Nu0ElCCdRKBMIVxvuO4bZ3OK5VPuLnUMv89kyzfZoo38cVt4zgZxeI3
         zQr84AmXUcPpJKedpRAxuDrcjzXwT3+Sfxdph2LmXaOWYUSJFicNxTkrEWwIF111/kt8
         lIEoQNgLV4sNYhK+cgma4GCHbxSgj9vKwy7huYiEcTnxrB6IU9CfUInINlipMq9G6IYV
         sApJx3EAGtBQ6nBgYI7tiKyuAvYV4XZPgMKeE1aPNxGoINsvsri+LvOO0QCeAgkJGmzy
         AeA5cmacF++hKTvnkFcHRyOnC/voXMJIGSG06fkgfygMky0QiLAA//Qc8DNAUo4+/Hzv
         ovpg==
X-Gm-Message-State: AOJu0Yy/GKd8zqLZsjrQbMO7ZYm2dKbL41dFcRWne1TNkOlMgPmj1y97
	P8+Hcscr5+H+kFSCdkNalqnvn71C5++Xa5HEFSmkYMjRyVzHTyl2FXmDlsmgvF889BLGRM5dBLN
	/iorWTSA+2oRmC56iCExuCFY0kLrfQ9juy+IwpZg=
X-Gm-Gg: AR+sD11Wd6jAyBqEsgwA3SuWgkXMIxySKB/n5fTsiypNWthK9sSkisUNSdsPIMVYES+
	6bRgFW8HGRPpiQJpEzjHXP75werhU0JM14aNt5wRLON6ZowSnuzvyDD83is9PuSxzg/mE1JCsKv
	8jGls5NT6fQ0Z0TvUQ73VmOvN5LduPaQUTY8wiiEi6eGYAEvYAb3Y0etAhYZ2ijBMjVDsC1mUY7
	M0W/f/EOW4q3qEeuJ+sf0TPrOPBzD8yewwOSbVE4oXBv/jKBNBX2y5ujGGi7F3kianGVKaA+uJ5
	WLHFjx+GCET+YAmWPBehQq5uctRT1Q==
X-Received: by 2002:a17:907:9728:b0:c19:611c:fa92 with SMTP id
 a640c23a62f3a-c1f1ea885aamr289639966b.21.1785128595368; Sun, 26 Jul 2026
 22:03:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-2-21424d550c3d@gmail.com> <20260727035020.1CF6F1F000E9@smtp.kernel.org>
In-Reply-To: <20260727035020.1CF6F1F000E9@smtp.kernel.org>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 02:03:02 -0300
X-Gm-Features: AUfX_my4wYNWjWAHJBqAVaBRnB1Kk79Kz2VxtKVUqoU4ID_uDlSup2YNwyNCFV4
Message-ID: <CAJq09z43s=gTMZ5zHpvTE1rbe0SYB=bR-C2cCip3iK219vLi3w@mail.gmail.com>
Subject: Re: [hwmon PATCH v3 2/6] hwmon: (adt7470) Fix cache updated before
 hardware write on I2C error
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 27 de jul. de 2026 =C3=A0s 00:50, <sashiko-bot@kernel.org> escreve=
u:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The PWM enable mask logic swaps the bitmasks for channels 2 and =
3 (PWM3 and PWM4).
> --
>
> --- Patch [2]: [hwmon PATCH v3 2/6] hwmon: (adt7470) Fix cache updated be=
fore hardware write on I2C error ---
> commit 6776a671fbb0d95bfa3d1f5ca2bae943732d5533
> Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>
>
> hwmon: (adt7470) Fix cache updated before hardware write on I2C error
>
> This commit ensures the driver's cached values are only updated after a
> successful regmap_write. By checking the return value, the cache accurate=
ly
> reflects the actual hardware state even if an I2C transaction fails.
>
> > diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> > index 481d51617f4be..62ec68ea0a406 100644
> > --- a/drivers/hwmon/adt7470.c
> > +++ b/drivers/hwmon/adt7470.c
>
> [ ... ]
>
> > @@ -847,10 +850,11 @@ static int adt7470_pwm_write(struct device *dev, =
u32 attr, int channel, long val
> >               val--;
> >
> >               mutex_lock(&data->lock);
> > -             data->pwm_automatic[channel] =3D val;
> >               err =3D regmap_update_bits(data->regmap, ADT7470_REG_PWM_=
CFG(channel),
> >                                        pwm_auto_reg_mask,
>
> [Severity: High]
> This is a pre-existing issue, but does this modulo logic for the PWM enab=
le
> mask swap the bitmasks for channels 2 and 3 (PWM3 and PWM4)?
>
> Earlier in adt7470_pwm_write(), the mask is assigned using modulo arithme=
tic:
>
>     case hwmon_pwm_enable:
>         if (channel % 2)
>             pwm_auto_reg_mask =3D ADT7470_PWM2_AUTO_MASK;
>         else
>             pwm_auto_reg_mask =3D ADT7470_PWM1_AUTO_MASK;
>
> This assigns the mask for PWM4 (0x80) to channel 2 (PWM3) and the mask fo=
r
> PWM3 (0x40) to channel 3 (PWM4) during sysfs write. As a result, operatio=
ns
> intended for PWM3 modify the hardware state of PWM4, and vice versa.
>
> The same pattern is used during the periodic sensor state update in
> adt7470_update_sensors():
>
>     if (i % 2)
>         mask =3D ADT7470_PWM2_AUTO_MASK;
>     else
>         mask =3D ADT7470_PWM1_AUTO_MASK;
>
> Could this cause fans to fail to enter the commanded automatic or manual =
mode,
> potentially leading to improper cooling?
>
> >                                        val ? pwm_auto_reg_mask : 0);
> > +             if (!err)
> > +                     data->pwm_automatic[channel] =3D val;
> >               mutex_unlock(&data->lock);
> >               break;

The modulo logic isn't the issue here; rather, ADT7470_PWM3_AUTO_MASK
and ADT7470_PWM4_AUTO_MASK are incorrectly defined.

This is already addressed later in this series in patch 4/6. While
fixing the definitions is mostly cosmetic, it will prevent Sashiko-bot
from repeatedly flagging this false positive in the future.

Regards,

Luiz
