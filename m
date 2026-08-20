Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F260442FDF
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 12:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787229527; cv=pass; b=aPZql05xg1ubNaLWcXlKHOxx+09AWefVlSivV9lKEoRSeZ0EskXOztpN2yfapafCirltGO++grneT+r58j4b9eHdoNy5PEl+DGTiQq3xjxEqHtu6yo2BVgan0zobdSEET/Atvmk7zw56ZVyQkGRwwMAzJZ1JR6p+qsvPRyuW24I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787229527; c=relaxed/simple;
	bh=VM1MWMpecoO3oBSY0PExAdSiWynZ46+1n09KsPJoLHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFI4SCr2UVIljQkyM2Qj6vGWWXA4219SJ/qLIIPd/914dPkFUGCVaGnG9eeqLO+WNGHl2H91kany5sMkGihRGNnbHfUGJvtRhE+k4PDM7vrP5malX5JlvxLpTj3t2ys0gGQ+2vJVp+IOV8FUEJO+bNNQknxQRmkvRiCn5WWuy5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naBAEjkk; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naBAEjkk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2055573c8cso321368466b.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 05:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787229525; cv=none;
        d=google.com; s=arc-20260327;
        b=rKNKJvo2/8yszdkbN5Cd28J63DGuiG6WQvoSVd99K0tmre6zqz3X0M908RCpe5EGbZ
         7vmkTHjVbgStdvms46saNK0uExSmV/x/Hm+p5rWI9AQ49m9NeI2kO5pv9dza39U6qBH/
         fes5bxhASH7jwmkG8kGZrFn06sAnBj9laWENhmjDiUd8YgY4RGOf+jvdC1vQhjepUkh9
         ndIxlD7E0QfGftzyHchTPHXP0sxOaPzXn9XE4p9onbXr36hrUdzDEXWsayjWFOXW8Lia
         NrmbisRG8LM/AvVwYDqqD7fm4T6Y7xLderktXHfEV9pQtPekiuTvE3ly3EYU6A9kuAlN
         W/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pg/JlBFq4DxSKWz7zIecQXsZEO1ggjN8avjeEqTyt28=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=fMBhzzk/hI7zc5SUa43lZRRQi8HTuhuMssRDkVxSQqhiMXENzceWjf9vxHmba9+wkS
         HOEOC0V/y+NoRLGW0VGMM6CNlagnHphgOgiJDmJqanW/lM8FGL/Ty3HbyZ9U7et9auSm
         KpxjGrMQ6mRdiv+OSgE1a38bhBlyuLDFGRpgaKO/PTu7RK6F+Nm08khN6kWLsZJJy3fF
         T3a76P8LVTcfuoaWnb3yPHjIsHkrZIjg08cO2you/ZHENh+9mLM9GuNBJiyKY4S9yD/C
         zGs0gPnnwjbueRWI9jBEkW97KypqFUbnQZlG9wKZWCU4FbwJ0q+fG/gOLDllrAaTyeNm
         ZzfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787229524; x=1787834324; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pg/JlBFq4DxSKWz7zIecQXsZEO1ggjN8avjeEqTyt28=;
        b=naBAEjkk1H7QirWaPW29sq2eIo6l8V1gG5wKSAy33mQTKBa2KQkdc2t+L+NF0/2L//
         vg9SyQsFbMCjAM7AXNhY12IAToIUCEAWm3ww4LB/W59xbUPBQ20wqmYsAwgQbHldTCGZ
         zupURX8DoITlWhpZA30OPZfIHKcLDy7wES6sao3G53V+BHlJpquxt7dB3SxdYxsZdg5I
         vXPFayIccIV720Aicwo83ljo+RRDh+enOx+7XrAnMr7ZgmoL0jclssMnGTvJohgfYTP4
         TLDUBASJIIAbcRth14Vxw7Q7cxpS/XHo+3my+Co5hdyWvcKxHtZRLWkLbIq7APlqp4Kf
         IaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787229525; x=1787834325;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pg/JlBFq4DxSKWz7zIecQXsZEO1ggjN8avjeEqTyt28=;
        b=I7e6jRHwqUSb9xsJu1MYdRKPhPBeNyLb/1eIiqeaD4Eed9y7CvJkDBErCWcoedfU5g
         VLOmp8z5yUhSgEwm55nIsjfGdhCn6TvTXld4yzpSpQNGLo9qIxDejCy7MX2Igf/KTI6R
         GlQ51iVXXB0ttWnzQUtE5zKgOY101/0ER45k2k9agERUsWcJJmiSIoDp3uLTuHybXINm
         B1JIpdMJYx7F48c2gur/XK+yIYFymva/irCe+P9cgFJr9oWgSStmvwWqG2r3xAdJWa6K
         guOBWf3MDO2Lav9jfnQuEKXQFVtRcpY2yxlFYIt69c72rZ3liNTZAZk1Ixdoh4+c4I6F
         PTEw==
X-Gm-Message-State: AOJu0Yz5Qb+IOo1RzNy1C2Dw3ODhNOA74sEj7BBKHkqsUNGNghxLOmGd
	tjV0Pr/bEjugCyouPQHDyWyIDydUhR6Pz8WozpHMyxT7UQckF0V5Zb6aryb0pOQAtqIqGoIxZ88
	hHXb0n5tgttNJf4SxZnocH3zEushUJjzIEf6w
X-Gm-Gg: AR+sD13BQV5QZFMq4T2FGJCm/pV+Bmhj30L/A7poxibE/VhHjeMGTrBmgmR63p38kCW
	or1FvhrN3ZF7Va+YB3XtCA4QCPOR8VOxaIGLQ4M/kvedhQ6iuaB2dab7nO1mz2yuQa9dz0YkIze
	asoXiiqyKavrkC/gP+Z9LFW0heAqk3NzHvn569RpgovJK4LZTskfwxNIoa0SGWMTjR5O9k8GGQi
	064pbvuSi2NXEjCx3TsRWnqsO5im1xw4zSQ0R0/VjJS1a5O7FTI/UUvmFIvR7BmhKO4HvDs1Nsk
	Reib9ha7OojBAs1Ol1DdUrwYDAg79ttKSWrlSGDPFMjFM4pDt5V+FtJe
X-Received: by 2002:a17:907:a643:b0:c21:7f24:968e with SMTP id
 a640c23a62f3a-c23e87191camr972568266b.11.1787229524502; Thu, 20 Aug 2026
 05:38:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819010523.1057789-1-main.kalliope@gmail.com>
 <20260819010523.1057789-2-main.kalliope@gmail.com> <20260819011611.014451F000E9@smtp.kernel.org>
In-Reply-To: <20260819011611.014451F000E9@smtp.kernel.org>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Thu, 20 Aug 2026 08:38:32 -0400
X-Gm-Features: AcwNN1U71KYur43I7SB9OG6_Bx05_bbubWfeh1nXgQPx2RdwViSfURIcB7d606Q
Message-ID: <CAJZwKkg08J_ZD4cTDX+h6Dz3-Rv7FoRpknb9e=_r+=4rTjxmTA@mail.gmail.com>
Subject: Re: [RFC bpf-next 1/2] bpf, mips: Factor register moves into helpers
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review.

> This is a pre-existing issue, but does this switch case in build_insn()
> silently miscompile BPF_MOVSX (move with sign extension) instructions?

Yes.  Patch 1/2 is a behavior-preserving helper extraction, so that
intermediate retains the existing behavior.

> Since you are refactoring the MOV handlers here, should emit_mov_r32() be
> updated to take insn->off and implement the proper sign extension logic?

Patch 2/2 does that for both emit_mov_r32() and emit_mov_r64().  It passes
insn->off to the move helpers.  They handle these verifier-valid widths:
8 and 16 bits for ALU32, and 8, 16, and 32 bits for ALU64.  An offset of
zero remains an ordinary move.  The verifier-inserted zero-extension move
stays on its separate path.
