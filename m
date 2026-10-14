Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D0D1DF98F
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968903; cv=none; b=Zt+gV6M3kCMv2hyyXDexF61ZEmKCpw7RLdE4soJO0jjF2+a1hWYjboVzNF6K4BVP5b4hrYolf3kDExMLUSze0WVMOrK72mCvM68wkZH+vNY8fzXd9YmKlvpW8Cel22CARkPHMswAXG6awffScIcK6WuK8M/hguUCUCGIYVf8U/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968903; c=relaxed/simple;
	bh=t3WPcOBQXBUjthn81UKd7oXqWoABg309HZeVAhQJHA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjljoq5S76wd/f2GXI0S4dI5DPdlELkzeXaFjB9p0TtRuRNMINMnl/U2UXjfTbYhLbNcQanbrxHJRavR5KI0km8CBnWzoWH0Yg4W9xDmkugHRevoe9V219JU0bsaBCUtampEzpbPVRhnCN4eKA0v3PEyYjvZZzMjbLT5R+NU8B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qk/eTFXC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qk/eTFXC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48deeadb3fdso210853f8f.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 02:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791968900; x=1792573700; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EKVSeE4bjA6cQl42EhHNb5mQnnjAquRALU0RVbJrsQM=;
        b=Qk/eTFXCdC62Njus8VJwSocljj+S3ZTd+abK4AvykopegtF7LbivWGKpO3H8qlmdbI
         R9UdsJtzZRg5VDtiROAMqTomxjm4vRTk8t2pYaBtAzN9KpUGeFq5g+D6EM2UFmYWG/ft
         huxosTZhuW1Qu2OtA9MiUZWAcs4LTHx53sOYrc8LqmOT2KwsZUeevOrgrnrRFTS4ZoGx
         JgqLKEHXZ9c6yYIXP4yYjo9d+UaXV9DPt6mGyGdcTEbviisWr+aYlpFhLc8vaTwiWYQS
         Hru1nbtcGpExrXRGA+V4As+/+ukjp8FQwbti350vwGfYJOHOSqxzrX8coP7Srh5omz1I
         HVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968900; x=1792573700;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EKVSeE4bjA6cQl42EhHNb5mQnnjAquRALU0RVbJrsQM=;
        b=0LfV+kNMLuw3/VswOTu7z3OVFN6LA8YH65mdirLipau+Ki2+it8+if9PVSxEHfEAgZ
         YOASvd9bl9tsg7WB9FxKOMZQayS0nyCD5LAFC4MSEhOGbbyirUgu6gzyI+j4FIpd56F5
         odKc/cG7JhYnYfaYGuMuDnODbe/flrCnRYDcX6Wp0xyfRoiYIHegKRslgBufq06c0Ygu
         Gz0KecTYX98v/Kholvze30SJexer1703tEBIxbn4fOotqFeqB/9gTcIc44Gn3pgOp1kv
         QXxWebjRS9xjvBeP6WRbyoFPfuE+wqudPeSZ1eo1eVSEnZw3u464+0H2vbYjLHpX6dT0
         pX4A==
X-Gm-Message-State: AFq9FYLqbtc0TmoIhIM5ZzaIdakokbaE9R9Qzd/8+bsRC8l4OaqdZ491
	KuVnCVE4iOjnMhqEtu8jpqG29PHjLepprzNj1HP90mjF152Lr9D15pftvu998sErKik=
X-Gm-Gg: AYBFou3Z8tygfwChjROXqFqRkVF2F5wZTIFAICSiLFPJDA9oyUIYBR5Cj99WGmqWg0w
	zhfYc5R33bETN2uiBMJA2E6Dh91AAukE25csVyjyhuaLHK0qnNQ3NXCnvyUiMlIRvE3fRVHKg/i
	tYiNkV0hCi1YicKBaMpCRWjTzbdEg8xM0WQxoBILlcHqS3k+DXiKL06UiqItIu2EjkMXUrw90UW
	Xeqfi6q+om5Edq1scVqYA3WEUQhJQLxyhWV7mZ1D60hd54likeozRBlaZOEcbdydFi374dDMKIS
	YOtow5R1JK7cRuKey+gqfhldF1u8twSan+3v9G39kN5GnUh7cnTS0DaysTj5Usu9S5HHzLmBqy1
	r8DLtwxfL2nw8rvnt49S7DhQ8Ft0dPEs719/KxTnGoBW8BNC5miI5tlcbvLr3BcTIeWqaYHn3Pr
	zuez0SCTsnpJL99/vm3zkHy0KYSWPCzbI4BtRk+Th5tpnlQgkywhwaYQqx70p5jy7OsPT30AFsN
	HTRUvlP1RNEqtDSwwk1347E8gvEQiigAnQs
X-Received: by 2002:a05:6000:41c5:b0:48c:4274:20d7 with SMTP id ffacd0b85a97d-48db9466102mr30472816f8f.6.1791968899468;
        Wed, 14 Oct 2026 02:08:19 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de77606fbsm4343080f8f.53.2026.10.14.02.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:08:19 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:08:17 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v2] bpf: allow ksock connect/send calls from wq
Message-ID: <as9GgXQ_K5UrW9g7@gmail.com>
References: <20261013182726.276372-1-mahe.tardy@gmail.com>
 <sashiko-outbox-170341@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-170341@kernel.org>

On Tue, Oct 13, 2026 at 06:35:59PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] selftests/bpf: u64 map key causes workqueue double-init on big-endian
> --
> 
> commit 5eb6c40a460d2cca2d0dee2b208a0164f311d369
> Author: Mahe Tardy <mahe.tardy@gmail.com>
> 
> bpf: allow ksock connect/send calls from wq
> 
> This commit relaxes the constraint preventing the use of ksock kfuncs from
> asynchronous workqueues. It also updates the ksock_wq selftest to verify
> that connect() and send() function properly when called from workqueues.
> 
> > diff --git a/tools/testing/selftests/bpf/progs/ksock_wq.c b/tools/testing/selftests/bpf/progs/ksock_wq.c
> > index 16a1873d132ed..290736e219e1d 100644
> > --- a/tools/testing/selftests/bpf/progs/ksock_wq.c
> > +++ b/tools/testing/selftests/bpf/progs/ksock_wq.c
> [ ... ]
> > @@ -43,20 +73,40 @@ static int ksock_wq_callback(void *map, int *key, void *value)
> >  SEC("syscall")
> >  int ksock_wq_start(void *ctx)
> >  {
> > +	struct bpf_ksock_create_opts opts = {
> > +		.family = AF_INET,
> > +		.type = SOCK_DGRAM,
> > +		.protocol = IPPROTO_UDP,
> > +	};
> >  	struct ksock_wq_value *value;
> > -	u32 key = 0;
> > -	int err;
> > +	struct bpf_ksock *ks;
> > +	u64 key = 0;
> > +	int err = 0;
> >  
> > -	value = bpf_map_lookup_elem(&work_map, &key);
> > -	if (!value)
> > -		return -ENOENT;
> > -	err = bpf_wq_init(&value->work, &work_map, 0);
> > -	if (err)
> > +	ks = bpf_ksock_create(&opts, sizeof(opts), &err);
> > +	if (!ks)
> >  		return err;
> > -	err = bpf_wq_set_callback(&value->work, ksock_wq_callback, 0);
> > +	err = ksock_ctx_insert(ks);
> >  	if (err)
> >  		return err;
> > -	return bpf_wq_start(&value->work, 0);
> > +	for (key = 0; key < 2; key++) {
> > +		value = bpf_map_lookup_elem(&work_map, &key);
> 
> [Severity: Medium]
> Can this cause a workqueue double-init on big-endian architectures?
> 
> The work_map map is defined with a u32 key, but the key variable here was
> changed to u64. On big-endian systems, passing &key to bpf_map_lookup_elem()
> will read the most significant 32 bits, which will evaluate to 0 for both
> key = 0 and key = 1.
> 
> Because of this, the loop would fetch the map element for index 0 twice.
> During the second iteration, bpf_wq_init() would be called on value->work
> while it may already be actively queued from the first iteration. Does
> re-initializing an active work_struct without serialization run the risk
> of corrupting the global workqueue list and crashing?

Yeah key should have been a u32 but when doing so the verifier loose
track of its value because it's only taking 4 bytes on the stack and
then it detects an infinite loop for my two iterations, I'll do:

	u32 key __attribute__((aligned(8))) = 0;

So that the verifier can properly track the value in the for loop.

> 
> > +		if (!value)
> > +			return -ENOENT;
> > +		err = bpf_wq_init(&value->work, &work_map, 0);
> > +		if (err)
> > +			return err;
> > +		if (key)
> > +			err = bpf_wq_set_callback(&value->work, ksock_wq_create, 0);
> > +		else
> > +			err = bpf_wq_set_callback(&value->work, ksock_wq_connect_send, 0);
> > +		if (err)
> > +			return err;
> > +		err = bpf_wq_start(&value->work, 0);
> > +		if (err)
> > +			return err;
> > +	}
> > +	return 0;
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261013182726.276372-1-mahe.tardy@gmail.com?part=1
