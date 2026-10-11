Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92414372EC5
	for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 07:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791704119; cv=none; b=O4/ZdnUAvBWF2Dv46E4+8vGonftI7mC+pHGD+FXm5z8qyH1wnuGmgAXMrjrDdp4wZdDoht3I1qOd0t9cyJerLu5PL3eHxkZ860axLim2mODOALYSEgO22Phx87j0zyVDe8Bp73DQiOMD1LLzvaUioZCWIhmJi7/EDedvsQolJHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791704119; c=relaxed/simple;
	bh=/CLLA0ERXuVPmyVw7KeHJmnS7+EmzHG74Ku0372SZ3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=gvYMRZQ1dtgU7yC/cn9bNqdVQ3vxNDzrhXjrgMH4X6b2Mmo63x82GqWdp0peNpnB++OaEi7fDqK9ua1CKCqn7q3yslwjC8jGr+r7UMX1M9iiS58fB/X22dcWMCqwOa46Tt7h1il0Sse5VPEIQYD2IeapkhEM+KslWBjTU6NpInw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NRPLb610; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NRPLb610"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791704117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jK3GBOm8BgNFht3JWKlEz/MP11i0+8c6UWNXoiXvfYw=;
	b=NRPLb610MqOsKGOaitvPJBwioVwv2A81WeCRcOek3qDzC0SaMPHGRbuDdRU/PZPEM8jSXP
	rBe2a6ggEvEAsjt5nV3YAGWyYVbglTMsbKw4P48cL820ub9bFd2nmCBdw3xaFm6lNSAhNH
	UE+kqrVPW7AQUJ84cbZIq8u34OxQdgs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-DqjH2l1rOUavi5i06Ni2Yw-1; Sun,
 11 Oct 2026 07:35:13 +0000
X-MC-Unique: DqjH2l1rOUavi5i06Ni2Yw-1
X-Mimecast-MFC-AGG-ID: DqjH2l1rOUavi5i06Ni2Yw_1791704112
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 08BCB19560B2;
	Sun, 11 Oct 2026 07:35:12 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 423521956095;
	Sun, 11 Oct 2026 07:35:10 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: sashiko-bot@kernel.org
Cc: jtornosm@redhat.com,
	kvm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 4/7] ath11k: add PCIe link recovery retry
Date: Sun, 11 Oct 2026 09:35:09 +0200
Message-ID: <20261011073509.508440-1-jtornosm@redhat.com>
In-Reply-To: <20260930145650.E037D1F000FF@smtp.kernel.org>
References: <20260930145650.E037D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: PtEEdjG3EV6ph_golseAGBMYcc6pmKUNffAzcNzO7oY_1791704112
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true


> [Severity: Medium]
> Will this polling loop incorrectly return -ETIMEDOUT if the thread is
> preempted?
>
> If the thread is preempted during the delay, jiffies could advance past
> timeout before the next iteration. When the thread resumes, time_before()
> will evaluate to false immediately, and the loop will exit without a final
> register check despite the hardware having potentially recovered.
>
> Should the hardware state be evaluated one final time after exiting the
> time bounds check to avoid false timeouts?

With mdelay() (busy-wait), the CPU does not yield, so preemption during
the spin is not a practical concern. The thread cannot be descheduled
long enough to miss the timeout window during a 20ms busy-wait
iteration. Not changing, but the counter-based approach in v2 makes
this moot.

> [Severity: High]
> Does this mdelay() in a loop of up to 5 seconds cause soft lockups?
>
> During device unbind or surprise removal, the following call chain is
> executed:
>
> ath11k_pci_remove()
>   ath11k_core_deinit()
>     ath11k_hif_power_down()
>       ath11k_pci_power_down()
>         ath11k_pci_sw_reset()
>           ath11k_pci_soc_global_reset()
>
> In these cases, the PCIe link is permanently dead and will never recover,
> resulting in an unconditional 5-second CPU stall using a busy-wait.
>
> Since ath11k_pci_soc_global_reset() is called from sleepable process and
> workqueue contexts, could msleep() or read_poll_timeout() be used instead
> of mdelay() to avoid blocking the CPU?

mdelay() is used deliberately for consistency with ath12k, where
ath12k_pci_panic_handler() calls sw_reset from atomic context
(interrupts disabled). Using msleep() in ath11k while ath12k uses
mdelay() for the same logic would be inconsistent. The busy-wait is
bounded (5 seconds max) and only triggers when the PCIe link fails to
recover, which is an exceptional error condition.

Fixed in v2: replaced jiffies-based timeout with a simple counter
(250 retries * 20ms = 5000ms) to also work correctly in atomic
contexts and avoid the infinite loop issue identified in patch 6/7.

