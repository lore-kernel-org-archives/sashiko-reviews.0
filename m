Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300254F4754
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 12:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649172; cv=none; b=b2gmDswHSLjgF5MQDn5supZpopN2XvMB8LY67HxUltcRlgXIfkHTEy68OOqnqDyXOuepB/ryuSgcDs0pzpJj9dSsXATqVSZRgILllhRMaHpw0Hoso0k0IMGYrr9qp+GaGL3VSziDFgAT2rXJeWZQQAVZ24YlvurEAwOH2VjHCsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649172; c=relaxed/simple;
	bh=IcqJ5QjcXa7dC1ErZ97Ku/rkqOnOuufPwsDqcFfskd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=jUER/VkS27j/mLdq2JCWdEVVKlAp7ZyLu7hlQOlDcTtnOWp6FxL0axcz0eS9A+7h+EpzQSIRi9NtCLj61jdqAoHNdGFTmD0HeohzumoYnL57xgstHk6r0GHx94SbXBI7XvhJek6BWnNkpalmqy94JmeQL99e2SkcwzqZ0Tiz7ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fUdAE1CX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fUdAE1CX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789649153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IcqJ5QjcXa7dC1ErZ97Ku/rkqOnOuufPwsDqcFfskd4=;
	b=fUdAE1CXlFggNZouiy9ihYttcxMEGwnYyLDFJH4r7EGPhPELVx3KlrLCLNLEz8mwDKn3Zb
	8YREafJ4/ItY4Lwdl+4P5pw9Yi0K1vLvV2NG9Finwrbj8sTuDnx2cAlgNvv78nWiFoITSk
	h8pa5Ku+8ggVhdpWp7qHQK0Waz1C9NI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-A4MrZ0goNYaicxW9-LsQaA-1; Thu,
 17 Sep 2026 08:45:48 -0400
X-MC-Unique: A4MrZ0goNYaicxW9-LsQaA-1
X-Mimecast-MFC-AGG-ID: A4MrZ0goNYaicxW9-LsQaA_1789649147
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4733B1808981;
	Thu, 17 Sep 2026 12:45:47 +0000 (UTC)
Received: from fedora.redhat.corp (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E46B4214;
	Thu, 17 Sep 2026 12:45:45 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: sashiko-bot@kernel.org
Cc: jtornosm@redhat.com,
	linux-pci@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v14 1/2] PCI: Add device-specific reset for Qualcomm SDX62/SDX65 modems
Date: Thu, 17 Sep 2026 14:45:44 +0200
Message-ID: <20260917124544.9030-1-jtornosm@redhat.com>
In-Reply-To: <20260917073528.A47E61F000FF@smtp.kernel.org>
References: <20260917073528.A47E61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: TeT2jX4zv0MxddfbDehUrbg72CcI4hhgXZ5sLOTTZIY_1789649147
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

> [Severity: High]
> Does this unsafely enable memory decoding on a hardware-reset device with
> zeroed BARs?
>
> If the caller did not explicitly clear PCI_COMMAND_MEMORY before the reset,
> cmd will have PCI_COMMAND_MEMORY set.
>
> The hardware reset zeroes the device's PCI configuration space, including all
> BARs. Restoring cmd with PCI_COMMAND_MEMORY set will immediately enable memory
> decoding while the BARs are still 0, potentially causing severe PCIe bus
> conflicts, IOMMU faults, or kernel panics since the device will intercept
> memory accesses to physical address 0.
>
> Should we clear PCI_COMMAND_MEMORY before returning (e.g.,
> cmd & ~PCI_COMMAND_MEMORY), relying on the caller's subsequent
> pci_restore_state() to safely reprogram the BARs before memory decoding is
> formally re-enabled?

The MHI SoC reset is a device-internal firmware/SoC reset, not a PCI-level
reset. It does not zero the PCI configuration space or BARs, the PCIe link
stays alive during this reset and BARs are maintained by the host PCI
subsystem.

Additionally, the PCI reset framework calls pci_dev_save_and_disable()
before and pci_dev_restore() after the reset method, so config space is
properly managed by the caller.

The reset sequence replicates the existing MHI driver code (mhi_soc_reset(),
mhi_pci_reset_prepare()) which works in production.

