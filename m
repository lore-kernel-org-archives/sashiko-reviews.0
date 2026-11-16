Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794813037;
	b=tnw64DYGkAzfPb8176HFXEkpFiMBE3Tj6OyFH/HmJXuJgfyZavYn7sqqXPPGvrfHccyl
	 3nQpX+fiS2utS1zPxHz2f1wISU5SaYhy2NJVBjJdzCLucBHlQ/QeZpQillTmEA+bL+zYu
	 QfTb5s/HEQwXuqOXWoo1Q78bsQccHVjOBtv6ewotqie2JFI9dqLuBqbCqGAhigRPeip+3
	 +bkuDSRRcvFRz8k63/F0B0cp8I/O3hJm3Lar49W4gkBtHuvIiXhfNHhNoVnaPo0vUTk6F
	 NG/XHP+EXUHVRtcM+kIrQYnuxPtih+NcnyMgekFs9/wRuTY0u2LpGTsno8rD+QhGhAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=1sV36HcIIaexN1B9podEt8/JDaUKlNNQEN8NLfUeS2s=;
	b=pjwGGjgOhC4kHWfwTUKLFxoK+RMCCQdT9Ydvxz+2Hz2M5ftZRIEkD04GQfB1CFaqQ3p8
	 mmCKPdDx/Tmd8nE7IsTGuaRtf+Q+6KtVAs6ISiP494rpRpKNnEU8gYq7H0OPuOFkJY18d
	 xPTXTv8xsB/pRIsbeIIEOoulc7m/upk8OuS975nrQHtRdcD91u4EYDCwb2s6ujqUwcLHC
	 B/bPSxmWysJ5UYomfXpmtAprcxkfraev5wxyU/lrfwDznUVD7gbuvd/963ERkj0DMBRxJ
	 M2pmE7VORDYA3AvZCxzVv+AhwC+3T5uw2L4HxUQKyB+LoeH96RZzJ7dCMNUo4PCLQMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nullptr.com;
	spf=pass smtp.mailfrom=nullptr.com;
	dkim=pass header.d=nullptr.com header.i=@nullptr.com header.a=rsa-sha256 header.s=google header.b=Wu4bIcys;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF8B606A336
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 07:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF8B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nullptr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nullptr.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nullptr.com header.i=@nullptr.com header.a=rsa-sha256 header.s=google header.b=Wu4bIcys
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67dae7d3f7dso1004397d50.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 23:10:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794813033; cv=none;
        d=google.com; s=arc-20260327;
        b=tD4W3UcUt3NFyt814RgZTlm1eD7dSpRG2Yy9NVz7HWqNbUfPAtQwU7KPea+40DBBIH
         QeWUQ2pfURy0GdQO2ao2Dw3pqLOT/NBhX4U1926AbqN7rxRV9bPJRj4zYZzcJ5qNRN6b
         J49eiD7RcPBxeAil8gKxjJRJopiex1e4cz3THOvwlHUjBL0ZcsRR0lEnbjcWBgrL8XkO
         xTpecHa51agPjTReXmU/p9x1flWbxSbbCU838QIrm9Gyyb2h0SHXcTJAuGT7BBEPTBUH
         yLBQbXW0Qp/sGZ+4IP8LirikwdsQIqZFU6wX6/H5KrysE16Zx8K113RSsyyAhiCEQcB/
         xu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1sV36HcIIaexN1B9podEt8/JDaUKlNNQEN8NLfUeS2s=;
        fh=LrM3G6RcmBZ425pLRY8E44TM1XcCb9gU9D3viVl1X8E=;
        b=rXM3XAzP1KYwPbebTVjIqfLvgnt7F8ew/4r8SugC0qgq9TNZDPPMebWmyZq8B7CFId
         Rk7DFSox2kLccYOi1bymYwiQ+6/XiwWO5vKFqkEa8nv90AH6rEQiQHXrYQr4Mt1orR45
         TdtU4/w+5x71PpgstCoEfXNnDf30GT+HmIUQtK7q24QFNnI7SSilAjpUDm/U9s9IIdCG
         hHvPWX6hu7ORV0G9LwwI7BliGw/H9M085Pb5KA/p8+hF3V59twnKyZSjlC1J50Epr3QX
         CMiCSGIO5Po3KKjg4z/WTWKPu5C1Nd7an7ERK/JyI5K7xlp2yo76lbjilZrF4KFzpJal
         bJGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nullptr.com; s=google; t=1794813033; x=1795417833; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1sV36HcIIaexN1B9podEt8/JDaUKlNNQEN8NLfUeS2s=;
        b=Wu4bIcysnYoO/5h1qM8D0TBwLR0MIFF9X5AHVAATkZ4+qpo5bZr4Fj5Nnj7A4Rh08g
         8+wgqWj0phK7ZYT7ElP90fHr67rrtalknLOfC99aZVqq+4Z8+NkLah8+VufRSFexrYfz
         qf+r5iUfYvzdL68XQpPzmAgrORmPlQG/H/fn8S8Wkk7JvIYk3ZNqN60HXryI0uGVWlIO
         bznJq3Qv1kZAmCoMH3QeqP5aS4860+j9bailUeXTxhRL6cQNtb8kHTcF2444TU/h4Zim
         E6hFxqi2EO5PzewiDaM16I0sU9ofqtBg6oQ/jO5BefzmWNwQoSymXvGNNVO13LGvxeWd
         TkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813033; x=1795417833;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1sV36HcIIaexN1B9podEt8/JDaUKlNNQEN8NLfUeS2s=;
        b=F5RTHGrI1Bn2JgmfCrDRSuBdGRw/5cLJqh20XP6rGmXZLdiekk1hcr32c7R8owPBXs
         PjDNe4Q2Bb7jLgrGXw/zM7dtnv/qo2Mhm79NhHYmaT8srkXmWENYOGCaB0IjY4yd82xD
         gpyMXw6F0R8uJ8v0Pna7EXOHMvWH+Kz1PoLJhVwdxLHEH6tLxMIDHDKw5/P8xUIpRSyP
         Z/U72RgKOTo+yy2UzyNU3I/YNjOZaEuYa7JLD5kOunjXDkGi1Uc+DY8o152KgQgraiDq
         TlRmWWQ/k20OVQ6awf4f2wl/Ii86juotxw4I6yT1n24/v1CRsgDtmTj/NXfqaAsZf5RO
         YWHw==
X-Gm-Message-State: APuU4Z+SW8oE+2SmgWDiG6RL8qr+uG2XCCUaS6eL5txJfgYPsl+NVB9d
	k0HGWu5gtf9I+fVzFuLJikEUrEzDzZ/8oiGri2O0/w38YMWO/r+M4axBAHV2MmyBINOMbQ6XrV0
	JPIAD00Gn8ZegDFyJJH3cGfL9I4HehjhR3zn4bv3+MsDZzzzM6KscBQ0Gtg==
X-Gm-Gg: AZFdTZd1pgiEvxsjON5hR7JA/wQj35bt1Ex9YoaQ1LLd7ATMxyICbZPMPx7a3RO4LxZ
	+N3kEhwZ4FTO912AECI7fn2K6OaE2xmBkctdVio6BOzx5FcjQVZoS815Zt1Q1mvB3OeJi0zJwjr
	zFZCF7GNfPedvV27Qtti2Lw8ANx5NrJgV1gCtSUfPV3Jb4KxlukpEz9zDtC/gGC4Oiypjv68PCp
	gbOW+Fy0NlSlubCHHHZDRqA1JgGaxN1QNHerc8EDhxE7k9Dd9uP6vt7Qpv49pv0BZH2wxlVVA4q
	Q/DTKS/vL3aB4rctotWd42lCfKItlc+fhUQwwjR5WUzxYNyGBJyPjyy7fDy4VydLlObrF5CSoRS
	Y1iiJgNxVq+WDew9AcKmnc+md/ZN1t6Yvv6P7br4/fPMdMLjnccs+aBBBPmyLbCtiRo42bXipwG
	Jgz68hhv7elXAPNXpV4fD0vOhWCK52sCnRX7pTFFb6ArFznlVglT7LvEQ=
X-Received: by 2002:a05:690e:47da:20b0:67b:f42b:a404 with SMTP id
 956f58d0204a3-67d89639458mr3249122d50.55.1794813032614; Sun, 15 Nov 2026
 23:10:32 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115-xilinx-dma-work-v2-0-681ed00c15a1@nullptr.com>
 <20261115-xilinx-dma-work-v2-3-681ed00c15a1@nullptr.com> <sashiko-outbox-216160@kernel.org>
In-Reply-To: <sashiko-outbox-216160@kernel.org>
From: "Jeff C. Jensen" <kernel@nullptr.com>
Date: Sun, 15 Nov 2026 23:10:19 -0800
X-Gm-Features: AclHuK-OOF8rUc0S5lk4SEf84UXEwuciSxAHkqIc_dTegknzKLQvIqLjK7DEKzM
Message-ID: <CAHnw2U=mQkQiSLgEGbVfPTf6suaQQiq7GavziJQEhxTV_CwyQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dmaengine: xilinx_dma: Allocate AXI DMA segments
 in ring order
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 04:07:02 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Does the chan->err path leak desc and its reserved segments when
> xilinx_dma_chan_reset() fails, or allow a concurrent submission to race
> when chan->lock is dropped?
>
> If xilinx_dma_chan_reset() returns an error, xilinx_dma_tx_submit()
> returns without calling xilinx_dma_cancel_tx_descriptor(chan, desc),
> leaking desc, leaving its bits set in chan->seg_used, and leaving
> chan->seg_next advanced.

My read of the code seems to confirm this. It would predate this series.
Prior to this series, a failed reset in xilinx_dma_tx_submit() returned
without freeing the descriptor, and its segments never went back on the
free list, which put the list out of ring order. With patch 3 the leak
blocks the channel instead: the leaked segments stay marked in
chan->seg_used, and once chan->seg_next wraps around to them every later
reservation fails, so the channel accepts no more transfers until its
resources are freed and allocated again.

Will fix in v3, which should be a small fix. A failed reset cancels the
descriptor under chan->lock, as the busy cyclic path does, which frees
desc, clears its bits in chan->seg_used and rewinds chan->seg_next. This
only releases a descriptor the driver rejected; what the engine does
after a reset timeout stays out of scope.

> Even when the reset succeeds, dropping chan->lock after desc has reserved
> its ring positions lets a second caller prepare and submit a newer
> descriptor (or set chan->cyclic) before this thread re-acquires
> chan->lock, queuing the two descriptors in chan->pending_list out of ring
> order:

[...]

I don't think this can happen, for the same reason as on v1 5/5: patch 3
requires a descriptor to be submitted, or its rejection handled, before
the next one is prepared on the channel, and xilinx_dma_tx_submit()
documents it. dmaengine's client.rst already asks for prep and submit to
be closely paired. The window isn't specific to the reset either. A
descriptor reserves its segments in prep and is queued in submit, so a
second preparation in between would queue out of order on any path.
The chan->cyclic variant needs the same overlap: a cyclic descriptor
submitted in that window would also have been prepared before desc was
submitted. Before this series the cyclic check and the reset ran without
chan->lock at all. The lock can't be held across the reset, since
xilinx_dma_reset() polls for up to a second with
readl_poll_timeout_atomic().

-Jeff
