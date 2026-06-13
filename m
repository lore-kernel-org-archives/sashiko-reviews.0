Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE4C175A87
	for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 22:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781390115; cv=pass; b=MSQhDKeJ7+1OGMnDEPlvrRtODbx11W4fzTVasZH4GTtnIniPnHDiGalXoHfl5zP3IoAeCOod9K/aIffuy4KvfTqWaKwIM1Ik0XijizD4rR7JMYaC05Q52P980NPuyJ9UiYOJ8eGqM9PcduupxHfChTiTchJr+T3l/7iK9K1ncnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781390115; c=relaxed/simple;
	bh=PyW8c4IHb4/lwYVktBQ2fDeXw7Jxfc1/fkBB1aB9O9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=kOYAmzXrcQlzngiikcXC+7ZuVyyj0FQ1RRPu4ypkLanXTxYg6fCGcqGytlFjUEGY5ihej4qQ6kqvq9hNPsIX95cbVM2ZZRyaYdLXYAWXobn6CrkmCzMn84IK5HsMlXNDd7mDNZYVgaQV4Y3u5TM9+IGkYseCT0vbIgmnB4Pg98s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=oGqtEDHD; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="oGqtEDHD"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-842848fd613so1995899b3a.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 15:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781390113; cv=none;
        d=google.com; s=arc-20240605;
        b=DDRsDtEwo9vSYOxcxecQXDUpYFgVHCYaQ7tTWfQPvVLOR3FiCysrb+6Fz8Hu2qH0rn
         0q1z8ijsgCam+VhH48VAAU3xuREmCNl2B+OCBkJjbQARhEzxyRw029EtfmEvhid2i6xz
         4lKCUH/2+spOLs2pB1urOIRZ2wpViRkxqBUPs03Xf24q7Bx4uBzEFEJB81clAq7cVSAR
         kHJokObtnTXlw2tupjN0pcIXrAM/akItMsDgEGOWGyjTV6t9rAbz/nblFZBOzr0GMl99
         DOgJJCUVCXAkysjrptbKNqQODDcZYw85tvUWnQCY1L3uO7Z0MGjYEwb/rzty9BavOGUz
         72Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZD8mBjz6SmNDiIy/mCSAY1ATfOXbm8Ads6dFOsHWTe8=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=BWn83Cp8Lujy8e5s1Z2ZhNF3DYvZpo9n7lAGoGmQPE3ol7YOrGWHWnAJzfI4yFnBGc
         bKjxeBvrYbJ0m5Y/sKpb8rogL5Klaf6IaQk5iztkCjYtWB6425UbPD83+ivVQlmccjsB
         +q91nGX9OBDrJLvxBf6er/SeOqsiQ79cIuWNbFhA0WMo559n2PkLYgw7GhiBNXcjV8Qp
         AZZJpZ1yriDHC7u0YNnWq9J+kF4tJKByUzk9qIP6GA2V9Km6a9T96nkahp2Z4Rc9ThGK
         x++D1gYyVRuCRqs/WCaQ+aX0U9r4KA9MI+rOMc45vCShwT0QZ+gEkicPB/01FRwL+10o
         LRyQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1781390113; x=1781994913; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZD8mBjz6SmNDiIy/mCSAY1ATfOXbm8Ads6dFOsHWTe8=;
        b=oGqtEDHD3LGUmvRq24RvZptXvJ/yWvUeyLTo871oi3oCQaILAq1ryebcY9l9sipdjN
         lqr2L44lB4BvE+fJOjc/TO7qayT2zf3diSf3ZnDObHoPw4L5RT7P1eZ8OujMt6nBQp2C
         +OQHAXT1C8fELAExRJaV/AFHvlXa45KadeP81mPna8e+FaD/TDeGsQpi7xpM3eFvfbVO
         ym9ywbnnx7+MFUN9tipyvopyLxopyCaR0S7RkKn1YB3P06uXtY46lo/qJwxD9QjXmKpU
         8ZucHE3BZvpZddhOAQVWbPyEmtT3d/hNnXwPDZWhW1FBF7Fp7khBIUhD7ESeyqqqZ9rY
         kMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390113; x=1781994913;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZD8mBjz6SmNDiIy/mCSAY1ATfOXbm8Ads6dFOsHWTe8=;
        b=AL9671gRR7OtpDVVbpf56Jb7HNHuFuMvmtmSwOUmdmFSL5AbqFqXLrCLVjNgiaw5Gq
         YqsuMjyACa4l2dGZJUcolvbEz3mnVcJAXVHaYdK3SWvrGX1QrFcW2afveBc4dspbCd/D
         arACnePwlv/oGlThYZPyGxPjMwA/marvuZMpIqPs9Fay9vlEnU2zBN1us7puEuhMM6z5
         SM4JkUqRPRbmSvFE0CfBSen3FYcTMO+09AxC+QprDJIZia+zH5E+quC0XCY3WI4fbTql
         HkVj6H9bCSythHxjJ7RtOVz+CeVihDrLgD6lrvmYxGYu8pswCv4Aut9Qpo9GqymlVhHq
         Ph8g==
X-Gm-Message-State: AOJu0Yw/l9jkb2Va1fx1MNyRTlhFIpCa85sKTU1IbDJtJ62KlV16LSSb
	xR3dDWL76QfB/TGOnKQbo1Ysz0TgoLgJDrGBfnW6IgH1rpmEqvX6DQM6RvxlbH1XWnKQj6y6oyA
	IJDzQ9jV4NNGR/xYfpOCZa3G0PjPPYL7AIQ+4M0LnP50IuB1tW/Y1gEBh
X-Gm-Gg: Acq92OEVRCLlNO3CW5cngdYcgOiPxZm/X9CnQ3aymuzxPoi1LjdRngFw36/Vbr2IA3t
	2/ImP3qxcXZURfZqqoaT85BIwBTF6rY/mfwYyqsuPoqvCdUx6uJzO/VFcTM6HUr8yMgWKF+vilp
	7/LMIyLuOWeZNNt0cXhjyB24HpOoDwnkBJavq4ED/cOcuTQL/k3QLti+wV4nCSUAiKnkiaNMsbR
	uGGBHQcjCLjLPwlWpFEEEn3Cz3hcDrtSrcBBCoWtElpnwkfS1K/VWdpUmQJ78ftGPQt6rGuWgRK
	GFJ4oL/VwmTjKFON3qul1NijAUCoUJquun1Vdxw=
X-Received: by 2002:a05:6a00:1d21:b0:842:7992:bdd3 with SMTP id
 d2e1a72fcca58-8434ce50e94mr8080859b3a.4.1781390113092; Sat, 13 Jun 2026
 15:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260613221836.556019-1-xmei5@asu.edu> <20260613223322.345171F000E9@smtp.kernel.org>
In-Reply-To: <20260613223322.345171F000E9@smtp.kernel.org>
From: Xiang Mei <xmei5@asu.edu>
Date: Sat, 13 Jun 2026 15:35:02 -0700
X-Gm-Features: AVVi8CdKV3E51WdsxSpFba2gyRTXAuoJSuGQ3FkoMW7hwJS5bYU_uAZFFK-fY-8
Message-ID: <CAPpSM+TGZK+E6OJAoUquKwFCT42Sc7xr-9hJxG-UUWrGOwYp8g@mail.gmail.com>
Subject: Re: [PATCH ext4 v3] ext4: fix out-of-bounds read in ext4_read_inline_dir()
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You are wrong. The function exists.

-- Xiang

On Sat, Jun 13, 2026 at 3:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The patch introduces calls to an undeclared and non-existent func=
tion `ext4_dir_rec_len()`, resulting in a fatal compilation error.
> --
>
> commit a8a90225b0fd734b3d0ab45a6beb15fb4207d8fd
> Author: Xiang Mei <xmei5@asu.edu>
>
> ext4: fix out-of-bounds read in ext4_read_inline_dir()
>
> This commit bounds the dirent header by inline_size in both the rescan
> loop and the main loop of ext4_read_inline_dir() to prevent an out-of-bou=
nds
> read. It aims to ensure that the dirent header fits within the allocated
> buffer before dereferencing it.
>
> > diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
> > index caa51473207d7..fdbc7c43f6964 100644
> > --- a/fs/ext4/inline.c
> > +++ b/fs/ext4/inline.c
>
> [ ... ]
>
> > @@ -1515,6 +1515,9 @@ int ext4_read_inline_dir(struct file *file,
> >                       /* for other entry, the real offset in
> >                        * the buf has to be tuned accordingly.
> >                        */
> > +                     if (i - extra_offset + ext4_dir_rec_len(1, NULL) =
>
> > +                         inline_size)
> > +                             break;
>
> [Severity: Low]
> Does the function ext4_dir_rec_len() actually exist in the kernel tree?
> It appears this will cause a compilation error in ext4_read_inline_dir() =
due
> to an implicit function declaration. Would using the EXT4_DIR_REC_LEN(1) =
macro
> be the correct approach here to calculate the directory entry length inst=
ead?
>
> >                       de =3D (struct ext4_dir_entry_2 *)
> >                               (dir_buf + i - extra_offset);
> >                       /* It's too expensive to do a full
>
> [ ... ]
>
> > @@ -1549,10 +1552,18 @@ int ext4_read_inline_dir(struct file *file,
> >                       continue;
> >               }
> >
> > +             /*
> > +              * de lives at dir_buf + ctx->pos - extra_offset, within =
the
> > +              * kmalloc(inline_size) buffer.  Make sure its header fit=
s before
> > +              * ext4_check_dir_entry() dereferences de->rec_len.
> > +              */
> > +             if (ctx->pos - extra_offset + ext4_dir_rec_len(1, NULL) >
> > +                 inline_size)
> > +                     goto out;
>
> [Severity: Low]
> Similar to the issue in the rescan loop above, will this call to the unde=
clared
> ext4_dir_rec_len() function break the build? The EXT4_DIR_REC_LEN(1) macr=
o
> might be what was intended for the main directory iteration loop as well.
>
> >               de =3D (struct ext4_dir_entry_2 *)
> >                       (dir_buf + ctx->pos - extra_offset);
> >               if (ext4_check_dir_entry(inode, file, de, iloc.bh, dir_bu=
f,
> > -                                      extra_size, ctx->pos))
> > +                                      inline_size, ctx->pos))
> >                       goto out;
> >               if (le32_to_cpu(de->inode)) {
> >                       if (!dir_emit(ctx, de->name, de->name_len,
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613221836.55=
6019-1-xmei5@asu.edu?part=3D1
