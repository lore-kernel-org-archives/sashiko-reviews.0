Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FA94CA298
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 11:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719719; cv=none; b=aKa+P3THjFpXnT3lIKioUrp6motiXQxbmUkCC8xQbEBTUnNHrV/j86ZAvc9HeBFrxVsOADhImhVqadza+0yuqWcbE00Sf4V1+YL7MvdweFEvnZ3ytrwjD54r+62ds0wapa23tdb8fB01Oq9FfjPydgpUvW46Dv3u7jAJAQPTzI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719719; c=relaxed/simple;
	bh=hOkzl25QMkR31KWjR8NOxhwtgyg0bzm7KtlMeuS5bG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=V+NBtFYTARMGyEApPLQh8GkF6XoERL2rh3I6e4+/+yANOwUFMW9DcPYvhRrLXTsuhMdMnzpPE6kGYkDnBVNztAjQQH+RvAE9r+R9kx8SCFOzhpZHY2zsVSHwJLXK6UuXdxba1MbOAsAnky3qLN+ArerkxaVRKzx+hnkxvZZOOzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jMoYXCMg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jMoYXCMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784719709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOkzl25QMkR31KWjR8NOxhwtgyg0bzm7KtlMeuS5bG4=;
	b=jMoYXCMgIeSufjNLWXGWZIbLQHBtOegEooSndiDUwHWnSTTADwKDuYosU41xA36JoGIj5A
	ssyixqhdZpBwO2MpBefXtK+lU1PhV1aGZWS9xy1Ttn0IS5tzNmyVD6egZJMpXUBKwTohZy
	1t9c9cleoy/lag60aObqJGLWeAKyeNM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-Uzggo0ZANlGaYbji_F0fhQ-1; Wed,
 22 Jul 2026 07:28:23 -0400
X-MC-Unique: Uzggo0ZANlGaYbji_F0fhQ-1
X-Mimecast-MFC-AGG-ID: Uzggo0ZANlGaYbji_F0fhQ_1784719701
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA896191DFEB;
	Wed, 22 Jul 2026 11:28:20 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.27])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C8B96195423C;
	Wed, 22 Jul 2026 11:28:14 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: bhelgaas@google.com,
	alex@shazbot.org,
	mani@kernel.org
Cc: jtornosm@redhat.com,
	sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	jjohnson@kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	mhi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13] PCI: Add device-specific reset for Qualcomm devices
Date: Wed, 22 Jul 2026 13:28:13 +0200
Message-ID: <20260722112813.33153-1-jtornosm@redhat.com>
In-Reply-To: <20260721082933.7B5A41F000E9@smtp.kernel.org>
References: <20260721082933.7B5A41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: XWdF2kcG1kqTUyfcYNtAzroGYWQPy6o5qK1_QfSVUW4_1784719701
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

> [Severity: High]
> Will this sequence of ioread32 flush reads and
> read_poll_timeout trigger Master Aborts on architectures
> with strict error handling?
>
> The SoC global reset explicitly drops the device PCIe link.
> Performing ioread32 flush reads immediately after asserting
> the reset, and then actively polling the disconnected MMIO
> space with read_poll_timeout while the link recovers, can
> result in Unsupported Request errors.
>
> On strict platforms like ARM64 or x86 servers with APEI/GHES
> Firmware First error handling, these can escalate to fatal
> Uncorrectable Errors and cause a host kernel panic when a
> guest VM exits.
>
> Should this avoid MMIO flush reads during these reset
> sequences and instead use fixed delays to safely bridge the
> link-down period?

The SoC global reset at 0x3008 does not immediately drop the
PCIe link. The flush reads execute while the device is still
responsive - the actual reset takes effect during the
subsequent msleep. The ath11k/ath12k drivers perform the same
register accesses during this reset sequence, including on
ARM64 Qualcomm platforms, without issues.

The read_poll_timeout polling for link recovery follows the
same pattern used elsewhere in the PCI subsystem for waiting
on device responses after reset.

Tested over 100+ VM crash/reset cycles on x86 with VFIO
passthrough without errors.

> [Severity: High]
> Could this immediate ioread32 flush read also trigger a
> fatal Master Abort if the link drops instantly after writing
> the MHI SoC reset request?

Same as above - the MHI SoC reset does not instantly drop the
PCIe link. The flush read completes before the reset takes
effect, and the 2-second delay covers the actual reset period.
This replicates the MHI driver behavior
(mhi_pci_reset_prepare()).

