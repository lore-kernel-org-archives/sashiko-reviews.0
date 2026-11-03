Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715042;
	b=FOT0r7q2nZgG1dMBaUF+FaQNdIP6+guWqf8aEmvBA9u4iNHyjDCSoR5X/nw01IghEQL6
	 AMjuZShWfYOWT9aEzBUno9Ore5uSCLwPmuWfJAJtpUS+/RtgbKGve1L9dB7JoIB8ZWXEW
	 PQY/FfgmvTkTA5sRdsjqkn20+gIE2rflhk46cFiTms28bsSdX7jcwmvhepM4CxbN5pCNH
	 4RcrMDgbPGJoo8Q6y3Z7v6fzh/NY+Jsx3wDVZa/0aIljNOcaGbBL/BbH/o+IAeDryPx/S
	 bpmuYONHpZO2bOats24NxEHwdy3Ho+vckACTlMfJH6PrGjgyEWxHPztaNQA5OlblCDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=uPtZiAuMvsQ4xj67j+wg/mIOE4N8PxgJKIgehU/HgNU=;
	b=HNgyGZqIk4L78Nl6JMonKOoaySnLx3QvVG2o9t13eCjqj6YMjmC9ElrsbenRqbOGlzMm
	 LTnfiUi+EthO6mo701Q+/jU1t+0GxCBmKwKU2ewJ6Ah2z33gDT4QiG9C4W8bHx/0oeqlz
	 aKQrUIAK1B1pE+AZuFebl8cIUt/00QJiZ0JZdiou2vIcXniVO7qKUXe036uiFYoB66NYE
	 kcVvFYoySqdF1rTrElt8NvgZ6RiYRQCbbfwaLAeuzLn0O0hVN8LTaYFS6aVFCw5We7+YO
	 nN0zgYevtrUCNZNRMR9BaMwK8fUOldqlzp7nD6hnryqm+B9lEIwypT9eTIQ1m2MFcjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+DXJjLx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E56606A328
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 14:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E56606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u+DXJjLx
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2eb14c60a7cso7957495ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 06:10:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793715040; cv=none;
        d=google.com; s=arc-20260327;
        b=hR5NmZ4035/TCaZ7h49zCt6WK7KgSsf5HllFuOhBPM8vSAK5X6A5bQD29E0TOtMg/N
         8rsZTzL2RpdorYrW7pUZKoEIZh++UlL4HyGsXS+zy0zagRL5HXwczHS+g1Nr24ZjAlyP
         1r7WVUdeADxyfuTVIkuFWv3cuJzW5cOOuAU7X25TUMc5AvJbN1MzDMA+U6NU8iBI9eP8
         UlDTnz0Iqlc5iV7JueTQHOutcfAwcXgu2Inygh9jiPRCefKyFA1k7EVAu+JEaC+JQ1oO
         9mdQb3QTbUph8QQNysUFXcpgsLd+T7qI1wSRq/Oy0fvxbpcfiaapnCLIxIEqLnhNHsDD
         IIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uPtZiAuMvsQ4xj67j+wg/mIOE4N8PxgJKIgehU/HgNU=;
        fh=dfvPRi+t5KvUF1qpgNVmacxvd83mvku6fE8K+/2kbH8=;
        b=boRNmCuh+j6y80NNuvO5OPjjb8VakgwxMCzsGxpzFcEIJy5YkCWwJ+6oDSA21SG3DG
         tSi8eXkJArcT7lSnG5mpPVcRZU/GrdiKXoEU2bpa+RK4pJJef3ca+v3WneNCV0iiDNx3
         XstSUqOmuNgcHHHmz06CGK02LnaOP/ypH4onN5HoMZG3BJS7UxOOLKjnvjZj9VvXDkzE
         fBC+d1vwwL313YTDWmL3YogHbak/FbeXppEse9HXZm4tQFD/iFg80l74HNx0fKwOQHYi
         /D9wlAfYYDxhmNVvILb2MoHU75K7lLkFITYkHc8kAHAr8ohFS0UbSxqDDlXyTITthqFy
         cugA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793715040; x=1794319840; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uPtZiAuMvsQ4xj67j+wg/mIOE4N8PxgJKIgehU/HgNU=;
        b=u+DXJjLxZu8H43DnCNbnIeZfssZo3goTXqaNXNHfP7o7tyiD+x+6JenhT8n1CeqztY
         5X2MlowulIYkkppEyEKNgD4hgKXPHLsMPtVomsQ+aAUIkKwQYV7DwA2uP9RYzPzsed6J
         CWmSh+jtfenf/Cx8+bOeIIkJoqJRQL2NKqGYb42s8yWRuXjy+QzPQ7I4u2TqxTC9bfGy
         8p8yVRptTI1KvuGkDTGUrW43mW30GfL6zOz+yCqZ8ugkzCWS78w4YWZCXUWiqhCNe4L7
         vhXdOPuxJ8aSfwoqkVTjIGMMzafxMDQuCBj7zJ07on+TBG8IU0dJDG70bunaStDYlENZ
         uREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715040; x=1794319840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPtZiAuMvsQ4xj67j+wg/mIOE4N8PxgJKIgehU/HgNU=;
        b=uVnI83KIG+gwf33AN9n6HgBV58gq5x4aKDr2K1HnmStO9uhTTb7NQ7LShP+AAA6Rab
         vztMBTamgy63sqrtnNNRf2VZ/931s6WGUWCyQbo+1gxbxw1/pzmhZDViqh2brf6/mJ6Z
         3BlsZfCuNc4JkAavQHe9NuPKPLHLmBmXyI98Nju75+Q7l/u6iJNXvWY7uFGewTtp91Iz
         MRJ9Pz5m8ESJ4oewSLYBDj94edEnM5Ahx4VUhtP8rkUb2f0uv7TUYt4jcfBy04aJIPM0
         Kem6YcpXjSh9fCU3tbLzz17a/YOI9rm4kagVuraPmrm8mEm70JBzNDPAr3MBIHq379Yo
         F+jQ==
X-Gm-Message-State: APuU4Z/CveApBU+FfB3+xXl3At2ts7OS2neyPGu33dFjK5n+Rg43CJzT
	6e4Yu0VfeDkyEirGyoE6j6Gb1V1R8Y46o0pje1AyZV9j2skL21sprz3YsTRWSgv6fTObwLMek4H
	YUI9jfpL6WlYFbvsrtHVYTwhz+ZgYs4pulJ59bjjN2Q==
X-Gm-Gg: AYBFou04LP8OgKC3ERMHhZkKZQvzTPAEkHvbzEXKeNet3EmADwMkukX5N1422vI9SDA
	BOA49vzxo99nMYbg0WAm5SkGF7Lnai31gkEPjdob9jiU5wg4EvWSBkhJYbDohH0XwkB1No+hVxc
	iaDVZ5RZ+iwyIZi+iAiPpIX6VlCB0WuwTbKda+IlESd4Iocbw/ECQVBTMy7/HRU1J8kmgg1KFK5
	FYfuIAGijPlikZrF7UUPRze2PBsDgg17qsSxWL2/YvmMxFlPnxLDXCJvDbU9xMA5xCwRIQlGPGZ
	Vx7IZ/1ntoiZ0snK2ZXNAZdSJ04IIFkH1H3IW8TvEEamJaGiNuV2NlNwzkiSFuU9Ca8RguMrOwf
	BDqoFJfj+ssj1GTsW9/qaBP8u8mh6FVvoyj+U/A==
X-Received: by 2002:a17:903:1ace:b0:2e9:5c29:9955 with SMTP id
 d9443c01a7336-2eb3644fa3bmr219840055ad.4.1793715040482; Tue, 03 Nov 2026
 06:10:40 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103131127.1585884-1-lui2012qwq@gmail.com>
 <20261103131127.1585884-3-lui2012qwq@gmail.com> <sashiko-outbox-195329@kernel.org>
In-Reply-To: <sashiko-outbox-195329@kernel.org>
From: cy l <lui2012qwq@gmail.com>
Date: Tue, 3 Nov 2026 22:10:27 +0800
X-Gm-Features: AclHuK-nHRxg_AwMHq-9Y9sHupz6dUc2DZ1jKWeWqrReY7GXWkzAgdYuxCKe-lo
Message-ID: <CAE=Q7=5eUPmNevwqQuFQBDTni5MRk=9nPkd4pPXqoWOoi7Gy+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: cyapa - clamp SMBus block reads to the
 caller's buffer
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, correct. The masking predates the clamp (the out: "ret > 0 ?
len : ret" convention), but it sits in the same length semantics, so
v2 handles it: both branches now fail short reads with -EIO (group
branch: ret < len; indexed loop: ret < chunk). rmi4 (patch 1/2) is
unaffected: rmi_smb_read_block() zeroes the caller's buffer upfront,
so a short read leaves zeros, not stack garbage.

On Tue, Nov 3, 2026 at 9:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Input: cyapa - cyapa_smbus_read_block() returns full len on shor=
t block reads
> --
>
> commit 17f2cef41b86752525f835330272cc728242a63c
> Author: Chengyu Liu <lui2012qwq@gmail.com>
>
> Input: cyapa - clamp SMBus block reads to the caller's buffer
>
> This commit bounces SMBus block reads in cyapa_smbus_read_block() through
> a temporary I2C_SMBUS_BLOCK_MAX buffer and clamps the copy size to the
> caller's requested length to prevent buffer overruns.
>
> > diff --git a/drivers/input/mouse/cyapa_gen3.c b/drivers/input/mouse/cya=
pa_gen3.c
> > index fc3fb954523b7..cd80ae51f4e52 100644
> > --- a/drivers/input/mouse/cyapa_gen3.c
> > +++ b/drivers/input/mouse/cyapa_gen3.c
> > @@ -254,20 +254,30 @@ ssize_t cyapa_smbus_read_block(struct cyapa *cyap=
a, u8 cmd, size_t len,
> >               return -EINVAL;
> >
> >       if (SMBUS_GROUP_BLOCK_CMD_MASK & cmd) {
> > +             u8 tmp[I2C_SMBUS_BLOCK_MAX];
> > +
> >               /* read specific block registers command. */
> >               smbus_cmd =3D SMBUS_ENCODE_RW(cmd, SMBUS_READ);
> > -             ret =3D i2c_smbus_read_block_data(client, smbus_cmd, valu=
es);
> > +             ret =3D i2c_smbus_read_block_data(client, smbus_cmd, tmp)=
;
> > +             if (ret > 0)
> > +                     /* never trust the device-provided count */
> > +                     memcpy(values, tmp, min_t(size_t, ret, len));
> >               goto out;
> >       }
> >
> >       ret =3D 0;
> >       for (index =3D 0; index * I2C_SMBUS_BLOCK_MAX < len; index++) {
> > +             u8 tmp[I2C_SMBUS_BLOCK_MAX];
> > +             size_t chunk =3D min_t(size_t, len - index * I2C_SMBUS_BL=
OCK_MAX,
> > +                                  I2C_SMBUS_BLOCK_MAX);
> > +
> >               smbus_cmd =3D SMBUS_ENCODE_IDX(cmd, index);
> >               smbus_cmd =3D SMBUS_ENCODE_RW(smbus_cmd, SMBUS_READ);
> >               buf =3D values + I2C_SMBUS_BLOCK_MAX * index;
> > -             ret =3D i2c_smbus_read_block_data(client, smbus_cmd, buf)=
;
> > +             ret =3D i2c_smbus_read_block_data(client, smbus_cmd, tmp)=
;
> >               if (ret < 0)
> >                       goto out;
> > +             memcpy(buf, tmp, min_t(size_t, ret, chunk));
> >       }
>
> [Severity: High]
> What happens in cyapa_smbus_read_block() if the device returns a short bl=
ock
> count where 0 < ret < len (or 0 <=3D ret < chunk in the indexed loop)?
>
> Both branches copy only ret bytes into values or buf, leaving the remaind=
er
> of the caller's buffer untouched, and then jump to out:
>
> drivers/input/mouse/cyapa_gen3.c:cyapa_smbus_read_block() {
>         ...
> out:
>         return ret > 0 ? len : ret;
> }
>
> Because cyapa_smbus_read_block() still returns the full requested len whe=
never
> the last i2c_smbus_read_block_data() call returned a positive count, call=
ers
> that pass uninitialized stack buffers and check for a full read cannot de=
tect
> the short read:
>
> drivers/input/mouse/cyapa_gen3.c:cyapa_gen3_get_query_data() {
>         u8 query_data[QUERY_DATA_SIZE];
>         int ret;
>
>         /* query dataabda has 27 bytes */
>         ret =3D cyapa_read_block(cyapa, CYAPA_CMD_GROUP_QUERY, query_data=
);
>         if (ret !=3D QUERY_DATA_SIZE)
>                 return (ret < 0) ? ret : -EIO;
>         ...
> }
>
> drivers/input/mouse/cyapa_gen3.c:cyapa_gen3_irq_handler() {
>         struct cyapa_reg_data data;
>         int ret;
>
>         ret =3D cyapa_read_block(cyapa, CYAPA_CMD_GROUP_DATA, (u8 *)&data=
);
>         if (ret !=3D sizeof(data)) {
>                 dev_err(dev, "failed to read report data, (%d)\n", ret);
>                 return -EINVAL;
>         }
>         ...
> }
>
> Wouldn't a device returning fewer bytes than requested cause
> cyapa_gen3_get_query_data(), cyapa_gen3_irq_handler(),
> cyapa_gen3_try_poll_handler(), and cyapa_get_state() to consume uninitial=
ized
> stack memory in query_data, data, and status (and expose uninitialized by=
tes
> from query_data via the product_id and firmware_version sysfs attributes)=
?
> Should cyapa_smbus_read_block() return an error such as -EIO when ret < l=
en
> in the group-read branch or ret < chunk in the indexed loop?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103131127.15=
85884-1-lui2012qwq@gmail.com?part=3D2
