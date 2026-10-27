Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793129015;
	b=nFS9OgSbCFA4LkEoeHLMf3iadIKpw9ML2WdtKTXHGpf+r+F5P7jNfIK2Ysw50kBHGWGt
	 K+sGqYWVYFoBKB1ak6gRf5Lik7AQ8PeWWtKw8YoqQeMi8V0MF1J161zrozjwvsu/b4u26
	 BdySINP7ZJh4uPrEbnRueLv9znBhqzU7dVG8yF0okybzCXdr9yUlQhxrpqVhlYYU2g9k9
	 0zf2NCb1jt9/9z/42pFu6hsjI34DemNJfanJhpfRQXxeYNIeBKI2Uj5jLCurv05Pi7kEx
	 fFUmiu0r+EnxqFxduANu54pcwTNsLk3wSmiVNgyDnpn68b1/byHerdUXj3XiBlacyxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793129015;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qb+z+KGmRKyH2UaEELGKStSnmnPknK++vk9eoJe2Jbk=;
	b=GiIpoBxSFlQXPu39xTuWdDHLxUswJk+NzBGKD4xlszsTFhLFnRfI1iPQFYx8EexPr8sr
	 9NSQpWsrd5df2bXLc4i7hXHeT8TdnxL5rG/yU1KuLu9WO8d4rUaHtCENoKysyuDYBlWD1
	 v9PPw0q7VJ0Dpe5duAbqc8tktIVok3TcHljhq9OIGr9SMUbZ1nXjl3gt8sboSzu8Tapr0
	 8kJHqMwpD4xlGHBUtXtGpJCsmAKHVEKEGVviKqvBGqevZ3lKdvGT/uCTF5wYVHWmCVkYb
	 Viu2wq1Ki+T7XzjRaFHGW+5o/52wHMdSr69rPA9Wpsx3zy+P6iqvmtg35P7w4rWY5iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b="10u/iijc";
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADF5606A325
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 19:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ADF5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=10u/iijc
X-Virus-Scanned: by amavisd-new using ClamAV (23)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1793129010;
	bh=qb+z+KGmRKyH2UaEELGKStSnmnPknK++vk9eoJe2Jbk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=10u/iijcYxftUuwbWRStM+9nF614qigXRYUv/6YsuxkZIINqF//KF6F3tabhVAZMC
	 MPtTv8EZd6DjHkr9dseCpRZe9IjZ9VLcDgy5esxhKkFyzw9gegyq61s3zzraM3mPqa
	 La6InVFERajdyn2Dd039FsHlKCyUnR7+ECaDfgTrp2WtXPZUVgXTd4Vz78odm8UFpi
	 4wPGSt1LZtxDZ8IksmQvT7dO54KNN4wQzP7u5ZX12tHTVRepct8+rWbOxkyztd/CYO
	 Ft8HmjNIYfaI/F1FzhxykoQY6IFvLV1fX3sN4O+8Ea+unpiHC2RpfooDDJ7WU3N10J
	 aSc1Ce0Su7UMg==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id 5CE991BD758;
	Tue, 27 Oct 2026 20:23:30 +0100 (CET)
Date: Tue, 27 Oct 2026 20:23:29 +0100
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?= <amade@asmblr.net>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-sound@vger.kernel.org
Subject: Re: [PATCH 03/12] ASoC: codecs: wm8994: Implement set_jack callback
Message-ID: <20261027202329.3d148492@milkyway>
In-Reply-To: <sashiko-outbox-185729@kernel.org>
References: <20261026201915.57184-1-amade@asmblr.net>
	<20261026201915.57184-4-amade@asmblr.net>
	<sashiko-outbox-185729@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 20:34:59 +0000
sashiko-bot@kernel.org wrote:

> [Severity: High]
> When snd_soc_component_set_jack(component, NULL, NULL) is called during jack
> teardown or card unbind on WM1811 or WM8958, wm8994_set_jack() passes a NULL
> jack pointer to wm8958_mic_detect().
> 

On one hand yes, on the other current code doesn't have those cleanup
calls. It should probably be fixed as a followup series.
