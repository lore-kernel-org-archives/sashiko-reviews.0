Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512523BB12D
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 06:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578208; cv=none; b=KeYRmxfTcCbv1kFhyO0xYBmCtkQeqzeiZ7axZCZ7uy2hmpCoWVC2tb9zhXJ/bQoX0mP3eyv1K3duIK0Z7jpwit5nnpB5wl+NNFCO7wfr48708l/NvvOOX3uedeu6+G24B93Ufr2x8w+ygfYYLfu0YbV18iTsUgC7ysO3d9OVO3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578208; c=relaxed/simple;
	bh=6k6AH65VQcAuAOD73lLD7Vqip7/izHhjjVD41X/BMAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjEy1yQgq8srzPlfY/uStSNuqjowXLLjh1UVeTXmfkDE2p/F1w7UKEnnAQo6JhRt0cOm9D4tS83gRMNNt0IhivFt9e8WD68ZpK634JXI76sftO7fdHLN/i8VYS9YlK4yPYOLM1soUQ/+tk1nq/ofn49w160WzrGRyqsz3pjxzJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szaSLYCY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szaSLYCY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c7cfa17fedso16468675ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 23:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783578204; x=1784183004; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mGK5PpdkeG1tH+ZhJlo9owU3s33aNVf8/NpUKSn1gO4=;
        b=szaSLYCYUdTd1m7RotBe9OJf3o9PDDSoTCGTTs1U5ldwQ+9Tm3b5zz/9T7+ZDgXU8+
         ZhhNMu/uC8X/1kK88xIzs88aQZxy1Kh9u/salzoEoWOns5YzEN0hYMyOn0XdDAT3O3a7
         ehJNiOtjoNPSBrK1KZV1NV7BXpJdkLK3CqwyIrNMd2rZlO0XudGqie6/ZNy+XIEmVyzL
         JEK2SJwv1hGIEGPdLv0Uqrd+HmHkZ2fy75vcZCzbW8bMlscQtiB8p95F1gN2jtE1PFX1
         DDbJT1Xpk4yDVx2ObS/Ew6+kS+RvWYFpOa2plFLw1kc9zryrRoOLxIwzR/u7SCOIFgrr
         v6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578204; x=1784183004;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mGK5PpdkeG1tH+ZhJlo9owU3s33aNVf8/NpUKSn1gO4=;
        b=FT4p8XqY7xEWSmvGoLGR1UFPrAz8IpR+4evaJshrtjY4Xo37lJ4k3ogTytNv7cMYGw
         KU1amxhc29OmW2F+xXmdV5vB36mq1ndz9CsDjiwio1jdHAa2vn+qbCB/P0gwnc8YEQpd
         /W7oxtUhFd1NOTLsgBp/kxk7Tpjm9c2JImv0mRNOUQ6Vrp8W8WddpIFErClrdvpPHL61
         cn2vFaNhG/t9hg8XyHuEDPT34f4YKPqMm4/Y4FhR2fl7fjt6LB8/SfRVvJOP5kX1wkEq
         k5sQJyhTF0aFKckvhe0q5R+EuTh4qBfNn9D3fW4S9mtPpY2DgXxAwTWjIiNWrdSMhlJD
         KzdA==
X-Gm-Message-State: AOJu0YyP1csdWv2krX1JKvIbTxmgeprujpUaZil2OI2pjB7XDYhT7dRw
	DMRjrh7jaLDW9juqWNe1pQRIaDXx7E+JTutambC0OT0ENwYD7LiVVIwZy94xkQ==
X-Gm-Gg: AfdE7cl9VM09jBynWzuy/VLLO8klJqUWTQ9o2BNoHJalA5QzlVLrBLPQm6QW3kFqyvd
	BKjaTYsK2jZic5acpkjXIP/KHGL3ee4K708HNqxAiRuyFLrkuD7I1cGjSvJO39gpZkB73Il2a95
	KhqvLNnG1UVdmn7lKisxicBGxStP9G6k+DvWD5uyNd/t4VF79cBTxcrUuwuCkaeimYmD8SCWvbD
	8iCUZNj7kUCCjlxLSLX3MWhdrWJwD3n4/222C0r0cPg5RBmtxU6SPWrmvg+MuF1cLT7QQ+GowlG
	RLf2dMZ4hUz9FWTo/JcL9wX2aZPHrnYHj066893JzN/4tty2njOrTL+dwFmJp7BISWpWVFVnij7
	hUMg0FHj5arD2RQO/c00an4KHHEFMUERojc819CeUUCqSkabShqw4BhQo8dxYxUrymIc49LPzKX
	ct7C8WQOxky7q7m4H3psYGbAJeHgxKftkwiA==
X-Received: by 2002:a17:902:ea06:b0:2c9:d277:2cdd with SMTP id d9443c01a7336-2ccea2f910fmr61268075ad.13.1783578203614;
        Wed, 08 Jul 2026 23:23:23 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1eea1sm38618355ad.46.2026.07.08.23.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:23:22 -0700 (PDT)
Date: Wed, 8 Jul 2026 23:23:20 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v3 01/17] riscv: Introduce instruction table generation
Message-ID: <ak8-WCPFEGGvLubX@blinky>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
 <20260707-riscv_insn_table-v3-1-3f8e5f75ba97@gmail.com>
 <20260708035048.535251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708035048.535251F000E9@smtp.kernel.org>

On Wed, Jul 08, 2026 at 03:50:47AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Zcmp compressed instructions (e.g., `cm.*`) are incorrectly generated with 32-bit sizes instead of 16-bit.
> - [Low] Unsupported instruction extraction stubs lack a return statement, causing `-Wreturn-type` build errors.
> --
> 
> --- Patch [1]: [PATCH v3 01/17] riscv: Introduce instruction table generation ---
> commit 893d119e65d6edd9ce9e98809ffad3450c8d6a8f
> Author: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> riscv: Introduce instruction table generation
> 
> This commit introduces a shell script to auto-generate a header from an
> instruction table for RISC-V. It aims to replace hand-written instruction
> macros.
> 
> Link: https://github.com/riscv-software-src/riscv-unified-db
> 
> > diff --git a/arch/riscv/tools/insn_tbl.sh b/arch/riscv/tools/insn_tbl.sh
> > new file mode 100755
> > index 0000000000000..f09b93951cde5
> > --- /dev/null
> > +++ b/arch/riscv/tools/insn_tbl.sh
> > @@ -0,0 +1,258 @@
> 
> [ ... ]
> 
> > +        non_compressed_insn=${name##c.*}
> > +        invalid_inst_functions=""
> > +        variable_params=""
> > +        constraints=""
> > +        match=""
> > +        mask=""
> > +        make=""
> > +
> > +        # All compressed instructions start with "c."
> > +        size=${non_compressed_insn:+32};
> > +        size=${size:-16};
> 
> [Severity: Medium]
> Will this correctly identify Zcmp compressed instructions like cm.pop?
> 
> Since they start with "cm." instead of "c.", the glob pattern c.* won't
> match them, assigning them a 32-bit size instead of a 16-bit size. Could this
> cause the generated insert and extract helpers to wrongly expect u32 *
> instead of u16 *?

I'll make it check for "cm.*" as well. It looks like "cm.*" is the only
other possiblity but there are some names like "czero." and "cbo." that
prevent me changing this to matching on "c*.*".

> 
> [ ... ]
> 
> > +            printf "static __always_inline void riscv_insn_${formatted_inst_name}_insert_${variable_name}(u${size} *${insn}, ${type}32 ${var})\n"
> > +            printf "{\n"
> > +            printf "\t*_insn &= ${insert_mask# & };\n"
> > +            printf "\t*_insn |= ${insert# | };\n"
> > +            printf "}\n"
> > +
> > +            if [ "${only_base}" ]; then
> > +                invalid_inst_functions="${invalid_inst_functions}static __always_inline ${type}${size} riscv_insn_${formatted_inst_name}_extract_${variable_name}(u${size} ${insn}) {\n\tBUILD_BUG_ON_MSG(1, \"${name} is not supported on non ${only_base}-bit systems.\");\n}\n"
> > +            fi
> 
> [Severity: Low]
> Do these unsupported instruction extraction stubs need a return statement?
> 
> Since they have non-void return types, omitting a return could cause a build
> failure due to -Werror=return-type on supported architectures like RV32.

BUILD_BUG_ON_MSG(1, ...) makes it not cause an error when not compiling
with -O0. Adding the return will add 4kb which is not a major addition
but seems best avoided. There does seem to be a handful of other
warnings that are emitted with W=123 set though, I can fix those up.
Most of them are about some type inconsistencies between casting.

- Charlie

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com?part=1
