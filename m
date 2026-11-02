Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622577;
	b=a8m1jhKfgmYxDPAqmX/p+p1cEHcpIfSA3UkNJENANqN3YvvVKqWfVtvqBueE7y8TUDPJ
	 gaoAbGcdytTfetCs6Qli86rAyjwx6q4deruG99Qm/we0TC4CEW9+3qiPx5D19cWIa86P8
	 g4x12UM6F9GVVry8Sd27bY7rvcnXhNG6OdL2gqPrbuEMwMBn8svHU60fiOHbBMTl59Ize
	 h4rqRm+F1uuTTK9be0LLNAPoDb5v6q0R2eA1rbC5bvuAPQ88jXj87ggT/JjF2qGXF7ID8
	 q0rSCEOEh5Yule5yB6MAEImEEpzaq3abY0HdjahCQ8RcMtHPqtmQ/TMVFkfc45LtI4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622577;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IXXGa8xeqcfH04r8FcOwpoXwrqPAtaIbRm220MXW6II=;
	b=09z2eC5kDSBpuyZYZ15VFzmfdHuZEoXqOn4YeJdrTJdP2HtHyKHax4YWYivi1BREAilU
	 A0Yj6xQOhJbYdAOmg0ZRH3q9eltp7WqNRz+v7hmDNc11orm3Pw3APR2BIT+qmByVO91bd
	 V6CO9np6NOW+Tt9Ji6lZgDjNWDB8thOtVh5qyP3Zuch454Bncv8QbLm5VEPM9CADTwHiM
	 gQDGjSmWKg+awKNShlMszUXjQLPIuI1ed8KjLO4iCSzouK+tSQyhUPMX7pg/35H0XQJmD
	 UetWNs86Sxtum1cdQ8nAevhSxvZcKIx8S/KyegaW4PzR/NlvJCB85Y7uD0g3tt/q+OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C098606A324
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 12:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C098606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p200300f6af404a0027ad06761c59e6b3.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:27ad:676:1c59:e6b3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 81A5024350C;
	Mon,  2 Nov 2026 13:29:35 +0100 (CET)
Date: Mon, 2 Nov 2026 13:29:34 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v3 3/8] KVM: SVM: Hold SRCU while reloading guest-owned
 VMSAs
Message-ID: <auiB-cIMF-ybdvFn@8bytes.org>
References: <20261102114137.1198982-1-joro@8bytes.org>
 <20261102114137.1198982-4-joro@8bytes.org>
 <sashiko-outbox-193356@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-193356@kernel.org>

On Mon, Nov 02, 2026 at 11:53:36AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] KVM: SVM: redundant nested srcu_read_lock() in __sev_snp_reload_vmsa()

This is true, I will drop the patch, thanks.

