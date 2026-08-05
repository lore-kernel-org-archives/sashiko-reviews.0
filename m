Received: from ms1.novatek.com.tw (ms2.novatek.com.tw [210.202.87.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F25A3090C4
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 01:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.202.87.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785892512; cv=none; b=VGnwBrFff7t2xpo++fpXpoDD4fruwAfwhCGOAeL//fAXjieTbzyNDbnAHU1DpHKyoF+RBNFv93jB6fsXZx1VUiLIKEywuLssdgEEnGOW8zNQxXkfwrAYL9nH++ywGcI5NJogBW46ILYz5E/iLjnH/ma8iJM4yU/LH1sLAKnVdQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785892512; c=relaxed/simple;
	bh=4M6Q0SmhSKO1Pkwy6T6zTinZzdtBuWFSEeBHXIljpVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JdmpgFhfO8vnIqqw9rDpyCyHyUiBtixYRTN9iyhYYUCEH7UxIIX+MoyTuHNQYQfJ86lCYI+B/kf0Jch445SWOGCKn75ocytqCliGDYPtI6TyBPGSw9LjQ/YsXFH4GgHmxn7yfxeYOyNUYBxSDYt0FfR1i94KxISP/k9IKYYDR0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=novatek.com.tw; spf=pass smtp.mailfrom=novatek.com.tw; dkim=pass (1024-bit key) header.d=novatek.com.tw header.i=@novatek.com.tw header.b=E6PbWtBK; arc=none smtp.client-ip=210.202.87.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=novatek.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=novatek.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=novatek.com.tw header.i=@novatek.com.tw header.b="E6PbWtBK"
X-UUID: 182f8a62906b11f181a149c3f3c08161-20260805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=novatek.com.tw; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From; bh=4M6Q0SmhSKO1Pkwy6T6zTinZzdtBuWFSEeBHXIljpVE=;
	b=E6PbWtBKVdeLSg94P2ZoumPB768DndpD7AtREk03bDicKGuTZoW/BUPz2gJ0eypSHgv/vRikapE8Fsdxi9oQPYQKqwfPFlNq3AR+uxUvqYdynMqI0+3JTyT5md7r9wKDogvLMb2dJJ0/1m0KqHXm5NduSyVxNitGccvW3Z+5wIU=;
X-UUID: 182f8a62906b11f181a149c3f3c08161-20260805
Received: from spmgt1 [(172.20.13.10)] by ms1.novatek.com.tw
	(envelope-from <sp_isw1_at@novatek.com.tw>)
	(Generic MTA)
	with ESMTP id 1043634886; Wed, 05 Aug 2026 09:15:06 +0800
Received: from oabuild50.novatek.com.tw (oabuild50.novatek.com.tw [172.20.13.160])
	by spmgt1 (Postfix) with ESMTP id 9F8421A1E1C;
	Wed,  5 Aug 2026 09:15:06 +0800 (CST)
Received: by oabuild50.novatek.com.tw (Postfix, from userid 1005)
	id B8238C600CF; Wed,  5 Aug 2026 09:15:05 +0800 (CST)
From: nina_kuo@novatek.com.tw
To: sashiko-bot@kernel.org
Cc: ben_huang@novatek.com.tw,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	shihpei_hsu@novatek.com.tw,
	toby_chui@novatek.com.tw,
	Ben Huang <Ben_Huang@novatek.com.tw>
Subject: Re: [PATCH v5 2/3] i2c: nt72676: Add Novatek NT72676 I2C controller driver
Date: Wed,  5 Aug 2026 09:14:53 +0800
Message-Id: <20260805011452.729786-1-nina_kuo@novatek.com.tw>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <--in-reply-to=20260804034515.BF09C1F000E9@smtp.kernel.org>
References: <--in-reply-to=20260804034515.BF09C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ben Huang <Ben_Huang@novatek.com.tw>

On Tue, 04 Aug 2026 03:45:15 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] The driver unconditionally treats the first message of any 2-message transfer as a subaddress write, silently dropping it or misinterpreting read operations.
> - [High] The interrupt handler returns IRQ_NONE without clearing the hardware interrupt if current_msg is NULL, causing an interrupt storm.
> - [High] Lack of synchronization between the I2C transfer timeout path and the interrupt handler leads to a use-after-free of the message buffer.
> - [High] The I2C controller hardware is disabled before unregistering the adapter, breaking concurrent ongoing transfers and client device removal.
> - [High] The ISR fails to handle the enabled CLK_STR_TIMEOUT interrupt, leaving it asserted and causing an interrupt storm.
> - [Medium] Hardware interrupts are left enabled if `i2c_add_adapter` fails during probe.

These issues will be reviewed and fedback soon.

Sincerely,
Ben Huang
