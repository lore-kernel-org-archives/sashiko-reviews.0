Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C4B33D51A
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 16:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782319870; cv=pass; b=QdFyi15OiEm16DtYJrCjS79pzUpLc8c7cUSRJF+dID2sx5QqwOldlL90Pg0sqyH1xTgpwEtCjyZoeBD/UZzHLPRr/jodKKLNWW0QVK7jstjmd/TRupd8Q1E8X5ady5QKC9aO1dhjCF+dNlYGXbGrj1fE8tGEZfFwzwa1BBEgdRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782319870; c=relaxed/simple;
	bh=cjvPvtEsTHCAOU+IjGR4oOnSd0wTDR9pc2SGE/nQchk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MRu3etd/5m0L/u0EPBHNzIqMDs39ksKJIKKk3R9E49HTSacjpE7sqNzBeU+/4qgZvaSuF630ucygVfgfTNZWMc6vCBKXk7y2N3vTePQd9u1AhCLGURPQrXYm1TdhExu3lyIE9pYUEgh53ev9hhQX1Agad+BNG20ulpuXSJktros=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h96Vc/Sn; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h96Vc/Sn"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c8fee9f63d5so462841a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 09:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782319868; cv=none;
        d=google.com; s=arc-20240605;
        b=kGqU5To6hcs9CW69f1AqDwBVwoy/77ase1JpZHoaN0bIXCDk4nxqULe8wj1Sre/s8l
         sTNFuZ8/eiKEcgyujWDEb7vYFOVPjJ0N4GJ8dvCKNuTusJwzoxpleFyUFkvcBJG0pHUt
         zSt6DFCNMMYEoeYG9yzKIlr9/9T13dvBzgujFcRhl/RPak4ghCTtQzuiBZMMu2+JUM1i
         nVQkHU2bQXjIi35uhCry0SBLUIyU0mcoMsozAYv8DaI/CZZbqV6BqL1Nq/E6n6XjfGL8
         LQ2UF86iYgjEqb5xEpVE+i86Fd7FuDq3nCeRr+gJ802mJeXgp1IK024bJCm4hzKAhKRK
         vItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CkhSwh0tn/SPxaM6seg68NrgymEV8OV7TF7kZYQtoSw=;
        fh=mTP6TkWV1IhQRgyhsEpYqIpiXvhDlZKdHAfNRdOTDjk=;
        b=ITLpL6bl1sC2w3arRVO7BBeh1u80kkgztIdL/9c3lwSxOsTePD7P8EJvr/5o3ineGa
         FIcpSwp64PwA8Bl+sQv+4s3XsTqYRX3bNLgt7K8Pqow8D3JW/8wY35hDrFwjQ622FjId
         MJM+q7I5laAlrXdqgXRWF9cayXGTI2d5vzmwxJ5DaX4V5EqVY+viMequZ/nf4KkcyMEt
         tFTaGeInrPtEcpH8rYDcezc3HMgDDu+0fbBHDlJwYY2WjBEnAhu2WeGifsa1fnN/gLjV
         S1N+FFvyoGWR+Uq/Rw1jpoPRZeYc9mbWZFcanFCjhsK16adym9FnOObBBbKlIyR2raHH
         9zZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782319868; x=1782924668; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkhSwh0tn/SPxaM6seg68NrgymEV8OV7TF7kZYQtoSw=;
        b=h96Vc/SnnmX/ICHBGrjAUwONCUPUu0Qmjt9/Oemg13HO8u8bYnjgt41fkCVQDtEyRo
         rDG7oob7atUM/3H8YYNrJVc1cTExzQIv6I7w/Zih8GyzdOgfXqDGwoQ3/FFZ18jJ2JmA
         ZUXeWAX//wl64tfUrOQv2H2FtL61b5Nq9YHDt5carCoyve0xIcz7otk38p5odKOybTEZ
         rDQcHf/qM0SuoiJGI/kLdUzIJ7ze45mgXdy66MM2UXL9ncGeWgxXNcJD+rJpTYmF/1Qv
         SSsllVm08M/TWQ8vDB6e12JGylf1f2dKx+a8Ts11WCFlC5WRs/Juu64ZqhuLA8mkE3+a
         ZhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782319868; x=1782924668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CkhSwh0tn/SPxaM6seg68NrgymEV8OV7TF7kZYQtoSw=;
        b=hdlQqKlU1R0GVTmoDI6Eh9iEx+wFTU9NqC16BQ9QpYSuQuGb0k1YIkwimaTds0870I
         mbS861an7CVb4K/rDT4140N0+qCIYPZif5xJ9dllxabohxeLnPM0T0dQpcvbtjwGoG7n
         cB9YbgPptgFdNwXDttXivC/1Q4Guvl6+ZmtO7xkpG3ng+ACYLXwmfCvNu9ofQwuiHMJP
         fr9tXMGPGbzwXu/QUFsnyQuP5i83HeM+/Qbj4N6nEuFsBRkRW71bq5A3isA300G3fki9
         uvNwjK8FPAdZT4DEzfx4tJuIaD9MCwRqm7peW/PvyQ2pVNDB4D9Us2hLROjrlun2Q7YP
         03wQ==
X-Gm-Message-State: AOJu0YzZqP+6JvlIR/NV9tPUKXw9TL5OL50jFRWKHqEwuGEmhbDeRMOE
	DuZvfC3Cp4fCSpMsxjs/TB1Y2mjRw0g3KeW8AmJoAp3xxvVaJSZ2VJOpM6y8xnXGdo5g9kiXGbB
	6wnV9vENrAxWWN9OWm2AHeWQAaLXWKMn5f5nDsljdfQ==
X-Gm-Gg: AfdE7cmv7Sz7nH09he9+BaoUF6pfSyXTp6IGYWKm+25gAtmz2B5vs8pwFM43TIT/V0o
	MpAeYSJaVlOYa4UsfsIewOsR+7YbUg+Qjlc2qioQdnG0jRNXFoiP1dSfFIYMaaNl9X8sv77LeHY
	81nR0If9llCCJBFbqOCvzL2JFCResLTjg3stY2pYNX9KUVlZowHZwUIiCczVoF4wTUBQJVOFyvl
	gihwhG3QXffzC7nX8Mex2KRY7VJyLX0bZJu88dQlbOZsQcsgN8t1/GynYQt7ZvMMEMpw7fP6HcB
	3of0YMr7xVZc8bNsBWoChSBfgVMDwGxJPJOaz670B/2zb/A7IBDluWnD7OAtv8FebJ/5cnjEKuk
	GSJfBLK4Dn/Zn
X-Received: by 2002:a17:903:240b:b0:2b0:608d:d8a8 with SMTP id
 d9443c01a7336-2c7e13bad7amr45153165ad.1.1782319868022; Wed, 24 Jun 2026
 09:51:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624155421.211626-1-nishidafmly@gmail.com>
 <20260624155421.211626-6-nishidafmly@gmail.com> <20260624155828.3C6F91F000E9@smtp.kernel.org>
In-Reply-To: <20260624155828.3C6F91F000E9@smtp.kernel.org>
From: Hiroshi Nishida <nishidafmly@gmail.com>
Date: Wed, 24 Jun 2026 09:50:56 -0700
X-Gm-Features: AVVi8CdhXqTw5nypB8-AWepGa7-ArMWEpSofzhJN9Dg4XePtsj-rfRWJ7mxBlhc
Message-ID: <CAE1ksKTSn6dSApiYdNve8WZuDC7P=6KnDPODsvrWw=FJ-7W=gQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] md: clarify the resync ETA comment in status_resync()
To: sashiko-reviews@lists.linux.dev
Cc: linux-raid@vger.kernel.org, yukuai@fygo.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> The comment states that the divisor db is scaled up by 32, but the code
> rt =3D div64_u64(rt, db/32+1); divides db by 32 -- scaling it down.

You're right -- the code divides by db/32, which scales the divisor
*down* by 32 (so the intermediate quotient is 32x larger and keeps
low-order bits a plain divide by db would lose), and rt is then
rescaled by the >> 5.
My rewritten comment had the direction backwards.  I'll fix it in v2:

      rt is, in exact arithmetic, (remaining sectors) * dt / db.  To keep
      precision near the end of resync, when the remaining count is close t=
o db,
      the dividend is divided by db/32 rather than db -- i.e. the divisor i=
s
      scaled down by 32, so the intermediate quotient is 32x larger -- and =
rt is
      scaled back down by 32 (>> 5) afterwards.

  Thanks,

2026=E5=B9=B46=E6=9C=8824=E6=97=A5(=E6=B0=B4) 8:58 <sashiko-bot@kernel.org>=
:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The newly added comment incorrectly states that the divisor `db` =
is scaled up by 32, when the code actually scales it down.
> --
>
> commit 21672ecf7d2b823245c32b9d2699f7cf1a5c2e7c
> Author: Hiroshi Nishida <nishidafmly@gmail.com>
>
> md: clarify the resync ETA comment in status_resync()
>
> This commit updates the block comment above the remaining-time computatio=
n
> in status_resync() to clarify the calculation logic. It is a comment-only
> change.
>
> > diff --git a/drivers/md/md.c b/drivers/md/md.c
> > index 0cd85cc92ed31..a5c0da0d11334 100644
> > --- a/drivers/md/md.c
> > +++ b/drivers/md/md.c
> > @@ -8916,17 +8916,11 @@ static int status_resync(struct seq_file *seq, =
struct mddev *mddev)
> >        * db: blocks written from mark until now
> >        * rt: remaining time
> >        *
> > -      * rt is a sector_t, which is always 64bit now. We are keeping
> > -      * the original algorithm, but it is not really necessary.
> > -      *
> > -      * Original algorithm:
> > -      *   So we divide before multiply in case it is 32bit and close
> > -      *   to the limit.
> > -      *   We scale the divisor (db) by 32 to avoid losing precision
> > -      *   near the end of resync when the number of remaining sectors
> > -      *   is close to 'db'.
> > -      *   We then divide rt by 32 after multiplying by db to compensat=
e.
> > -      *   The '+1' avoids division by zero if db is very small.
> > +      * rt is computed as (remaining sectors) * dt / db.  To keep prec=
ision
> > +      * near the end of resync, when the remaining count is close to d=
b, the
> > +      * divisor db is scaled up by 32 before the divide and rt is scal=
ed back
>
> [Severity: Low]
> Is this new comment accurate regarding the math applied to db?
>
> The comment states that the divisor db is scaled up by 32, but looking at
> the actual code:
>
>     rt =3D max_sectors - resync;
>     rt =3D div64_u64(rt, db/32+1);
>
> This divides db by 32, effectively scaling it down rather than up (which =
in
> turn scales the resulting quotient up). Does this comment need to be
> adjusted to reflect the db/32 downscaling?
>
> > +      * down by 32 afterwards.  The '+1' avoids division by zero when =
db is
> > +      * very small.
> >        */
> >       dt =3D ((jiffies - mddev->resync_mark) / HZ);
> >       if (!dt) dt++;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624155421.21=
1626-1-nishidafmly@gmail.com?part=3D5



--=20
Hiroshi Nishida
nishidafmly@gmail.com
