Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C35E63CB
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 03:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786334034; cv=pass; b=mhShAgL81m+Uu6up0oGY+vj1QaupZx0X6Hbzmh7oLZnXXmywKavrGpFRxF1j9aOpYGH9JAm4XKtSeAshnSjo+tA0SW1XkFqJbXc/uCztGZ1bpoj2/HP2lKeUaBYELIupjnh7xC3jSb+OwTGcYnOZls85ffLHP5wFzDUVeuqoBVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786334034; c=relaxed/simple;
	bh=EU2KI1CRt6zOh0x+9oq4Ezjjo2sFpM135RQqO45Ttw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k9LQrG0Uuiwf0wI+f7LQDdkDO8aM6Nf1lK91CmGb2xEBAYZBc48BMVZhdDnX1MC70QH0jPf6pqlAlpbsrVXFJkc9xBXXTYHx0HFSWl35KeOtyDX44IzprX9N0Qxpi+WLlXhLXmxZwij7w/HkUZN5jMbkp9o8m1XTRh6rsfLGngI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUGGE94o; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUGGE94o"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-82113c53aeaso14105917b3.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 20:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786334032; cv=none;
        d=google.com; s=arc-20260327;
        b=FBD3Sf9J3hBz8zKN71RAVGFlvGwwEmqXxULIzrL5I+o41FV6No4ZW2hu5kyLqlvCPo
         R59kOxVX/jwdLDtS5g7+DxYxF//q+2WUITqghtKbTif7vdt4qvusZCi8CkNPqRvxWmzv
         KaFRujuvcB7ATGPGVwT6wkOx3pwLsw5ypXbh8iWyg8R6A83ao4Rex/fWEGM0FpKLexMt
         nKn9k4+I2lKRekhUE2eS2CUc0TnitOQNogBqJVxo7IXlY7d8B8GFlTFN8Dk4Mvaeno3R
         GE793HI1iUNGqvAigXRwFfU3b+3a6ES1r24bz2hY6Tcwww63SmZjQAi8dGhr8VWYGAO+
         0TwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EU2KI1CRt6zOh0x+9oq4Ezjjo2sFpM135RQqO45Ttw8=;
        fh=Ho5LF0cF+PO/PLkIL7Wm5eRR7PyLlY85j8rI60FKLHE=;
        b=AIXv/Lf65jh6SrcZXe/wEmxIetzy3St2+Cnz4W3a6hKrVCt1pNsIR6zRCvoTuQfr6F
         DLMtUWrZSswExLzAdFAqKgCeYTSLAh/bDD0tvEaDQsG7WFGclmPh1Lyg5Gguw1FdBaE4
         7aWrKLewwq3bH6FpmD/0gqWLZwsGn1r5ehW+drj58M5VGI/gHmlwWpUvoTMvChIPffsK
         JNI+WeDs28Ly5/CzEpafQtSv/OGaTcF+DB2ODwOw6I2fjSOgZpiHEWJUBQ9HJ0wqvtf+
         oLm+D9APuwGyBDm4wZqP6VLGJTl9JpsT6QJ7i14utfNX3WmJJOgvAtZ/FAEaqGmI03Ua
         BcCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786334032; x=1786938832; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EU2KI1CRt6zOh0x+9oq4Ezjjo2sFpM135RQqO45Ttw8=;
        b=sUGGE94o7xtAZhFDs1gQRUf+5MvypZzwYkIdYyBcq8K22/60vVg3/0PEjPY5Rj3GSa
         ao2hDI2Ub6uc79QLAmVRzqInOXRxRrKYM+BBhJu/Ey8Q4sJdYOgD8GH2q78zUWZZf2vp
         zbkgPgg1LU/id8RLARzfrPf8T5yhuiR4eKBsjYoaGPPYgkd1bVEl3zt0dJbpZwnoIMlg
         yj1XgqgU83BbVHXyJh8OMRz1+zTbRfBVfnGUwhIU2e9Jnzlbx1kpB/pLkx37oOZngNN8
         7kinW4WRm6sC73PktPNg+iNV7qhQuII1LDL9xUGPjqK+sVYChiA6m2T6bD7Feu3vZf/E
         sNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786334032; x=1786938832;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EU2KI1CRt6zOh0x+9oq4Ezjjo2sFpM135RQqO45Ttw8=;
        b=U9tODfE5dK5LeGRLTNkx8IiLLDuDfWa2aU4w0tdn69kcrFG+T2kwkIckJ4c/OBAPx9
         jk0vu8NUjgbrrR/CI8AqbaPCeyEUR8fxXoYCRoiYzb8vju7XRBEG59KplO4MCg3E+uHl
         RGHopawgBa0UpcZC9HQDDh5TKZsTD0PuiyiYlXRKFZ7sBnrcVIrdDP9sm/iZeSgvVJ3t
         YxK2LQh9m+NxVX7UXhUMHCIaCBBH0CG5WL+yHqEogtQIdLk8LuV67H21H08obgnvcZZc
         Im666c5oIjePJznG5w1uUpT5/hn2DJC5RayZhHdTWWSCcQ3GaWmnjn/g8TXDCQ/akqIs
         EpJg==
X-Gm-Message-State: AOJu0YxKjRQ5s/uxgl43sZoNUyChsqgLP8pzmAy/tpGvd2Fpi0FsYARO
	dFfGWY2bnRADghcK7+NF8oTnwPG/bOD8DUBPv05rHxruktVrV6x9YY7opqAzniBM84aEmsFY81m
	l8LCapdRF7nC0mgnYpfIL7yLbaxu+y9zde9M2Cok=
X-Gm-Gg: AR+sD112BKdnJa46YNX35O59/R7bfr8B3xcaXmj+GXl++SYROZ3EtLBlokQtbZ3pddm
	sA57sOiNG5Ev2v88lbNps8ZN+Rjwy8HZKDM+vs+noAphW+t/z84pspNKRZ11KK/gqs5c2Nr8vwS
	vVAMJPDmlzfkc+LUk/UKBHh+zrzHf0iF/o2Bkyo30GGFaFdMclmIjjsR+wOULDypgyP+vv0dvQ6
	Gh2DA6XGmYuCJWwL1Yb1lnpkSPc/hB/NMQy3KOXkg7G6cCqcwvUGoAeQuRQMHwicz9qqXtRwNBt
	hzJUphzJHTYdT0aBgACLiwu3HVaSLTCrAU0LSOKzLBmWlWbNvk0IgAImrMCPcGVUE/etbmqXdRi
	i
X-Received: by 2002:a05:690c:260e:b0:81e:695b:585c with SMTP id
 00721157ae682-8201bcaf7a0mr264944807b3.4.1786334032195; Sun, 09 Aug 2026
 20:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260809091954.22930-1-laoar.shao@gmail.com> <20260809091954.22930-4-laoar.shao@gmail.com>
 <20260809094046.50ED31F000E9@smtp.kernel.org>
In-Reply-To: <20260809094046.50ED31F000E9@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Mon, 10 Aug 2026 11:53:13 +0800
X-Gm-Features: AUfX_mxElC9ze2AWpHHfl_SsxT2A2aEpQ3-OGyPTjU89ordFkAdgLF6AN-Fm3UI
Message-ID: <CALOAHbAuSypXjKoPiGuSDMNe5WJ5DNKy0kkv-1QjFZc0wRZi2g@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] livepatch: Call klp_init_patch_early() earlier
To: sashiko-reviews@lists.linux.dev
Cc: song@kernel.org, jikos@kernel.org, mbenes@suse.cz, jpoimboe@kernel.org, 
	joe.lawrence@redhat.com, pmladek@suse.com, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 5:40=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] When CONFIG_DEBUG_KOBJECT_RELEASE is enabled, an error during pa=
tch initialization causes a Use-After-Free during module unload due to dela=
yed kobject release.

Makes sense.
I will fix this pre-existing issue in the next version.

--=20
Regards
Yafang
