Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492930;
	b=jRaz+c0wgf5MR3QTGZ6Ff/ucTLdrLe+mLShgkyQ3jQztCqDNY7j1VjrA7txEdMfGh/kV
	 hIWkSnp96tCEfjmBXwA+o+ifYCwz7dit8p6G6mYFmlg+wd3mvOb5pdetZXtE5Uo4RPbf+
	 NzbBeXPczq2QYMAlMzTx/4q30fSL0v0SUJz75riVy0o8LNBKp8Rr9ixMGqtdpmXYu7WuD
	 hPTDJkPzeJXy4QD8105Pk/V3w8tgORjWHLKqIW+wmcOVbJbdi+lBHyw7ATfIinI5Qb/PP
	 0L2IBKz8y7VA/JWaYjKeS5j5E2HxW3qZsTGZ4QeY+eBifTi5R0DxnJdx8J/DYZLUy0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=tnSOR2iS2NQ60s3hHjAc+QO7cCCKVbLJKOG9OogfW+w=;
	b=M+EYRvDj2JUFQHJBu5oiM2TbVdtUR/r1H4vTpaCHSxV9H6oOhxObBaA42IKdar8a/5Qh
	 f4gIrr7xXM0dgNU/+jZ6dGJPs5oHZ7dtTq3ZPBOA+7CJrbvWoCu4iemQ3mZiw1aP3mV1B
	 7qTORdJbk20hPu6k+gadW/Gd3jf87u+FDeDIda5x7g+dNIrE392RWPoTtdziM7lzShbnv
	 DRe0bRjeDguK6D/wzjuhu8lYsW4pOSbbj6imvOOsGeILlGbv/KBaPz834/YBJv3/AbCy3
	 y2uJk5X22ofiGzVkCD/BDcxknWXKGqkmvUIKcnlFmQJVw+xOsaN01+kMI3VT8jKLkjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqljp2jR;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDFF606A88C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 14:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACDFF606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqljp2jR
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b1535be329so2434239a91.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 06:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794492929; x=1795097729; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tnSOR2iS2NQ60s3hHjAc+QO7cCCKVbLJKOG9OogfW+w=;
        b=pqljp2jRin6QFmA9MxBY2t4VJLpWWVCCYyrBVj+BB5kGdn66qMS4bShwNLoLUI7DcB
         qy84AydcLnQhIF2YWprCSqJLvD96w1XdGTJIwWhuy8+vDnnBuT9mtgwUSa8JVlYk5KOa
         ypTSNb1aatbZ1BROd2MDRKrsiT4YVg3c6UUzrVZw9wEiAj3UbFNXwl1/ySKIIPkmQvo+
         P1NIr/DVmjU8OziHA+KKES6q6kJy4Wcqqvik6IfFGTCxVDR5s4+CiQunbUe44SFmiv76
         oDGGDMqaOx3RSBoNvYjyMxZ7H3z5pYhfYazuKxvnRZR9aSI3ANs/WOtelOmBee2flZVJ
         vA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492929; x=1795097729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tnSOR2iS2NQ60s3hHjAc+QO7cCCKVbLJKOG9OogfW+w=;
        b=jxXil0X65tDIMtOsAZ9daA+pJRNsVPhbhXixPguzLCsMMeWH4o47QxWswtpuTjPc7U
         BLfrterNM6OxSYYFbgzgvBzYQ5sNefppMrnbyTdwywQbdnuGAguzL9Ek1uTLjaqoG2Ux
         CfI8XcR56ayjP0YlAKkZ/3gBSxdLh21kn+sOOkPGZRpE9K6WClXn+vhRIOUdTMkZVwjK
         kFJl9WtH3m7ktcoXRuKwcmQK9wSUbPRLmcyVpM7QnoyXUxgVifyaG/gsFeYPYj8JDdhv
         PQFDMeZSPbGYErttl8vM3AgIpBsuDyly3wQPE3zDxHrWaxkdi4+lIS/2eOqPb+dwH6JJ
         m2Uw==
X-Gm-Message-State: APuU4Z+LeQOQdD7PakcgQ/HSSj3Czjv9MoTsMSuvXD4V1ZumADLKhzjY
	gitJREvCVIjHMLt9bvwJahvkf8YoFMorN49gkIlBacTAaeVr+kJT/DdGieMENFWfTeI=
X-Gm-Gg: AYBFou2XmWQ3NlrBDEY+a0tK3SIggGXof6/aGNpqyxSrx8fXa+weS2YrmAuAPUG20Aj
	OKe9gOBTfVYNhTpqJUZ2TNOfAsGG20tc35fPqS5H0Qg7bqjAcEw/Myc0VnVwOH6DS+qUMZc8+CX
	ahlBXCP7zXWoXMRmYH5DLObxOHB/mv/Th31tOp9tKJpku4MicG3voSk/dl/CcQNx0zG+pPLuid2
	KOJZq0eyt270dU7aEfOGMTolXspLRJ2V116tO9uVVLrvvmTeY+AO9TAwrNvavv4jipmIoJAXzPX
	xUN6m/68O/sa6CGR7mqQlkibt7p6pssw1mBdqt1k+t05PkADGQr5h2JcL7BrpqfJPqTkIeZKXzt
	l24wH+PdJ2dD3mFFPnsku798VikISwtlZ9LHU7dXdotgbW0+ANyrNKIyylPHPV63zrYIRQXrPap
	eJXMcFQm395Jy8Jw68RA3ovvRCcvs7o2CD/wHm3H1QwT1xEp596RfbtKQPcShXh3mhhzte3t3fC
	wpjPYkNVianQ4im7qg6aHsyI4iPjY/8jhZ79Ae8WiZCyVklRRsNPJmPiV7hIKseETd5r208hR2y
	jvn/d5Sw+02DQ6lxaLzy25fd0qsBo3kjuSeYIdRDew==
X-Received: by 2002:a17:90b:5405:b0:3b1:7329:a127 with SMTP id 98e67ed59e1d1-3b182efada7mr5054338a91.20.1794492928640;
        Thu, 12 Nov 2026 06:15:28 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c42a4csm4979523a91.4.2026.11.12.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:15:28 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH RESEND] usb: dwc3: tell xHCI that it lost its state when the core is powered off
Date: Thu, 12 Nov 2026 23:15:24 +0900
Message-ID: <20261112141524.112-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-211064@kernel.org>
References: <20261112114053.412-1-26rote@gmail.com> <sashiko-outbox-211064@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 12 Nov 2026 12:00:08 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Does the DWC3_GCTL_PRTCAP_OTG case in dwc3_suspend_common() also need to
> set dwc->xhci_power_lost?
[...]
> [Severity: High]
> This problem wasn't introduced by this patch, but in OTG host mode
> does dwc3_suspend_common() power off the core via
> dwc3_core_exit() without telling xhci-plat that power was lost?

Yes, both are the same gap. The OTG case always powers the core off for
system suspend, so v2 sets the flag there too when the host role is
active. OTG mode is not tested; this board switches roles through
usb-role-switch and never runs in DWC3_GCTL_PRTCAP_OTG.

> [Severity: Medium]
> Can dwc->xhci_power_lost remain 1 after resume and cause an unnecessary
> xHCI reset on a later aborted suspend?

Yes. v2 clears the flag in the resume quirk once xhci-plat has read it.

v2: https://lore.kernel.org/all/20261112141512.1840-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
