Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216180;
	b=hs5vTLYfdAPcPHLJD4b5GW8SO0dW9mwFVlH/9ii9zKnQWAN/J24NKHrw8Da8wA/v+XWW
	 kRSyUB0ixAm2Y0dVY5CthtnBWHXPM+byJnMTDWGKSLSD6KsL5ZtCnUSmBZhUx7GBmN7t1
	 RavWA38XrLl6u5bVLY3e+l9LMbSQWz6AE5CHCC83tib82nSM/S9die7RFShARGiMMMydL
	 jBbSHmkVx8+ZbSUmY3O4CTFSzib3P/EHXgPQ0jah2va63dd/+ZJNhnFBLJmbRdiGz4Ta3
	 4UxBvU5EMNWMQ/BCnF4K1H0nCoHBlxg7XR0W3s2FwNA+Udza3e2Pk1qIY6ej5J6oOIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=5GqNarA8yhniPQn8im3r/1O/fx/VgqmvibkYDqdOfy0=;
	b=MNJIWwbwNGGR+WSOrkK0QTqsr2qIOuXuTTtDqdOEERE4hYW+kC8Qhx8+pvPuX2cvIlbC
	 ywtD5bznRoGYvZ0Y05WhkudqyZeuzOeRkjNYmCGEUKVGgWV4JUALvX1qJWrbyFOAjNAHR
	 q+A26a2ZFtKv6J/21np4PnmgaFQJTpOn/468AY5zLbFCIlADo3L6NCHIDy528i1aOcAPB
	 r7ghA4+4fj/xv2UDew46rm42yEt/aDy2sl718/ujQ8OFRlz96V2AvME4VxFJydxk204Oi
	 yOCxbi+xHCa7rLOsNKiDMcyxoWHg/Znfs5mhUxb5SnXB724aGwwpv3EnMTAZU03z2ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mjj1KymG;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B96A606A68F
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 23:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B96A606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mjj1KymG
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d581da0aaso194151666b.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 15:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795216178; x=1795820978; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5GqNarA8yhniPQn8im3r/1O/fx/VgqmvibkYDqdOfy0=;
        b=mjj1KymGsgHhfG2X5wfFDUe29iNMPFu1rVR8vDD2ngpFmTBlE6yfon6120qCPRTFc1
         iis3gP8BdPxAvGrGIuW/xG+x2GBl/zKStMFWjqCXCyY5GyR/PT5vhMg8d1Q3el2okpqR
         2z5ASdwbDGZSJvBxbMXFtVIAmes4vWXmGNQig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216178; x=1795820978;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5GqNarA8yhniPQn8im3r/1O/fx/VgqmvibkYDqdOfy0=;
        b=IAmJq1+BwHpunEJgJZwKlgOBj8koFIaWzIJoEMUEStDtrUbfNTad1L2LXzx5b99aSO
         kN4dl4KkJZiB1rAW8Ekqphpez+H8QNOjp9NAXzn4zUZ/49zq/CC98qX91WUg6TdPW0ZB
         SJBu7OMgLv1gDVgy1ozy8Bl1HITFNTxtMUsE7UMpFY+H7vIuMLjTMvOvxmFJ/kXto+nH
         kYkix+pmoPXkFmoL/9R03zy3c02/FicVk8Elpk/QAHjyZFxnzdPityVG7DlEWdnKFxHR
         YKDXvckabHKu0ra/3zTKKZm7hMO++UU/6yTs5FGmJTjFfiHsCKVbJcKTWPXVnP34k2GA
         okBQ==
X-Gm-Message-State: APuU4Z8OEHX2duvdG0Wwr9PO2GkpZDXE9ShoU1s8QB2mUl9EwObalk4Q
	5LSyQqqHhTuIPToACwwvz03pt+t8Fm7ZbVIgI07cDAtgMYxBtpvWP0GrBd6EAN2N6Ei0XVBTHfp
	ZzQvdKF3o
X-Gm-Gg: AYBFou2eHTfop6NpOWo6lf0zX5Roc2FKL+IoL9waF3U8Frb6X+Lw924S8CPaDK9pWFS
	NP0oAEx3qtazvVqkQKSUq1V/4or+WXrTZDKYn3mvrG2/3PLXXYBNYQsYpQSAHd+lEe425IdaotG
	KT4IN/t66NG2c2GB13w6PIG7DmzCJQ1rXST6//5Np25k/W3tJtKdgJ379PtacUuXkRVNtN+EaX1
	oOvpGQ6AHCHseG9dxljcMcO5cTEvwtbK0QGO5OZBAe4HBxHqdv8vxb9a2X5HIaZLLZZ3ueAj/oL
	xblf1I4LDiBZBo3kLynmgPxoTZs/5vyqLrNFLm84zr9a93BqdvqZTMF2lHEN+Q0V53WAQG9veGD
	ICET0Yax49jCut+xEoEfePh/z3KOQhNKypQXOMsg+uf7txYRff8d3qqV6VwhwKVZpQLfLjMw1uh
	o8+TtR0Bw5jEEsxU/1fOQTIKnGWlz3xYs8knhL58Q+RS7n0YWMsthxXNYDQEZVroshgH819XeH3
	iwbmZlNbRnetK5kvw2nMEp51nEsj+14Id4jdnuapcj8rFDrwdFw+eAQJY3ZN+PQg0zZWbdhENPU
	VE3vlFo0Y/iFlr2eWYvDPnSpkdkkVHqcBzaGTR8ySI4UsiYSlFV7uVedc74GZJSfPqgG0ueiWBJ
	kYPrX+I1g2ld2/g==
X-Received: by 2002:a17:907:3e28:b0:c41:7e99:c6c2 with SMTP id a640c23a62f3a-c513ac99405mr479739766b.44.1795216178037;
        Fri, 20 Nov 2026 15:09:38 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad01b0bsm143289766b.10.2026.11.20.15.09.37
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 15:09:37 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so1679409a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 15:09:37 -0800 (PST)
X-Received: by 2002:a05:6000:2c13:b0:4a6:dfe3:fd93 with SMTP id
 ffacd0b85a97d-4abb41f4dc6mr9300663f8f.40.1795215802107; Fri, 20 Nov 2026
 15:03:22 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113210918.356261-1-dianders@chromium.org>
 <20261113130858.RFC.v2.2.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid> <sashiko-outbox-215033@kernel.org>
In-Reply-To: <sashiko-outbox-215033@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Nov 2026 15:03:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U=wMCvb2UXgvSpZxoBNJnMw8fy-JzfYFOtQGs1-=w-MQ@mail.gmail.com>
X-Gm-Features: Aa3M54pRDnkxai3VLH8umlmccjAtNqBNTUBcGhqs9gRyZZN92t4mYXIwkfZVL_Q
Message-ID: <CAD=FV=U=wMCvb2UXgvSpZxoBNJnMw8fy-JzfYFOtQGs1-=w-MQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/5] kbuild: fit: Support selecting DTBs and config
 properties from a file
To: sashiko-reviews@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Julius Werner <jwerner@chromium.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-kbuild@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Devicetree@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Nicolas Schier <nsc@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Manuel Ebner <manuelebnerli@mailbox.org>, Marco Elver <elver@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, Rong Xu <xur@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 14, 2026 at 1:09 PM <sashiko-bot@kernel.org> wrote:
>
> > +# If FIT_CONFIG is specified on the command line (either relative to $(srctree)
> > +# or relative to arch/$(SRCARCH)/boot/dts/), locate that file and extract the
> > +# list of .dtb files to build.
> > +ifdef FIT_CONFIG
> > +FIT_CONFIG_REL := $(firstword $(patsubst $(abs_srctree)/%,%,\
> > +     $(patsubst $(srctree)/%,%,$(patsubst ./%,%,$(wildcard \
> > +     $(FIT_CONFIG) \
> > +     $(srctree)/$(FIT_CONFIG) \
> > +     $(srctree)/arch/$(SRCARCH)/boot/dts/$(FIT_CONFIG))))))
> > +ifeq ($(FIT_CONFIG_REL),)
> > +$(error FIT_CONFIG '$(FIT_CONFIG)' not found)
> > +endif
> > +FIT_CONFIG_FILE := $(srctree)/$(FIT_CONFIG_REL)
> > +ifndef FIT_CONFIG_DTBS
> > +export FIT_CONFIG_DTBS := $(addprefix $(dir $(FIT_CONFIG_REL)), \
> > +     $(shell $(MAKE_FIT) -C $(FIT_CONFIG_FILE) --list-dtbs))
> > +$(if $(FIT_CONFIG_DTBS),,$(error Failed to parse DTB list from $(FIT_CONFIG_FILE)))
> > +endif
>
> [Severity: Medium]
> Does $(dir $(FIT_CONFIG_REL)) prepend a leading ./ to every entry in
> FIT_CONFIG_DTBS when FIT_CONFIG points to a file in the root of $(srctree)?
>
> When FIT_CONFIG_REL has no slash (or when FIT_CONFIG is passed with a
> leading ./ in an out-of-tree build so $(patsubst ./%,%,...) runs before
> $(srctree)/ is stripped), $(dir $(FIT_CONFIG_REL)) evaluates to ./.  In
> scripts/Makefile.dtbs, $(filter $(obj)/%, $(FIT_CONFIG_DTBS)) compares
> against $(obj) without a leading ./, so nothing matches, dtb-y is cleared
> across all DTS directories, and no DTBs are built.  Stripping ./ from
> $(dir $(FIT_CONFIG_REL)) and running $(patsubst ./%,%,...) after stripping
> $(srctree)/ and $(abs_srctree)/ would avoid this.
>
> [ ... ]
>
> > +    if args.config:
> > +        config = parse_config(args.config)
> > +        by_name = {os.path.basename(fn): fn for fn in args.dtbs}
> > +        config_dir = os.path.dirname(args.config)
> > +        dtb_configs = [
> > +            (by_name.get(dtb, os.path.join(config_dir, dtb)), props)
> > +            for dtb, props in config.items()
> > +        ]
> > +    else:
> > +        dtb_configs = [(fname, {}) for fname in args.dtbs]
>
> [Severity: Medium]
> Will by_name.get(dtb, ...) always miss in out-of-tree (O=) builds when a
> .fitconfig section header includes a subdirectory path such as
> [google/lga-blazer.dtb]?
>
> by_name is keyed by os.path.basename(fn), so any dtb key containing a
> slash never matches and falls back to os.path.join(config_dir, dtb).
> Because scripts/Makefile.lib sets FIT_CONFIG_FILE in $(srctree),
> config_dir points into the source tree rather than $(objtree) where the
> compiled .dtb and .dtb.cmd files live, causing process_dtb() to fail with
> FileNotFoundError.  Looking up os.path.basename(dtb) (or matching the
> suffix against args.dtbs) would find the built DTB in $(objtree).

Addressed both for v3 by simplifying how `.fitconfig` specifies DTB
paths: rather than inferring the DTB directory from the `.fitconfig`
file's location on disk, `.fitconfig` now supports an optional
`[fitconfig]` section with `dtb-dir = arch/.../boot/dts/...` relative to
the kernel tree root, and `parse_config()` returns normalized
tree-relative DTB paths (`os.path.normpath(os.path.join(dtb_dir, sec))`)
directly.

With that:
- `scripts/Makefile.lib` simply looks up `FIT_CONFIG` via `$(wildcard
  $(FIT_CONFIG) $(srctree)/$(FIT_CONFIG))` (supporting external
  `.fitconfig` paths too) and takes `FIT_CONFIG_DTBS` straight from
  `make_fit.py --list-dtbs` with no `$(dir ...)` / `./` manipulation.
- `_process_dtbs()` in `scripts/make_fit.py` uses those normalized
  `$(objtree)`-relative paths directly (since Kbuild runs `make_fit.py`
  from `$(objtree)`), so `O=` builds, subdirectory entries, and external
  `.fitconfig` files all work without basename lookup.

-Doug
