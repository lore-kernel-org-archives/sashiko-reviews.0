Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913910;
	b=0m+uPIhxKnPKpyhNJKbx/kdEv6XSmzSKE8yfRFj2CNe/vWqrDUq7ur07/zmCenP9JIkl
	 nMPsG9VLNghUCagCijvmg/cnOiWibSgQGIIwXBFvfnru1ieCGIFpKHITCIiBrZVre2L17
	 E7/WyBL2Au8LjBlwxp5LrQ2LTOUOS319HJQa9bjZ9S2KyPCRzMGnKVpDl2Z+iQhUaL7+7
	 XEI3Xyhzf/7koeknctc7iiN3ARDdz3hMsHOSnPmLxC7CX6DqPZgKuTuvQr6ot146HWTpa
	 FjfhQjJSDbA/QBaXRc7Z/49tOQ5bfd4UHLKog7oyz9e9Mm0wddmnMDmsr1IMV4ROtsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913910;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=maoS8cQCvuqXj/lnZnTdjD2Cp+5OfO5EJcbvlMlmPAA=;
	b=LOU4fwQAFqpwSsqVOUhaBmRpLuKO64BGBjIG59vyn0LDJczWnC6h2U7g3bhhGqIA/rrd
	 L6qrGk2Utv4ccj7pjV63m961JQHqoT9+IJDRVJkFfl1NNM0rdIlB8QfVfJW5pNpkpVEme
	 S2WDN7FPaJBatveVLmNARMTbfqUqyt6A+R2lD8yVv9CoC7tGOqqE9yUzBV89+oylvvsCX
	 F1IEpnk2AzG+ty5DifDmNRkTu/KZBs4u0KADQ6ohobEGZhdScJ11RUFl7qmGFa8zGyTvS
	 g0xDLRi8XWLsnBMsfKvatgAT45GfiPncNHdRLJO3zm+4bJdiqZeFI2SK6OStt8XFGjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C51606A329
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 21:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44C51606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so587369a91.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 13:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913909; x=1794518709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=maoS8cQCvuqXj/lnZnTdjD2Cp+5OfO5EJcbvlMlmPAA=;
        b=J0xs3/A/RsPMLQ7CYruwUF6rMMpkFWkH9126jE97nTeNcuN2PHzWmM7M2R4epoBEJ/
         2d8OEFFG6jetnN7moI83U9nT918ZdON2qsuSkBKogqQv8umAEP6V2vwCyIvVAKD+dNzO
         eqf5UU9M6osiYlG9jrKFXAmc97qdqNZ0n5ZE4ZsFutWDguBms6F5jdrnKOp4l3reQ5gh
         q5WLHprSgRC/whk4g2JRVACo5YKX/x3lzZGSNvHdvYe0E5Td/l7tWMuP6qEl5kkKJN88
         eB5NmLnXuzfmTCxTYGl1FQMFTKvLHOt0L+BhLrbS1lFDqXtW8dMts4yU3mPyVCRv9lfc
         F4/Q==
X-Gm-Message-State: APuU4Z8J2eB94LWnbsSsHMvXgSYBGWfGK+VjyGvQnqoOwT7B/8rJ/zyx
	15zHWszJ+0cnO2m7+Z++lNXtJU9Db3AIo2w7ZDcbj7vIU2DH67iE3K3APQazqg==
X-Gm-Gg: AYBFou2/aUmIldNE2kWxseBiiTftqxsWEkqLHxL8zSp7UFwG4NujrfaGVYcHK9e4qY0
	hGTeTHksaiAtba0z0l3wY2AM2slOn/mCib4eqR50S4gCNM6z51b74E8rbwlfXph65dFbVIizs5v
	1pw74ePvANHmTGXz8EQ5NITmTDf6DilzPy3rK/87BdRa/g/crqUpHVVML8vMEUgFWYdyL8c8yvj
	f+fmCqwLevbdFOLAswjwVcFwaKpb1WRbR3DGA6NN/No+8mgKVjpgE3AvaXBLFVeqr2WUzLhMSJl
	abqkjVzQlsdqeBK6y0rAfhZr7ssmMw7sEc6i2q0Wp7MUgkgFpSmSi9NHuXpsNcNpZP4G+kNbx1l
	kF+1gL2G8VWMeO1E9egraLFk0xR/XU4pyov2lyHClo8vQEghCjzUHtkHcImX9ZbGl8lOJ1z3Acx
	R/2fRr6N1oTNyP09fuy/VlF2gygDbbpihQrN788lisoBvk1SL6RA6sot5AGK6rPDdjmpoFXtGQQ
	q7fYKp4hif97LAiPRbx9o386ajjP4hHLCPRMRmX6Bw9Q/i095mWQa8YpYAkGXdrzg34qbi+elfg
	oJEkmemohDwE9hezvxGUeEXI78LeEzrW7DYy8841BHLT6V1G2iEZLVQWkry63O/Fm2/0kpK18s1
	SidjuUMRSm0NdNfl0CHmuODiQuWefpU7ZFNq7qtcJb8g=
X-Received: by 2002:a17:90a:d647:b0:3ad:a232:4044 with SMTP id 98e67ed59e1d1-3b0db709158mr243294a91.38.1793913909482;
        Thu, 05 Nov 2026 13:25:09 -0800 (PST)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b72d5asm4315910a91.4.2026.11.05.13.25.08
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:25:08 -0800 (PST)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36f8cdd30beso133147eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 13:25:08 -0800 (PST)
X-Received: by 2002:a05:7301:430a:b0:35d:d671:933a with SMTP id
 5a478bee46e88-36f7671568cmr450176eec.15.1793913908114; Thu, 05 Nov 2026
 13:25:08 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-2-a15965a49574@telaak.dev> <sashiko-outbox-198661@kernel.org>
In-Reply-To: <sashiko-outbox-198661@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 16:24:56 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7T+tChJ0ywrQ40_xXDjUiBQjpNdeE0cEWOJ4GvPSYjnQ@mail.gmail.com>
X-Gm-Features: AclHuK8lD_KS0-g7yJtOX3ExXkCkGQdmHNReODzFWQfIXif6E1Ja7kMmpilHsvw
Message-ID: <CAPY4CJ7T+tChJ0ywrQ40_xXDjUiBQjpNdeE0cEWOJ4GvPSYjnQ@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: Add Siflower SF19A2890 glue
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Is there a missing architecture Kconfig patch defining MACH_SIFLOWER_MIPS, or
> should this depend on a different symbol?

It comes from the SoC series, which goes through the MIPS tree:
https://patch.msgid.link/20261104-sf19a2890-mips-v1-0-eae80820af68@telaak.dev
Until that lands, the glue builds with COMPILE_TEST. The v2 cover letter
will say so.
