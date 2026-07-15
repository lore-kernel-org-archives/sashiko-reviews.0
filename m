Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CFE3B8BCB
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 19:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145206; cv=pass; b=RSGwtbI8gDyAlet8C8uutC9PNHi3WJwITf/8fcBMJBJ18THpklqh6gwI6J9S1rXfPdnl8V8nkDRNeIBRO4m4Ur4ZC1oWtYK58ovpUKxe6uuQ2LHXyUB2p9v3UTDTMi+NEpDq/2xYSrDf1NZUo6TEwEQSlcGePPU+TjbwjGb/Hwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145206; c=relaxed/simple;
	bh=6aYsyLRIT7+vY7T3t5Bn20VE9ftHbJ2BhHft7v3ul04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPHJBN6hI9GkFN0fTQP4d1O08kAs5EHq6gHL3FGk10+xGUqRYamPOJoCzFBGZcpirNCNzgm7NGNb35+Ie0Lx7eOCua0Yg3jHwwTqOhEcAG+RlvwwUT+zhzWr2fvTQ+T6ZZYKtIT1lV5NwuvpIUv0qxXGJNgy7JxVGbQXf8oaoLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YX4k5vwo; arc=pass smtp.client-ip=74.125.228.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YX4k5vwo"
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c15e9a2f51aso135849766b.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 12:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784145203; cv=none;
        d=google.com; s=arc-20260327;
        b=WqZawrzGtdEsyvcsmZzqOawmaKp1R4IelAiHoxpUvYcNk7yI26/8dTgDQEam7/+rs3
         p1lnlq8PWze3UDkzOzegCH42862qOJiP3CTTu6q+C2G02ezxZw3AJ/dzYWnyXs4XSaiS
         YIju+jVmu6oFftNDYq0EiWKNdJTPh/FkYx2wp5zylKWu+x7ALGzUiB04GEYgyYiifx+H
         779l/e+ueruNeUkdAuDbcyzHQhL0aKAq4b9AfdCnJj2b8D+c5nj+rXwgMdm2UQp6dXTW
         1Ti+eKPmd/u4NlqADTQ65va1jchBRaud71G67+9gJI/g7Vi+qI3NXl4UGIOc5a7JosnF
         7+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6aYsyLRIT7+vY7T3t5Bn20VE9ftHbJ2BhHft7v3ul04=;
        fh=S/E1D5XEh/0vaSx1NhleHoQMT2Uvk35eh9yQNMkx2yg=;
        b=kL3Nt/MuWnhjShcDC07HFTA3xujbF1Jy/aA6Lh9ep1SipTr0Ikr/xG9ITFQXrH+JZb
         KRoGc2zv6CojfQy1j3iBGfJmGa3qBglCdAT0fE3reL6LOuYSNPeRlgiwWRiNQk+lqAtn
         WbYjTLiEZhcDZfOIuoZ0HjjxEnUm6g4SVwvp63RQtCjm2XtOCmPuW22AIPwi26k0Sy4c
         BXWyUIPmfC0doO6McmLwk1QR6ikazVuDES5UqvNcvdhtWFIGI3jl3xUi23a6j5R4Jdkt
         ODXqrtwapSBNzg+ipnv3HapOhqd+qhujekxIl7qP+cEX7v6vzKMi0VlCp/L5JfGB0P28
         +H0g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784145203; x=1784750003; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aYsyLRIT7+vY7T3t5Bn20VE9ftHbJ2BhHft7v3ul04=;
        b=YX4k5vwoRImaQE4fziizSsa4HjE/rqI/8SKziYh/JfwXhYqwVUCthRvOoQmHeaEgm6
         1cF17QR5/bZXblLLQBGAAcY3RAaYMCEgflJVNpNhGPgR9fdXMPxBikzwn7dgowz5eQOU
         RU9FGiCRtb8oLyKJwpXga+XP1bzcPCk3ZxCGFHjVO1CBj8aQPrBWZiY5kUcNk2QbefAk
         oI0shWUlmkZI/G/LIQYOpCnpEP/y7fZE77Qipnc0/IymE0adSI8eoo4OGihGJFQoBZRG
         Di8ORxOnWgxN3zpafOvYCLHVeD5hsJy8iZA1BfDQkqRir+24CULhe3gBVNl+iAbzH1Ya
         tYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784145203; x=1784750003;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6aYsyLRIT7+vY7T3t5Bn20VE9ftHbJ2BhHft7v3ul04=;
        b=Dqo34+ro9qN0a/m705gqZbIALrHjRqsegLkj6kAV+NuF7KnpcWm+fkP70krbL1FubA
         FK3Bs8Mqybc3Nw8zZBt46yQjAKTgHxAp3a296FfRmNHycdLqBeY9CDnbcQ2bkqie0I25
         dXCKe5BQLaZZcB5hbn0GdfLHqIaJUYqeQgKyX+MLLfNpru/0uldDkOp6/rv8M1n1+JUN
         8dLXkGZOjDTAowsC0y0onObcEkZrw/hjBOJfuhnlBum+05g1HQCUuzvkPLFhY5BdYosI
         i073VbhgcSEzsIWoKZmjg+J9b32E7HuqFAwajaBfSranx+3TDmuaC4SPIHL/+veJULlD
         unhA==
X-Gm-Message-State: AOJu0YxUQzm+569OpD92m/gvkmCuFJIVCfGHPvA+3aHEakoa9tFJju5u
	jIT1yha/CSecA2tJw+eABxD1GyDcN0ThGNUsBVENAc/TJepRDHTeLC0hkJ7e969oDk+AZpa2T3m
	pCK7WgE1WA7QfirGneXpQzJgKqYnMxSHJVFOQJ5u/wM9SMig=
X-Gm-Gg: AfdE7cmByIyYdSI+ycL7DTGJO1q2iyP1AMuBjO3lGA2l3jFDL8GIcnSv6nJLJNMRziv
	xJL/BwKLwHeilDRsjUIAHJRyuIHGuZ56voSWXJ1VnhFqkc9sMZ6V/pLLArErkx3WtvfLgLyyJqH
	AEuRnDiblHMIpFGTNf4eVuKlzENPX/yu3vK0aFdPljHUbSHOF90zH1eLAROBsKi2OSfTFIL5STM
	6/4ZdH7DE8lQaKCby/oPuQE2ziKTGlTz5G5OPaNic0OjXJimjDe8Lj0JjQYONlTsQLDhtQVPFU=
X-Received: by 2002:a17:907:1c09:b0:c0d:43b2:e8e7 with SMTP id
 a640c23a62f3a-c161f3536b6mr986415666b.35.1784145202911; Wed, 15 Jul 2026
 12:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-3-coiaprant@gmail.com>
 <20260715191449.437E11F00A3A@smtp.kernel.org>
In-Reply-To: <20260715191449.437E11F00A3A@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 03:53:11 +0800
X-Gm-Features: AUfX_my3OiYGnoG1-0LHJeJhHkihNhk5NRWBF7PzkFitZB2KLvNMBb4XjsCN-hg
Message-ID: <CALj3r0gK5atP4An=04Bjery3_A1n4QwWF2tkQk+TmPemKDOMOw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/10] dt-bindings: phy: rockchip: naneng-combphy: add
 rockchip,sgmii-mac-sel property
To: sashiko-reviews@lists.linux.dev
Cc: olteanv@gmail.com, devicetree@vger.kernel.org, 
	linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review. I'll address both issues in v2.

> --- Patch [2]: [RFC PATCH 02/10] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property ---
> commit 0d950b4055dd144fecf5059f16535f2c8d94b5d3
> Author: Coia Prant <coiaprant@gmail.com>
>
> dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
>
> This commit adds the "rockchip,sgmii-mac-sel" property to the Rockchip
> Naneng combphy device tree binding. It allows selecting between GMAC0
> and GMAC1 for the SGMII interface on the RK3568 SoC.
>
> > This is necessary for boards such as the Ariaboard Photonicat, where
> > the SGMII interface is connected to GMAC0 and needs to be explicitly
> > configured.
>
> [Severity: Medium]
> Is it actually necessary to explicitly configure the property to 0 for
> GMAC0?
>
> The schema defines the default as 0, which implies that omitting the property
> would naturally default the hardware to GMAC0. If explicit configuration is
> required, does this mean the hardware or bootloader leaves the register at 1,
> making the `default: 0` documented in the schema incorrect?

Regarding the default value: the hardware reset value for the
`pipe_sgmii_mac_sel` bit is GMAC1 (1). I have updated the binding
to set `default: 1` and revised the commit message accordingly,
removing the contradictory "default 0" statement.

The default now matches the hardware reset value.

> [Severity: Low]
> Should this property be conditionally restricted to the RK3568 compatible
> string?
>
> Because it is defined in the top-level properties block, it will pass
> validation for all other hardware variants (like RK3528 or RK3588) that do
> not actually support SGMII. Could an `if-then` block in the `allOf` section
> be used to set this property to false for compatibles other than
> `rockchip,rk3568-naneng-combphy`?

Regarding the property scope: you are correct that this property
only makes sense for RK3568. I have added an `if-then` conditional
in the `allOf` section to restrict this property to
`rockchip,rk3568-naneng-combphy` only.

Thanks,
Coia
