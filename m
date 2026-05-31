Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D940311C27
	for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780235706; cv=none; b=Rism6le62EZTpdfP6/UUY1mjALb2JrDW22gaeOXTfGWu7LKJqJqbPmzv4dUybAWLXGNsQ4Vmv8wfGIerWS290l8mlthZY3fMDOSSLAQnQFPn/b2Iyxd2hBa79XW1IaWGofxlbDX0WuvaSRR43AHpC9HIqybRL++0r1llqVjWQk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780235706; c=relaxed/simple;
	bh=IojkXEcJz24+YV46lTxMNSdcw1Ho81dQc8X790L5DqQ=;
	h=To:Subject:Message-Id:Mime-Version:Cc:From:References:
	 Content-Type:Date:In-Reply-To; b=GARFggxZ8ndU9TFw8LzmljIa6ngHPXXviutQ+TcKS6SrLjjCsz/vHwc8eM4SRyycGtf+YKC6dV+Ma/p5O2wme+8xS2glESFogdUPAci0qFLSQ22qbgkCWJYeb4lqIBB7Okwbn5zD4nWj+1oHa10S+V12oMMQu194QN6j6RSgS2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UHMAEVaV; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UHMAEVaV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1780235700; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=nR73VRGDGmpbNBrOPjjPEurTnZdfsMAaZGX1i2lVKd4=;
 b=UHMAEVaVLrQBupsrPYf3W/atYCIVvdKAhmdzYCY7VONnhyG9w/k1gWCemC0TUDOXJ0BOeF
 ietFcXIVWz54sNvwviM0UVjfqm3YuDGJA2ZAyodvKBsYx3DsvTm3lgSXxjH2DsPiliEBcX
 cJj7spX7ALhVpIzIeFVDMA4ouv+m3fkluJDwjGIzyGU9DPoT5PSHwFOAMIsURT4t4eNPM9
 Qwwb+GsCEIHPfnX1m9dD5ExjOnQ0huO8/go5RGWknvr4lrszjRmVNYxretNc5z1CbL1nCW
 h5B9zDdON2v9cm/L84XGTHTgUCF+dJ/o0CplgfsKMmBFfxoQjMXw8rx3/SapWA==
To: <harshpb@linux.ibm.com>, <zhaotianrui@loongson.cn>, 
	<maobibo@loongson.cn>, <chenhuacai@kernel.org>, <maddy@linux.ibm.com>, 
	<npiggin@gmail.com>, <sashiko-reviews@lists.linux.dev>, 
	<seanjc@google.com>, <pbonzini@redhat.com>
Subject: [v2 2/2] KVM: PPC: Validate irqchip index in MPIC routing
Message-Id: <20260531135326.2238555-3-yanfei.xu@bytedance.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a1c3db2+8d2322+lists.linux.dev+yanfei.xu@bytedance.com>
Content-Transfer-Encoding: 7bit
Cc: <kvm@vger.kernel.org>, <stable@vger.kernel.org>, 
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>, 
	<caixiangfeng@bytedance.com>, <fangying.tommy@bytedance.com>, 
	<yanfei.xu@bytedance.com>, <isyanfei.xu@gmail.com>, 
	"Sashiko" <sashiko-bot@kernel.org>
From: "Yanfei Xu" <yanfei.xu@bytedance.com>
References: <20260531135326.2238555-1-yanfei.xu@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Date: Sun, 31 May 2026 21:53:26 +0800
In-Reply-To: <20260531135326.2238555-1-yanfei.xu@bytedance.com>
X-Original-From: Yanfei Xu <yanfei.xu@bytedance.com>
X-Mailer: git-send-email 2.20.1

Sashiko reported that the irqchip index is not validated for PowerPC.
Add validation and reject out-of-range irqchip indexes to avoid indexing
past the routing table's chip array.

Fixes: de9ba2f36368 ("KVM: PPC: Support irq routing and irqfd for in-kernel MPIC")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/kvm/20260525051714.485D51F000E9@smtp.kernel.org/
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Signed-off-by: Yanfei Xu <yanfei.xu@bytedance.com>
---
 arch/powerpc/kvm/mpic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/mpic.c b/arch/powerpc/kvm/mpic.c
index 3070f36d9fb8..fb5f9e65e02e 100644
--- a/arch/powerpc/kvm/mpic.c
+++ b/arch/powerpc/kvm/mpic.c
@@ -1833,7 +1833,8 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->set = mpic_set_irq;
 		e->irqchip.irqchip = ue->u.irqchip.irqchip;
 		e->irqchip.pin = ue->u.irqchip.pin;
-		if (e->irqchip.pin >= KVM_IRQCHIP_NUM_PINS)
+		if (e->irqchip.pin >= KVM_IRQCHIP_NUM_PINS ||
+		    e->irqchip.irqchip >= KVM_NR_IRQCHIPS)
 			goto out;
 		break;
 	case KVM_IRQ_ROUTING_MSI:
-- 
2.20.1
