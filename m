Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389109;
	b=q5WW2VhYRYaA2aAqhpYYdFUj8EvUhlESrdKQvNzCE8sDGXkgjS/2Ec1Ep2LYXAf8eXu2
	 uWZRrejVtUZ3OzyaS405fCkVpoIvxy+Oo2yofez2DEiKpOrBvKXPXh7IZnNxmduenFh5v
	 3AeFkfLMviRGkerbGtgotQuRqSmCCaKqWAFgIpGIsXwzgHdhp2YMLNHzaZ6e6tERqeaYR
	 TD2LJEeT+cV+MpkNTw4/k0kI/2NeTWDrk9+Bwwb3rD4dCdQW1qXD+Mv/YJZEdlkS7lCgD
	 o1kMLI0BpUE3WQin3EABCDyDkApr1F4DNmZUZWJ4i25eJ+dFTvV/I706W2ntRu9dDIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389109;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=hOrnGMMUGwfI7tsx1Apf0YCmtbcldYUZMIUtx6l4fJ0=;
	b=ZCobXShOXB8N2PLZOTim3hqfHUGu82wrlubbzqdEIdiGmE0DUGJjzlIy9PtXTNUHAyOS
	 bZKYAWAvm5grS342OCTp8KKu7WJ50sqkUpC0LLPIkwi65vnh5TqtVgRTvVNgIHJ95Ck6A
	 Pf0bQfr58tTabaZODtyfA06wfqKpPuXUvF4UJdd6CQLMstNoofr1RO6oPGyYUqgtxvcsD
	 GGD+EkO37TMCBkLsIdXq64eIqlWM9Eg8HiqGexn0EIfa/bRIlgIOHP/699UGEi3OHXIs1
	 QFZv4R/D70zkuuOwff/BC24DwSOHb94kMwt98xeaZVj5V+zvOThPTSkn4fTZasgmrCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=7zmdmm2g4ff25ghswlcw2vysdi.protonmail2 header.b="CtR98/ng";
	arc=none smtp.remote-ip=109.224.244.27
Received: from mail-24427.protonmail.ch (mail-24427.protonmail.ch [109.224.244.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E772606A330
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 09:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E772606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=7zmdmm2g4ff25ghswlcw2vysdi.protonmail2 header.b=CtR98/ng
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=7zmdmm2g4ff25ghswlcw2vysdi.protonmail2; t=1794389106;
	x=1794648306; bh=hOrnGMMUGwfI7tsx1Apf0YCmtbcldYUZMIUtx6l4fJ0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=CtR98/ngTJS//ooNUc2y+n0iQK4JKHxzotPyVi3Y7h/UTlxcu0AifzekqwMgYOXab
	 WeRy6mJlU8eedjFvju2/nJnzUWQWQxFshRFhFGVvcHW/uZKWzyL2cpxXmproXZxNkH
	 y5chST4QZ+gvzc2ch9/0rkPLCQLZ2pl2Bfvt5MXrUh0tjhm1o2hfTtZMO1qdROVhKe
	 HlUptS887uLCZmKZftDNhxliPvJvBwDKpUB06K701y6XXAJDXBTugRap1L7cQzQVZw
	 kB2SVYnXBeeQc5pGryiwpne09OiWZ3cMUBNfZyC1+kj5b2WQHKPXofNQE11lNCR6UQ
	 PFBLdQYbiey2A==
Date: Wed, 11 Nov 2026 09:25:00 +0000
To: sashiko-reviews@lists.linux.dev
From: Nordschamane <nordschamane1@proton.me>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC] ALSA: pci: add analog support for ESI MAYA44e
Message-ID: <k7-nInhOSVDfbOkWiIndiKfm6wE_U8lCloAFX4FwOC2LJP0e81JxVOtwn_RuJka28NdIqr3_GXWDCyhQCpcq-makn0xsLpCVYHpjKYMdyLU=@proton.me>
In-Reply-To: <sashiko-outbox-208525@kernel.org>
References: <20261111-codex-alsa-maya44e-v1-1-df60af443e93@proton.me> <sashiko-outbox-208525@kernel.org>
Feedback-ID: 234176850:user:proton
X-Pm-Message-ID: 2e39f601a308b233e492fbcd4eefc1f9f7f5ba1c
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for the review. Here is how I addressed each point in RFC v2.

> [High] ALSA: maya44e: pseudonymous Signed-off-by trailer and
> MODULE_AUTHOR

Nordschamane is my established public identity for this project, and
this address is how to reach me. The current kernel DCO guidance asks
for a known identity. I kept that identity in Signed-off-by.
MODULE_AUTHOR identifies the project. I moved the revision notes, test
results, and base information below the patch separator.

> [High] ALSA: maya44e: unrestored D0 power state in maya_resume() error
> path

On permanent resume failure, v2 disables bus mastering and INTx. It
stops all four DMA slots and disables phantom power when the device is
accessible in PCI D0. It then disconnects the ALSA card so operations
waiting for D0 can return.

> [High] ALSA: maya44e: NULL runtime->dma_area dereference in maya_ack()
> after hw_free

maya_ack() now pins managed PCM buffer access before inspecting or
copying the buffer. It rejects an unconfigured or unavailable buffer.

> [Medium] ALSA: maya44e: missing joint-duplex rate constraint in
> maya_open()

v2 advertises SNDRV_PCM_INFO_JOINT_DUPLEX and refines the rate against
the opposite stream's reservation in either direction. The hw_params
reservation check also handles concurrent negotiations.

> [Medium] ALSA: maya44e: skipped PGA updates at zero volume in
> maya_input_levels()

v2 uses the WM8776 per-channel PGA mute to silence analog monitoring
at zero capture volume. It preserves the last nonzero PGA setting and
reapplies it along with the current gain after codec reset.

> [Medium] ALSA: maya44e: unlocked last_appl updates in maya_pcm_ioctl()
> and maya_prepare()

The playback PCM reset callback now rebases last_appl under the same
ALSA stream lock that protects the appl_ptr update. The v2 patch lists
Joonho Lee's PCM reset callback patch (v25 03/16) as a prerequisite.

The final v2 passed a build and host tests. The hardware results in
the changelog are from an earlier build, as noted there.

Thanks,
Nordschamane
