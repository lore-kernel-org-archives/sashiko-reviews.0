Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99701279DCC
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 05:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791867867; cv=none; b=sgpixieZYXVMx6FMvbxMX9ZcGZPk7XkG1kiJL+Qirlblgw0PnZtPPj+VCyYHBafQcGVsSK/Rj+oRTuQ4z59ptk9mqNhyyVZMNKsPpSK0Kz+l0RsxuaVQY7W/Un4dtBQGSxpC0hrm1/pHPUKuhO47NsAuxuy7R3v3bFEHlNUJyAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791867867; c=relaxed/simple;
	bh=lPeAKuvBpS0zDR3ZM12eKFjOvEO6x0q8LVcwfP1DIJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ly3MQ4p3gj7LIADpKLEzpZTmKbnRASmOA+AdzKzqL8dbsErWiUKur/C0RYp/Byr05/sZEHgeOShaLV4W+O4p/+QXNPcF15oeBdpjXABLuHv6z30UhrkSg5omEjy163I0SshnHb0YSu9ioTmN1qyYbNi0i93IxG+0WjUtnl8vv9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnKPWqNz; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnKPWqNz"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-451a49abd8aso2302232fac.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 22:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791867865; x=1792472665; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gTdVETudrkO9g7BtMaM+WFIY64QBuvndlnKmd0+mElY=;
        b=AnKPWqNzVhTy33kYwUBXQisEfkgElgm1yx7Vo7oPedZOpz6zlWjIUeTgPKd/rCro2y
         fWJVU16tsfUn24d2vsYrGZswLol6uk06JgXpvaEBhlCk5fR/sLWLWoX2CmmuJ7qXQy7E
         VHalBOAFrlMaQYP5yQKQ26F3J/43IL/DxOVcOv1KEe/Bkkr3clSF9bFkrW3y+MVE7fQv
         +NBftLbm3EktPeAMGpUS2RyGj8UVXZahSbt/+9wUhXxXbE3i21h8s6ogNcaKVHJ734Q4
         MJVGFOSP+BMRKBpe+8BVE89JTk69MHwdXJIWDp51dQU0UCkiuE2c0iufgqchWR4yTNcR
         jsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791867865; x=1792472665;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTdVETudrkO9g7BtMaM+WFIY64QBuvndlnKmd0+mElY=;
        b=hHnOA/Vp32kUx9OnydWQknAalNLmnbaVYvFgQ3HlXcLjSGB9gly2fXsofk5BI5E25d
         ES9xbL1Xiaaxrwtn0YUvuRS6ALsoWVNyh7WZukjGIcHYISzfF5Qbcy0uMh2mYuRotRin
         S0lwHRglwbWc6rmGwhTDdz3I+7OEM4bFZh9G4apGPkSOeYat27o0ANUa+svXWg0iL431
         5VBJM4ELbEf4oTc9d/scSWQCzCHpIi1jhdLmdnPjBtOhndoYLls2ZrLbIeXsqt7DXFvy
         iJCRgYaecKsc2ZfF5KSWO2tc1suoLz5vnI66E94PdTneCxCRfnL2tkHWyVzQklZqkV8r
         hyOg==
X-Gm-Message-State: AFq9FYLjxtN8JE16OSsyut+ZoWDrQud2yebxokrGXyvLOwh4jh/KXhIk
	8n47KoJfmY3oZBOmy8RBmJE3c1ciY3MAvfIh2JPZWhu1Qpp4atZW0MQFKdWIDs6J
X-Gm-Gg: AYBFou2zZOHZWEE2HnTr+2CoTbPZKF2BusCn1f4nHH2IpjOfeMMZd2RFvJCLrZvNJJP
	sYIRZ9uWcd2ySBA6NbBa1BqiwezP/VerFgQuj+hOYGoYF92JWE8IiPD2bciRLFc+kmngZKfZPU4
	fY0TS5c1BDZvugI/AIXBMyo23kixz0FHSq1RhRq282apuNIEhMTgVhphmtsdJuA4ZfNTunIaFm+
	/vmaS1/DUBOKXpTWtAPFYvRVZm7gpNt4JZj8Tp61Xn0JWW9oZ88NVh+9vVo5ktPDN+NLbwJFJij
	9Mgj25lRV17NmtrZw2HcR6ms/s8FoS1Mdl1jiQEo8sdG2k9IvNmd+n9+7FFJl90KRZDYZJp3tVY
	ui8oigDDzRuqAuCBW2sBXSI4Ok+lEOc4NRZ9yidrWIzMEqspbJAkhN3psJ4GB3Bri5rEp1qmhtG
	w7MC6FAOKRbYKwMOhmOHj5TNPyfH3wQ/cTuX7qlmOr1/HJXcrqxdwvZkssbmctDLEbFG+ke5tmd
	0Vw9jMZiwziPg==
X-Received: by 2002:a05:6808:2215:b0:4ec:4c7e:37b5 with SMTP id 5614622812f47-50c541775a7mr10580195b6e.29.1791867865451;
        Mon, 12 Oct 2026 22:04:25 -0700 (PDT)
Received: from gmail.com ([108.243.219.47])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c167544b5sm13557623b6e.3.2026.10.12.22.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:04:23 -0700 (PDT)
Date: Tue, 13 Oct 2026 00:04:22 -0500
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Doug Anderson <dianders@chromium.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Chris Morgan <macromorgan@hotmail.com>, 
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/panel: newvision-nv3051d: Use
 mipi_dsi_*_multi(); fix minor bugs
Message-ID: <as24ZjtrzICOkcj3@gmail.com>
References: <20261012-mipi-multi-series-v1-0-6a29add1ec92@gmail.com>
 <20261012-mipi-multi-series-v1-4-6a29add1ec92@gmail.com>
 <sashiko-outbox-168984@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-168984@kernel.org>

On Tue, Oct 13, 2026 at 04:43:35AM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Does panel_nv3051d_init_sequence() mask initialization failures?

This is pre-existing: panel_nv3051d_init_sequence() returned 0
unconditionally before this patch as well, and the cover letter calls
it out.

My plan is to send the fix, returning dsi_ctx.accum_err, as a separate
patch once this series has been reviewed.

If you would rather have it in this series, I can include it in v2.

Sashiko AI review: https://sashiko.dev/#/patchset/20261012-mipi-multi-series-v1-0-6a29add1ec92@gmail.com?part=4

-- 
Thanks,
Akash
