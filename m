Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792712944;
	b=LGMPTSQMVkO2F/tTv6elF5yGWtZeUKzz6EnUPNKhHz9/xCARWQrP/nh7PXiU3dLI+jM5
	 vE/Zrt6jaUN8QS2UVmaNfYSUrOvirpBAKh83KibsaOgDtcfqknJmXKFSIwlUbGZxbhLE4
	 1wmHQevJkTrlTx9tH8gsDqbhHFF4Le0yd+iSkAbWyk2G4FY7chFIfuYz9Wjz4UHpYeAGp
	 Cdgy2psk9zxNn8slsw3rGQVZjsVwAlOFwBtDR/t9XQmB+i/ljh+52jx1X8GyvEbpBcjwW
	 ZlF411/INW5h7xB9NuoTbQCK2t6t/Y2kwKM9r5+1FGJlFOUnPLi5OGTrzl7hacQuq7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792712944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=hG4DQLwgfQ2Ox8LPZjYJVttUVZFQq7dsn2e6G1CsU64=;
	b=cR1fDNeQtnSzql4dHzCt60FK6PzyzV38d3Zx1A6s8z/mAU2S1rFwwyTaoHlEBh9IFngm
	 +jGqB4AlSZRwjACwWxTFm06bBf0cWmKqQBR6pzPyRxAyrlCfFstk3Yw6EUnhFRVQoV/ra
	 RAfpQ6oy1hh5YrduPrSagngqksukcgMEp/sBib8TlhzW5rd7ew4wLYf/VHHMTeHNAeUmj
	 Y6GGNWDxvDmrroqp9PMVitDKFRzFkHBJ54/DQv/VPXddKPSySXdP6pZkR5k/Bk25bVmpp
	 8W4VrIs9tbpp7eDUctTDdk6jtWdYv2C8YXG9n9TVGh8Y7AaEwmohbjJ51wf2IOwmenQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nullptr.com;
	spf=pass smtp.mailfrom=nullptr.com;
	dkim=pass header.d=nullptr.com header.i=@nullptr.com header.a=rsa-sha256 header.s=google header.b=FkKmZSFM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98304606A31A
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 23:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98304606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nullptr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nullptr.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nullptr.com header.i=@nullptr.com header.a=rsa-sha256 header.s=google header.b=FkKmZSFM
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so958109eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 16:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792712942; cv=none;
        d=google.com; s=arc-20260327;
        b=F6Z0AO+WpcuzgS/v4irxreH5zEMlvb8bJZ62kY+U5+Zz8M+d2cHMrpuw765t5j/v47
         RgtuCbjUuzCQa8fLBYh5rdNlL8TCPmY4M+/K/UMUVKXDtp4KAJntVWUhwCqpVWcAiOWU
         zdEqSKjnx5KSY6IiWDkLGdv5P+/1xEPQP4RQNCTvsMRg9ofmOBGdb0NDRmnW2rd92yZ3
         pGvSOESmbYmUVG33tfmHg2ML2nB8vNaIo68M7pGRieo8ra5YSFNJ12NP2PmOdjnyjxD2
         XrRYxudJjX3IHrJ4jhSBk7HUDSR9uyAXXqVPG9qzvuIUGUHOPoHvYJYdQtwgOwowtITm
         OqCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hG4DQLwgfQ2Ox8LPZjYJVttUVZFQq7dsn2e6G1CsU64=;
        fh=LrM3G6RcmBZ425pLRY8E44TM1XcCb9gU9D3viVl1X8E=;
        b=HlIcUbvN1STFSOYQ6BleCOQCN2DYhKfgxLx2FQAp73bIs9gDAnUq0Ghd5SGv/cuhUI
         BTwE3mFVMdiHku02/xlexGjVcoOtYDkUlTebePM9XUfdtDnAGWNi05FOA7kIZutOnU2L
         uUuiEkuDTF3XLM+ZTwkG7i0UeHerglTtjSdbSDkGguFo/KqxkIy4GWjKCdVfRAZQBTrQ
         /tQUfpkufcQKbb4ZqjkY5T5sh2ZJIBF10Czp1As49j/OyxK9ejt9a0woD58W0i1Kjqa/
         yn1Z7f/WqYyNMWGWnOCn9i38k0dSDY/B/lbJlPn1DPevJ3/sUr13H5CPZGtYwW7xrtGL
         RFfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nullptr.com; s=google; t=1792712942; x=1793317742; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hG4DQLwgfQ2Ox8LPZjYJVttUVZFQq7dsn2e6G1CsU64=;
        b=FkKmZSFM2wZD8ZnOhZVPL3poWDeXuuEtmLHgKvUrZii4OVR0m9Hyux1VdLFnTxFC+/
         eeJ8ZdWMbjjmHGfJ84pcCJgBCCaWMJBc/h69yTK7yvxfdwlaXorCJKGnva7dQ0YbkXOP
         O5vAdzjFn+T8MPWzNd+UYB7N1V731Amh7n7czl0QUFquCZUANWwXZsmrgExLTeSCd4Vs
         qQFOpKw8/HX4OJE8C7t+6JRjiKako0QovGztzeLi6CaNFhVE3i1cZPNg7WGHdERT82Jf
         LlxD8iAZpnlmACTFLsgKjSSLH+D4jaBoakJ8D3vp1gFRDQ+Yc7HqMwV2ubH6q2iItZtn
         Kmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792712942; x=1793317742;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hG4DQLwgfQ2Ox8LPZjYJVttUVZFQq7dsn2e6G1CsU64=;
        b=quus5ykA/pLh6AC5HkMKB7xrxaXw4r7etUssfewBsoZbs8MK3iELAgYd8hdW1TtZN0
         vjS3yeU6OQAtoS4kS6xJgbtz7tvcQy1+7fiqWnbiU9I2wyqZ+Wog3IciE3uva9nniyT7
         pZh5tGheqqGDvtaAk8nNY49nPDMvRqIU+JgV/mPScGl5ZVhBA8HJgYjN5bPT5non/SCj
         ZGZargXGbZIkXSEOcBAOjWtoG/RquKHgj9wgFXKn2lmZkJNwpp/1uixd9btclvJU8zaU
         SqfpijUtgzTac82Qh3E7st1CYd34dMSAUA7bUcs6wO0htbJ4d8ZoBxpBaP8XNNgERhSj
         JUQg==
X-Gm-Message-State: AFq9FYLFcaIA3wVQyrkljkJQUQVJsyT9YUrxVwrzXw6Oy5nzLatD/wUL
	OAaQIVBM6tSxG0I4zshkYyBocYhlQ5Qhex3K/ait425WibvzK4QMwzILgfPGwM8Bi2pvZKzcZZ9
	dclUMKNA+9QjiucVu2UJiouDppCYLeOxMPGpvjOrJfaUSuSeg6cdQnX0gog==
X-Gm-Gg: AYBFou1qgaE5d0LtvReGmm5Pf4L/DTnHm+9wAn2PP92f5Ai7YsasYgAecmEsYzr6xAo
	gANh/thjsFluVCv5LOfy4xYtfSFBa7AtB1ficqOQxgk01R6DbsRzKjGdwYAntWD3m87MLU2ZsZr
	1WBhidLmFznEW1lJEcepz6Wc+Y1DsWs/b40dFgTZKyJ/jAh9TXAa87M2EQvgVz1x3QzngQniVo/
	sdMHg/gbN9YCNIJrgQYGgjkzUH/0hd5vBG99Frk5mCbW5Lf5kzxipjqSPXha8e5J/mvsZz2Tr8r
	emJg8pQt3cU2UjMG4Od4/mv+K9/x/EHHZOcEI8nn+Uu1prWfiPNCspdVUgFzKBVf5VyHvJDyD3Q
	JIkzeMeNIVQ/exG5tNJMwIwRYVAYXpmSaKNlYDZEYK3QOiIvvOz/uqLautxYdEJFxrsRsPkRveF
	Xa7/vkyFQRfWDfUFnySEYvQSSXgL0z2KCIGlQRQP+ykaK0FchH/A4y
X-Received: by 2002:a05:693c:400e:b0:352:4f11:8118 with SMTP id
 5a478bee46e88-369d9898b71mr851272eec.40.1792712942467; Thu, 22 Oct 2026
 16:49:02 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-5-20faea2e7a80@nullptr.com> <sashiko-outbox-182123@kernel.org>
In-Reply-To: <sashiko-outbox-182123@kernel.org>
From: "Jeff C. Jensen" <kernel@nullptr.com>
Date: Thu, 22 Oct 2026 16:48:51 -0700
X-Gm-Features: AclHuK_tK39u8v34AT_NCdYdlPGzw2WXko96m5az-UgWvd_URdgj8AQ-VL9fGOM
Message-ID: <CAHnw2UnRtTCXuEhXacnVGQfewRQgMbakwbVrgiUvsw550i4jPQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] dmaengine: xilinx_dma: Recover a withheld AXI DMA channel
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 22:29:28 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> What happens if terminate is called twice on a withheld channel before
> dmaengine_synchronize() runs, and the second reset times out?

[...]

> Wouldn't that cause
> xilinx_dma_recover_channel() to free chan->quarantine_list, release the
> segment reservations in chan->seg_used, and allow new transfers or
> xilinx_dma_free_chan_resources() to free chan->seg_v while the second
> hardware reset has not completed?

Checked and confirmed, I was able to recreate it on the vendor-kernel
backport with fail_function: a terminate whose reset completes, then one
whose reset fails, and synchronize puts the channel back in service.

Will fix in v2: a failed reset of a withheld channel goes back through
xilinx_dma_quarantine_channel(), which now also clears chan->quiesced,
so any failed reset cancels an earlier completed one.

> [Severity: Medium]
> Can clearing chan->quarantined = false in xilinx_dma_recover_channel()
> race with an in-flight xilinx_dma_tx_submit() that dropped chan->lock to
> run xilinx_dma_chan_reset()?

[...]

> Should xilinx_dma_tx_submit() check whether its own reset attempt failed
> rather than relying on chan->quarantined remaining true across the lock
> drop?

Correct, this should be fixed. I don't think the ring-order part can
happen, since patch 3 requires a descriptor to be submitted before the
next one is prepared. Queueing the descriptor on the recovered channel
after the terminate returned is a bug. Can fix in v2: if its own reset
failed and the channel is no longer withheld, submit cancels the
descriptor and returns the reset error.

Both issues come from the recovery this patch adds and don't exist in
1-4, which never clear chan->quarantined, so the fixes stay in 5/5 and
1-4 are unchanged.

I'll gate v2 on additional reviews to limit churn. Fixes were
straightforward.

-Jeff
