Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FA247A87B
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 16:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070566; cv=pass; b=BxkM297sxOlAnqX3f+pxto1oMfdtL7vEjdGnVCMopJUJrZ2qoPp2QRKataxTlF2J7WuyJ8uQO6Et+HAQn/z/4gMq+lKzxGst33u4WH8YA/Jvkbot4ao2JyGf3A0yrF5LmFHqa1BWogW+naAWRZzRCJ49bSWQuV9KdUo3+8ZKe7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070566; c=relaxed/simple;
	bh=WbLq5KSubTXR3Nv4sQNzeoIw9EVc824Iz7H+0Pk8yZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aonoiWivFFk/NMZDBJkBYmUr7NHYJ7ExSzth/Y3FQkoSFKCvFHme5jqKWzza+Q76GGjDn3/xIsGthr9c0JeEtAVf0syfqx/eWfxgWnJgTKvl41LU7+ZFD7Byu43psrspHYoXEAAUttl3cKKKEQyLDkvOMcK9GFB1p664K/7Qj7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKbIP9lj; arc=pass smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKbIP9lj"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97bf92018a5so2302149241.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 09:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787070564; cv=none;
        d=google.com; s=arc-20260327;
        b=fUBi4Vh6ZVtFt9mfuB7RVBn+QWTPiFlWa7ORZfH5j8wpFITiE/ljqQnzxViPlikOU7
         rELn4L1kefZjaGHSZFYvilNho0Tvu+yM7uj7j6BRRZxXnpmxwVz0wKaWYLhKpPC0J5es
         nQVir4oRu4vKR9fW6BlxD3R3mTh7UuhmepzSS/NMOhrOyrQqKeB5PfbNsFGzr0ta8Xtu
         ovQWV3xjCoxcnw4LCZpOU0u7mDWOM105l0f05FVsViPC0iKUj24Fe3U804Y97d/emZj7
         EFj3MaBojHW1/2yDoGEXg7PNBisP5yQ5RHoPAmpDLY3pMx4QaEhxHYWBx2/IZdXoaGa/
         CCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WbLq5KSubTXR3Nv4sQNzeoIw9EVc824Iz7H+0Pk8yZM=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=OJP4W/3nlHHgxab3872qCSIvJpPtMFPUPl3aH7IZEyRwDFYHWz1Rwr2tmeN+ArVLFO
         W0PL7HLDjZOfFMYCtDNhiplOfxzi0isMXrqPHf19MQ5OwJT6zHvq9l1bqREatuRyFZsE
         wGRpzD+OdWUWYPumyuLjQeAGpHSnnh9DsduuDcy/YI5JyLnk7a13YP5A2O5URIHhYYdp
         1Nhs0eH3OfCoShCLwp0cc8rP+kwNVxbTnFy1QifAX3Fm0a3Tj5kB/RZ/9j/TefZXV27s
         LArzDZXAR/zGT81dcrwD7zYh/LPrXqdfREiqF/iIXob/CVS+ZqQFslrSmwR1/LNuQiBt
         3TFg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787070564; x=1787675364; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WbLq5KSubTXR3Nv4sQNzeoIw9EVc824Iz7H+0Pk8yZM=;
        b=hKbIP9lj7MxMgyOdbiqIx2rHl8lyRl1O0uE9hGQwLsqOT4ReGRWk99OJ/Bvk11uKD1
         nSt1S1PtwB0BbPm8k6NVE9QetcZrypwPvZvUG/6p1jKdEULAekOzVQ8HI/sf+5woIOQx
         DELJvmw4WgTKvCon77m+LM7/NzOV4Oymp2+i7+NIIR7G/ukKFdLMYDoBec0YYae7BjE+
         yV1mhVZmaMfWOO+ew486W9Z+roc0vZRsTZ3jt6FH2mR5yY+F45vuJM4hOSp28Y2tQe6Z
         XOaknn9o2WWc0Z3TXPn9kxGXLb1C4AhGrV7+RzagXOWUPXvE1gYNneIyl/K93A8lYNT8
         BClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787070564; x=1787675364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbLq5KSubTXR3Nv4sQNzeoIw9EVc824Iz7H+0Pk8yZM=;
        b=pNHLb2ympenz5GiyVdvaK7oJkWBqBgXmjMw6y69tq0816YPReIPrd0ZhEIXW1QwVtH
         8dQ5cKioAA7S+E7Pbkk6MoC71ul8/DSNKexbd+tKIkp4isXnWy46xWFkvl2UG0qzfJ5w
         9qC0ym24X1M8kB2MgHPGSUCIwWJvGJ8XfgOb4It+mLPeCtmEKKZIxvQ5ornmAsZ5sVOQ
         duhUSSrnvwo+K+tnL6lHPwORRTZHjmE3JyjCxuMxqdQ4KUGgRc7VbNyM3z4lyMHa1WCL
         WNO4LKiivCJ5N1peKK/sehtAke7uKVOlUmSUG7XtA/4SxrFE+tfEZ/UGBUtWYE8RyqbT
         kFpQ==
X-Gm-Message-State: AOJu0Yy8guZ9ad/UGy1oQ+OerEQuM0q9dMUzAutT91mVIm1Law6vZgns
	kD3BfsTOWF1ViTXDt49exlkhwdIldSwpVSe9g+Ek4w2aiZVpl9O9U9RDrK5wyb9KsSe/3EYfi14
	yLXD28rPncFre9hnz5dSo/VLrJfwlTikzxQ==
X-Gm-Gg: AR+sD11fQhBjh+GnCZIIEFP6TglH1XY6v3MdfNkayqd8NfYXxrtdUafF9hEwcWDuZB1
	1hA2uoEYKWiYwrjNvxj5imsDpsbZd5STXLqfduvFAbDdQ4zPJgw08q/4FmWdEPyr2idEaF/bsWd
	9i91v/PZH/5ru7lEkLMcu9xcJUp5i8+YXTWsQl+5KwTOIFsrw7FSH6dEEFJR+2xZrgYWNDqb8hV
	Wr6gPy9k85Fmk2Lo4eiOV2SOIRybDkReNOaDw1aSAwdrm3+9aE8mC+vNhjgU6TsVoLfO3tFa6C6
	zdwy/sMkaIo19Kol+vipoMMEBJme69FMYhDH9E/ywVSW
X-Received: by 2002:a05:6102:512a:b0:76b:12e9:a443 with SMTP id
 ada2fe7eead31-76f2c43cbd6mr8049856137.9.1787070564183; Tue, 18 Aug 2026
 09:29:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818160914.108313-1-seanwascoding@gmail.com>
 <20260818160914.108313-2-seanwascoding@gmail.com> <20260818161335.A761D1F000E9@smtp.kernel.org>
In-Reply-To: <20260818161335.A761D1F000E9@smtp.kernel.org>
From: Sean Chang <seanwascoding@gmail.com>
Date: Wed, 19 Aug 2026 00:29:13 +0800
X-Gm-Features: AcwNN1W-gOFcNNm6dBJE2Sjxmz20SbB5OE2mGe7N_yx2yNmOo_ToxIK5uhgNFD4
Message-ID: <CAAb=EJXmUNPB2d0qeqLqvd6jmAMWsZ1nRHjaNMMUGqQLD0avXg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/ttm: drop stale @ctx kernel-doc entry
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 12:13=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> > ttm_bo_alloc_state no longer has a ctx member, but its kernel-doc
> > comment still documents @ctx. Remove the stale entry so the
> > documentation matches the struct.
>
> [Severity: Low]
> This isn't a bug, but is this description accurate?
>
> The commit message states the documentation for struct ttm_bo_alloc_state
> is being fixed, but the modified kernel-doc block actually documents the
> function ttm_bo_alloc_at_place().
>
> It appears the diff chunk header below mistakenly picked up the struct
> definition from earlier in the file, which may have caused the confusion.
>

Yeah, I type the wrong function name, fixing that in the
next v2 patch.

Best Regard,
Sean
