Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE7C42EEAB
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830445; cv=pass; b=CHoOcEFbEPz0SCdUxtG5lSuJBV9oz6TPDTHj7Gb5XAgdxArHOJt/LP6vzvHAbsbwb+jwPRTzFmvcrdVdDFBh18u539V6N93RJcCtnukv68W71fWpOx4cevUEDLFqPhaj0FXDZr62i4b8f8UCehxLylidPCG0XBVL6Vh9nXugdrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830445; c=relaxed/simple;
	bh=OGVS8gsiozxEdjWEPDQzeoafxc/DPHmM78nhgq5r6/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vmv/ZLCd9PrTXcTXN9BHbF2xfOKHKvKlansMvfQSGaDYLU/f3bei4De57f5GEoSD/N8BOA4gtb38bC6w29weHI8OkTIl/Fg+w2Cc19uXRo9icYFGRj0/IjYyfhR54YAG1qRVU0mg4yv0k6eSQWRugTXMMTBQu8Xar58hB8u6OzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apgJBTls; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apgJBTls"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-668005ba03cso5821501d50.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 01:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785830443; cv=none;
        d=google.com; s=arc-20260327;
        b=qJZyztUnbYSuquOUHUyTzVAcjv6w/4Rw2KWC+xURqjHcsCJCnmXFeBM1zFZ4gv3ptg
         Wqhpm3F1IlAo0sFas8xO3hsNzS90FIGDGeRzoUlooDmK4RzTsWHuDIbzE8Cant/wI8SC
         p0a3dqwlyoYCILt09Y68nZ8CcvoAQMXmql9MLbJJIt6aC3sGTLsYfsLAyidlswuSaOzs
         xyBj2dbG84qpJqXsCjUjlyLjZw5Er9Z1PsLUYyd6SXJ5Q7blXX694z1gmGcJBy9K6svG
         nu5dgdoiD0WMrrzFkchBDIjHKEvVtISjmf3u7RHsfqsb/f1yh0rrI/PhPZYFE5NXqNgv
         dkSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6sN7hyGeF3/QBGyqG1sqeR8O1GAdeZpGRRACa/xNXes=;
        fh=jN8VodyhAI7zYna9JzV1QjHjWbE/Mn6J5bWeUXC0oQM=;
        b=dyD4qomBucxLLCCrCpo/VTF7CrtUtwnAHcrUi/naqgG2sIMTW262cs8q8AfSQWbpAd
         0drzGQSRJ0FEkannCjtS7hsgg8HsfnB+dgKZ2Q3TsfPCmqIJdZ6EXxhcDHrvGYsqwMyZ
         jnq1L0pQQTEa4RW1n6Usx5RpvibOnNLRKlWo1cx7Y3WTCLAcirIqqw1Gpaoe31kAcFIL
         nrYpq4NwarL3+fjCbkMdH9Gqcc4v9naSL2cK6Gs7H5v12auY1ldxVIgrJu8mx/SoDSMh
         DrI99P4hElNF6EcYnUO9jhi56/p6CjOuL2jSQ80L9ToByPFtyZ7Or8R1Pqy5rwr1lPzb
         jU3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785830443; x=1786435243; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6sN7hyGeF3/QBGyqG1sqeR8O1GAdeZpGRRACa/xNXes=;
        b=apgJBTlsvU5WLhls7LwDyrr/tGl+uV9LADZUMiGgDj1NI3p7bez3Nzx9hL6OCBlgPD
         AVzRbh5ErSPuNFv3OK7vwVmQNv3tZldj5kK+Ltu5ncrupnsIqjsqo/myuIx1oOpF0HUH
         vRv8GDoxKm2OtncZuSHTAgCLk8vMgy0wc8HEdEjoEg4DdnkH2wEQBWZXG3hbMICxVhZR
         qqqV9UOQSFqxYN4+saPuThtZXCpRj8mdo8OhkhET1IORgDryG03s/WkiDkMrXBA5t9PP
         lK+tOnQRy09rXmY2lHapvbgmgfx1gyCLYdNGdEVhakIbhgX2u3UYBpbhrFLVVQHUn9Ve
         yiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785830443; x=1786435243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6sN7hyGeF3/QBGyqG1sqeR8O1GAdeZpGRRACa/xNXes=;
        b=PPKWjKCDv2H7X00B9FxEsp9wrLIMQfL/b9KG5fsQwDpntQfYDvSamEYmyBfJNHAArm
         tgVWT0ZiGPw4MzAui1Pa8xD+d2eYiopV6uaj8L/U3+wncshLQE45Ws57CWjlW/CMUvo5
         VlJZfGL0SyEgdtoy7jaty7QTwMTmoUrcGOlwn3G6cdKFr3k1pScjajQndQB405n6WFmh
         vrivz7TeyomWQFuesgeH1McE7bbVQ/yPT6K4DnQPMBXVUaRrGvgIeual6/csEHNpXmU8
         jb2fuhtXfMDlCQDAlU/cXVJTWa7nRNUq8ppRyMO4ii4TVnwxu6VIppNWaxGdppeyIWqG
         IRYw==
X-Gm-Message-State: AOJu0YyrcPPm0EZJfE1E9MBigdVSafrQE0zCcx9m8ZkgcKBDYVW12Yju
	TIXU1IF6KOfAMyfTeJ2LHOZcMipuizH4rKpp9mweb5ijj69pyc1p0QOIHuZMYpJf8YcCL/vmKNO
	Hh/Gh2cZ/ZIzg/aH0x10e0FYUBdWkBlDi6TwM2Tc=
X-Gm-Gg: AR+sD124pK0GgbqPGk2hBwo3AhfU0HrXMAZf0V3gh7We2F1oCR9EI3IjPeG+lwEQgtX
	23hZUzr616kwO+e80WFBXOV6VM8tekJgDzBDsaGMAr7njN7AGC1QP7MIQgp2YK1DprXbzLdoF3V
	8S8LeNw84P8zJu7YnMqc8GTTxnEXCcwvnXQ/pnyGuLkqQ3GyrNOkOxORt/GTl/d/MGeTxq3ig8g
	jsVuXX/F2dPQ9UrFcvGcXbCjWWNOxDmPJcacWSKXHoS3/RS8bDXlJ88mxnHKzRkf49eMGuIuo3d
	2Hq5BxfdP9YH8aENTUDB/gQULGpDBzrSRirj9F3aF5eumotF4k+Y8GwTaz6ppx1F2mM9Z5mkTtP
	bQg==
X-Received: by 2002:a05:690c:6387:b0:81f:650c:98ce with SMTP id
 00721157ae682-81fd4bf4886mr174550617b3.31.1785830441484; Tue, 04 Aug 2026
 01:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804065010.44922-1-laoar.shao@gmail.com> <20260804065010.44922-3-laoar.shao@gmail.com>
 <20260804070336.5878F1F000E9@smtp.kernel.org>
In-Reply-To: <20260804070336.5878F1F000E9@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 4 Aug 2026 16:00:05 +0800
X-Gm-Features: AUfX_mxGSk-xETKXTtNYxe5sKvhCIlGzr52N7RGo-baY3Ws7lFHISe3-JXv4JWg
Message-ID: <CALOAHbDvXRY9cfHQxDdsT+=CSOePvSgG5JF=uNK_A3dP9noLXw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 2/4] livepatch: Call klp_init_patch_early() earlier
To: sashiko-reviews@lists.linux.dev
Cc: jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 3:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Moving klp_init_patch_early() before early failure checks viol=
ates the kobject API lifecycle and introduces missing cleanup on error path=
s.
> --
>
> --- Patch [2]: [RFC PATCH v4 2/4] livepatch: Call klp_init_patch_early() =
earlier ---
> commit 6b8df20b82104d4c61053ebea3721f1d77891456
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> livepatch: Call klp_init_patch_early() earlier
>
> This commit moves the invocation of klp_init_patch_early() earlier in the
> livepatch initialization process. This prepares the code for an upcoming
> patch by avoiding mixing iteration variants later in the sequence.
>
> > diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> > index e07c41a0f3ac8..c98cbcf59566d 100644
> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
> > @@ -1135,6 +1135,8 @@ int klp_enable_patch(struct klp_patch *patch)
> >
> >       mutex_lock(&klp_mutex);
> >
> > +     klp_init_patch_early(patch);
> > +
> >       if (!klp_is_patch_compatible(patch)) {
> >               pr_err("Livepatch patch (%s) is not compatible with the a=
lready installed livepatches.\n",
> >                       patch->mod->name);
> > @@ -1147,8 +1149,6 @@ int klp_enable_patch(struct klp_patch *patch)
> >               return -ENODEV;
> >       }
>
> [Severity: Medium]
> Since klp_init_patch_early() initializes kobjects for the patch, does
> returning directly on compatibility or try_module_get() failures leak
> these resources?
>
> The kobject API requires that once kobject_init() is called, kobject_put(=
)
> must be used to release the object. Because klp_init_patch_early() is now
> called before these checks, if we hit the early return paths in
> klp_enable_patch(), we bypass cleaning up the initialized kobjects.
>
> Also, would simply changing these early returns to jump to the err label
> cause issues with klp_free_patch_finish()?
>
> kernel/livepatch/core.c:klp_enable_patch() {
>     ...
> err:
>         klp_free_patch_start(patch);
>         mutex_unlock(&klp_mutex);
>         klp_free_patch_finish(patch);
>         return ret;
> }
>
> It looks like klp_free_patch_finish() calls module_put(patch->mod)
> unconditionally. If try_module_get() failed, jumping to the err label
> might underflow the module reference count.

Good point. It seems we need the following additional change:

--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -1168,19 +1168,20 @@ int klp_enable_patch(struct klp_patch *patch)

        mutex_lock(&klp_mutex);

+       if (!try_module_get(patch->mod)) {
+               mutex_unlock(&klp_mutex);
+               return -ENODEV;
+       }
+
        klp_init_patch_early(patch);

        if (!klp_is_patch_compatible(patch)) {
                pr_err("Livepatch patch (%s) is not compatible with
the already installed livepatches.\n",
                        patch->mod->name);
-               mutex_unlock(&klp_mutex);
-               return -EINVAL;
+               ret =3D -EINVAL;
+               goto err;
        }

-       if (!try_module_get(patch->mod)) {
-               mutex_unlock(&klp_mutex);
-               return -ENODEV;
-       }

        ret =3D klp_init_patch(patch);
        if (ret)

--=20
Regards
Yafang
