Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692EB3ED5D9
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 15:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779723841; cv=none; b=P7mOuJIYzrNJJbqlMNqhBQg2dX8FbFa68buqDNqePSEhTSUql+TB9ehQUOM7CJc47/Z6LhjTEPc1NXX5NL9U4DrespPxZm9R+wF9B618eecs3FecQfAdFW/ZVAWt0W3Choyq6clgmc3WUzI4+QUXADiOUVXYRyboPQYxsur9Jt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779723841; c=relaxed/simple;
	bh=aMZRjOFT5FjzGfTu9MbE+34/GXhCUK+r+60ybmg16ps=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qp6TiBZXXj6nLz4JV3FiZRyh+sKMPB8WXmju4bj+F3NPszVJ9BRAYA+CQGkUhww2MFyb76VzAMenxo6M5mbYOnzYl252ZW9PkEu53738GvCyXHyy03HqRClUbfysHf47vVY9LsQ58hj2xZP9J0SIruHbPt6dx8BvXvlAVO9PWi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbTI9idH; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbTI9idH"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so7425036f8f.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779723838; x=1780328638; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=abZqFBSzztWZdpGscSRSKYjWVyMSes28s0s+iKg65LE=;
        b=AbTI9idHKXyA+XP1ZapjPSmsipF5MqnkTbug3q38LvvNpupupHOWwlSwE42L+tMo1x
         BgL/3UbCJbRQFYlRSDV3wFEFG36lQYMZ9N9pbl1G10lELF0rHzcNRMGP0MkyYqZUMvt8
         JKP8FnkNdwz3cGZzlpeoTiVs54wOWGoYVjD++fJUBRQHp8ubMITVr49pFX4JTxp5vcg0
         ddKPYmZTX+nENkPOsrZO3NmUNDjt92uX6NqxUIIgms25IOTVjG/48Ihmm6FkCEfVPMSh
         kZ0FbQv/vDmKh8wGp7/MyktingD+1AyUKuP6DW20weXP2bo1VauyLSjwM5LKLLp+DQjw
         OtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779723838; x=1780328638;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abZqFBSzztWZdpGscSRSKYjWVyMSes28s0s+iKg65LE=;
        b=HMcEoixLi9P3TUiAxAydicd9ZDDbtTrb9ARU8q1eEjCH6xyi4/k7GTk5WdAeOFnQA6
         oKL6eKLjTFPoGNSvfDuz+4wh8jTmKpbMCyeQb/n8r1FwQryBkbByceaEVGEG/iTafscH
         GzyR4IIkXd+yvztlIETIR0aU73Czt7m/Z77dVPEBVHMY8rEwIzu2TA1dNjp9VfjPgakW
         qtvuWGdqjJYjxiL+/DwSKtjJtqeBVq1M9s6VdQP2YXh4Qt2MP0n9GIUio3mAtfN+ucWL
         4wFtqHcV0NMYTI9Azzr0loXOwQPIPduK0IUSXWKyDMNW1JQcTJfW/d+WmoN4FLYA5aId
         jNqA==
X-Gm-Message-State: AOJu0YxuC/sXOpqxwTvw0zsPbJc3lKNk99qAXtugHdeLfjFyTB8fGii8
	xU2mvQeKpUcTzpRnNru+r/U2OiiyUL2syYt4py8BVVauPpXiv1Mx4D/acOpAnuVC
X-Gm-Gg: Acq92OHK1BNoNuqZbvV41kESMUHxY6ryPAx1T7pSC2PVrDOscSyaGa86g8VBEMZEoOo
	o+vwDmk4oMH1dO5lGdZvKKsQOSgRc77NnpXKi1TvAovituI4c0WIEAlrqAOTjarnvXwMXdVriIm
	kXd5htLxW+i1Voc4ecWrtF/aw8Ml24BYirj4uUgO5W465zLQken3zd4pFAn+2Ia96zSmjMpvRZm
	vlnxU/yLyLFGVr7qkj3XJHkN0PsdQ1bHFLFuNgNFb1l9GGKlCFSIT3D6WybUYCYIVz6VU83dtAk
	VeDMApYnMipjC4TL3HVf6STkV1fcY2SXW7nHq3eop1pE9R43HpnugQ/D1GlDrH4ustact6mBMqk
	Q0S0RvY62uDchUHI3gF+hclwG2VS0Fq/Y81DS2Z2qY+x9XLHr04HD6zql4oX+Zwl+sW15819ynH
	OXHyQYslcyEAE=
X-Received: by 2002:a05:6000:4283:b0:44d:261:54c5 with SMTP id ffacd0b85a97d-45eb38b7934mr24032618f8f.30.1779723837463;
        Mon, 25 May 2026 08:43:57 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm27025259f8f.30.2026.05.25.08.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 08:43:57 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 25 May 2026 17:43:55 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv3 07/12] selftests/bpf: Emit nop,nop10 instructions combo
 for x86_64 arch
Message-ID: <ahRuO6X_Kox3tVXH@krava>
References: <20260521124411.31133-8-jolsa@kernel.org>
 <20260521132121.EEB4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521132121.EEB4E1F000E9@smtp.kernel.org>

On Thu, May 21, 2026 at 01:21:21PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Changing the USDT_NOP macro to emit a 10-byte NOP breaks libbpf discovery, disables kernel uprobe optimizations, and relies on an architecturally unsafe patching concept.
> --

all the other changes are in other commits, I keep the changes separated
for now, we can squash them later if we think it's good idea

jirka

> 
> commit 963f950434fd00b2b52a00da58d5968fea9d4ebc
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> selftests/bpf: Emit nop,nop10 instructions combo for x86_64 arch
> 
> This commit updates the USDT_NOP macro for x86_64 to emit a 1-byte nop
> followed by a 10-byte nop. This is intended to test new uprobe
> optimization support in the kernel.
> 
> > diff --git a/tools/testing/selftests/bpf/usdt.h b/tools/testing/selftests/bpf/usdt.h
> > --- a/tools/testing/selftests/bpf/usdt.h
> > +++ b/tools/testing/selftests/bpf/usdt.h
> [ ... ]
> > @@ -313,7 +313,7 @@ struct usdt_sema { volatile unsigned short active; };
> >  #if defined(__ia64__) || defined(__s390__) || defined(__s390x__)
> >  #define USDT_NOP			nop 0
> >  #elif defined(__x86_64__)
> > -#define USDT_NOP                       .byte 0x90, 0x0f, 0x1f, 0x44, 0x00, 0x0 /* nop, nop5 */
> > +#define USDT_NOP                       .byte 0x90, 0x66, 0x2e, 0x0f, 0x1f, 0x84, 0x00, 0x00, 0x00, 0x00, 0x00 /* nop, nop10 */
> 
> [Severity: Medium]
> Does this change to a 10-byte nop break the libbpf discovery logic?
> 
> Looking at has_nop_combo() in tools/lib/bpf/usdt.c, it seems to
> explicitly check for the 6-byte sequence (0x90, 0x0f, 0x1f, 0x44, 0x00, 0x00).
> 
> If has_nop_combo() returns false, the target IP won't advance to the
> multi-byte nop, leaving the probe at the 1-byte instruction.
> 
> Since the kernel's can_optimize() in arch/x86/kernel/uprobes.c requires
> an instruction length of 5, does this cause the selftest to silently
> degrade to the slower int3 breakpoint path rather than testing the
> intended optimization?
> 
> Additionally, is it safe to replace a 10-byte nop with a 5-byte call on
> x86_64?
> 
> The 5-byte call pushes IP + 5 to the stack. When the uprobe trampoline
> returns, execution would resume at IP + 5, which lands exactly in the
> middle of the 10-byte nop sequence.
> 
> Could those remaining 5 bytes (0x00, 0x00, 0x00, 0x00, 0x00) be
> incorrectly decoded, leading to unexpected behavior like memory
> corruption or application crashes?
> 
> Would using two consecutive 5-byte nops instead of a single 10-byte
> nop safely provide the padding needed for a 5-byte patch?
> 
> >  #else
> >  #define USDT_NOP			nop
> >  #endif
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260521124411.31133-8-jolsa@kernel.org?part=1
