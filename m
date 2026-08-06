Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4479C420497
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 09:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007180; cv=none; b=BuZtUwtbGwSYyYyxnEn6yMzFRDLfkRLK62cy8VKt40LnOAq+pqLkIBbbfnZJvhez8R6xT4hDRAH5raXFL+Pj2mMuXgDONkIoHQ96bEBgFTu0udUPgA1l5AWWdy8p+D1hZU829zY/jvZPSonl7xtSXeXQXhiTCPTArXwZDUVEKu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007180; c=relaxed/simple;
	bh=DFOYhwSFPUSRFtQle8SgwxwpMHI3p9UQWKfiRhMN7UA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aYsFY55dr4M7cA8/PdVPyHOfvWQ0YDlJQkkRCLt+l8FYhcOmQRGJzKlaHXgdghPMqPnckEko1bVUyucgTJhF0adHUOmgCAkfUO+UZf4WAhhpFDZ/hFVp9ijpibzQpWFbdh+wOfLm9I8iXicOhkGg18937F8q8E+Bh6CBaEnEvO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1107ce8c917611f1aa26b74ffac11d73-20260806
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0f96dbb6-39df-450d-b4d5-8de07c3b0642,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:9b70face06a5294b19641330e8310daa,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|136|850|865|898,TC:nil,Cont
	ent:0|15|50,EDM:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1107ce8c917611f1aa26b74ffac11d73-20260806
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 965795620; Thu, 06 Aug 2026 17:06:10 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org,
	gonglinkai@kylinos.cn
Subject: Re: [PATCH] drm/mipi-dsi: fix UAF on device_add() failure
Date: Thu,  6 Aug 2026 17:05:57 +0800
Message-Id: <20260806090557.3389418-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260806080946.546A11F00A3A@smtp.kernel.org>
References: <20260806080946.546A11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Aug 06, 2026 at 08:09:45 +0000, sashiko-bot@kernel.org wrote:
> [High] The patch introduces inconsistent ownership semantics for the
> info->node reference on error paths...

Thanks for the review.

The put_device() change is still required: mipi_dsi_device_alloc()
calls device_initialize(), so the error path must release the device
through put_device() rather than kfree().

Regarding of_node: device_set_node(of_fwnode_handle(info->node)) does
not take a reference, while mipi_dsi_dev_release() calls of_node_put().
That imbalance already exists on the success path when the device is
later unregistered; this patch only makes the same release helper run
on the device_add() failure path as well.

I can follow up with a separate change for the of_node refcounting if
the maintainers want that cleaned up. Happy to adjust based on human
reviewer feedback.

Thanks,
Linkai
