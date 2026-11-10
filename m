Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318841;
	b=koQQLZS8aYSe60LQ0QcZLDBLAdui0Lq5glmDmFssZyqWO/4WPw2/UT28AGyr1iJ54Brs
	 ppiPjOY2Wts6CpFWjFAGH7Z1rkEouP1wt0IyxfeupVFrghuQ7V58c/0LIVpW4m/ONeUcD
	 AMOkeypRnSZXO45+lrNjORBv5ePJS5fG3/WDjyKFm7MaY3J8URLHFpmdDlgPT1BnDBDc2
	 HMQHqoNJXDcLDHPdJPDCFn4F9GjUQ+9Hk69htj+7MbhuBQNfZr0gzkFylZAR7/L4czllo
	 FNlMDFdWL7AcSvyw6RRQ+R2+zYr6uMBU9Y3H0fxGivb3JXeGRl4lU7GckRrjxi7C0bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318841;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=kfFJbXidv7eWx9tBxtx/Gz4OMHlW9XqVfa9vdnbCIz0=;
	b=5W2rQ3bipneVqzfY39i2iSzcT9/jLbqmmVxP9J4E8lh9J5rPqQjTyRcLLo4EzO+PJYR+
	 FiumQ+5gaFIup6BuQ9MDPof1Kf+mGkyoYc4uTrrLC91lEq8exurUEOVy2cOCfPujPGHcU
	 Ayt/Qo4cnuI3uGLbmjivTrXgwA687AqRoWU1GrS8cr4EAwTQmtx23fE/CF/7pCxDqU6e1
	 6w2B0sslm6WiI2AYhbamhnOpicOB9KiAowZcYVPFQrL45pGDZo9AyU+uaCxOm/wMw8u+0
	 ywCLNHCcKxjItIHWl9J7CtFM/exspnN6CgmYx2lYnJmA1QehiA+B84zMO+ekLq8+4Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ApIoaniH;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8654606A326
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 13:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8654606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ApIoaniH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794318838; x=1794578038;
	bh=kfFJbXidv7eWx9tBxtx/Gz4OMHlW9XqVfa9vdnbCIz0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ApIoaniHSGKqyXM9rRTWU+i5Wjf0L5u1lAJljHe3tRLr/ZxX8Mv2nGqwd9aB5HThz
	 tccnSn/HED7Xd9OIEh6Y2uRo97oQ1AjbGsyee/qxHMEtxjYrUU2qp9NSoUwAOqRwAQ
	 HQTlFGv/w3T+fWr/gahxa1rmfFrGnBhEDl4p+WMrUnw2KEX+pFyLGP90Ff4taW1Ufv
	 JF0Hj4Ipz7R8xyeVAY0hcC7ioaxpOvKepYvviBBCMGreg4kwlZL3Oyam/T2wLWuj7a
	 NE6h3HN32+sS8zFFZrZ+iBggjAm+iMyraZVPeQPFYKE2BbdP9XG1ZtF1mhz29FBmi3
	 dcdVMXffrJhyA==
Date: Tue, 10 Nov 2026 13:53:50 +0000
To: sashiko-reviews@lists.linux.dev
From: =?utf-8?Q?Eren_=C3=96zen?= <erenozen@protonmail.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/amd/display: Initialize FRL status polling work once at DM init
Message-ID: <TZOFbwLq3A3VPag4HNQdStqYx0Am2XREwC5jsvikME_tKyWM7-I9y9MhWDjHxD4c6sSE2tCcjX8EZnlj7k9lc_iwId8NliFF5-hJYpKUpAs=@protonmail.com>
In-Reply-To: <sashiko-outbox-206215@kernel.org>
References: <20261110-frl-polling-wq-teardown-v1-0-0ff028d5c35b@protonmail.com> <20261110-frl-polling-wq-teardown-v1-1-0ff028d5c35b@protonmail.com> <sashiko-outbox-206215@kernel.org>
Feedback-ID: 19860221:user:proton
X-Pm-Message-ID: 7dc270164d3ddcc60347a8ca0b3f0162782453dc
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

On Tue, 10 Nov 2026 04:35:38 +0000, sashiko-bot@kernel.org wrote:
> 5c9b8b27a883 ("drm/amd/display: Tie FRL support into amdgpu_dm") original=
ly
> initialized hdmi_frl_status_polling_delay_ms and hdmi_frl_status_polling_=
work
> once inside amdgpu_dm_init(), and 0e967e086e75 ("drm/amd/display: Extract
> connector and encoder code to amdgpu_dm_connector") moved those two lines=
 into
> amdgpu_dm_connector_init_helper().  Should the Fixes: tag reference that
> commit instead?

Yes, thanks. 5c9b8b27a883 initialized the work once in amdgpu_dm_init(),
and the per-connector initialization came in with 0e967e086e75. I'll
change patch 1 to

Fixes: 0e967e086e75 ("drm/amd/display: Extract connector and encoder code t=
o amdgpu_dm_connector")

in v2. Patches 2 and 3 keep 5c9b8b27a883, since the missing teardown
and the unchecked workqueue pointer date back to that commit.

Eren =C3=96zen

