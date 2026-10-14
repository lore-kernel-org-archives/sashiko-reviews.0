Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA694F402E
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 10:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974973; cv=none; b=hvlY58kDNyKFXe+ROZjg8W447/CYF3HSafGdqluiKP6he85+OM/bjh/WRXY1Whs6/A/F1NYaOwmFEfgGYW6lvHvnIjL+zPO5hoTnI/oOv1Qp3XiGmPjPpjYR3vylchoJ5SVyVHZCA616CTf8/EaktxxxcN9Z9zd3ey5wh2CEZlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974973; c=relaxed/simple;
	bh=DbFxwQnZYV5xBXzmlZTBkJtG4z48TGWo+5a2dmYo0Xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hs2/TUPEqN70iABKa3r22ys56YGkTFZTIC1Lzf/pxklNnC+KeUWkCHfl+gxwcc8MEGFcO6RGhU+pqYyHij/l+Am6nb/InaDojb8P0cx/cBFxW9CM0DDDCghEm9Aj9rYKlotOqBtU5pWyWHVVPLl8I+bnizVoGzYymn0JcbpOvtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTWoj9ag; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTWoj9ag"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a020e65269so25756225e9.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 03:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791974969; x=1792579769; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2nQL6bRnFw36T6f08+48z7f5+GEhSRGAmBKimZJZ1g=;
        b=UTWoj9agm03V3nHdcyp+nCJaS/G/6t2KYXWFe1OUg3Xlvhqr5XUMBIW8R0SSZJ2Mey
         Pu0bTI+RXeCmuoVGjmyxs1dZQkCUPDxrizL6J0buANwYTHQqipnj7NUsZB1GKPgiAVni
         R5GCn1W32tCj3tFbaM/kP1rZF1hvFJSqQjZ7QTRJ8zt3ZPm/WmzYThSLJ7TT16SFzLiz
         6FgAlNgKtx4Li5bY5ssXQU26XXIA6QLAPg4lcqRqSmBdXUmrL52UMgbGb9ohAPVpfyzY
         L0+Nuv8Qh/yU9TFSU+CSTc3Tp1QPpDW3a3I1exp8/trU3NW98Pk2XrStOmO9PLk8n8JW
         vfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974969; x=1792579769;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2nQL6bRnFw36T6f08+48z7f5+GEhSRGAmBKimZJZ1g=;
        b=fU7MdEKJbaq79fLm+brtH76uJ+BhLjKHirZWAyPX56q7Elq+XmaoEW+rwrPLG8m4Qh
         obX4ieAAQsAMC8jkzZ5MrK4XcTZK6FVvLK9DFFG3ykEgA+CxfnmkfdTmQmdQoXzo5Zx8
         frBeQ/oTCIsHbbBNakhroUkecIMjM2H7UkTRQzLKoUj6k/xeWwVPZKNOePWqGcsP/uGx
         Fgp7wTB3Z2p5gqR1SDVQGh3rpwJjFLTOpUKY1W5r12HW1Yno+1fePPsLXUhIjNq81wWa
         GbIL4WBpSNGZkkaF/TswNSMtF6ToZc7ZNG7X17Dpza0ckMIeTHoKAx6tP/WDTovzWTsU
         Rahg==
X-Gm-Message-State: AFq9FYIEHaa4Ei/ok17IXqAn5voQpkKZ+QVQGhELjZpGEEtFjmuJpwl3
	iOsO90rpSijY62zz4TCCcildWn18BMXDoHye6vupM+pC5sVTDFnDUOj+lnGBxw==
X-Gm-Gg: AYBFou3MXWNP5M2BrW86BT4Q43oXm2cdW3OuoFJCIl+himXK0x5f/kmgqTMz+0p9Zws
	wkN90eQ83fp4j18mo0pLvdUqPK+XNqMZL2f5Fps1p2TyJ6LcOsxb1ErkFwCzU3NsnN+p4sGnZ1M
	3jgGAVeuomKqNhZ6Nrx5uxzIGvlilfanyNB4hr2dJTXUgmlp6VJrRBtWyF0vPftrqy3ZyUbsNsK
	YbuR0vhpcAhNm0SfsKLx1mVAE9j2JLUKIN/PBMFuT3zpiCh5oUru2/0pGWkKHUuFl/NOui3NqQn
	BM7TEolXtzSY/EqhCvTrBnS9B/z9Utc6tisHM/utBZ2cQUDQaX3BnHVtyuKblFpHrYyUhQtdrik
	SFya9BztBbwlVega6lV4dXgun5VP4i0DWdyOn/ab4DckGNZePogycTgleY0cYiF5QYTDiLl8ywC
	hdZV/TXr+0Nc8r/9j6tsYdRXAuCG/PAOyybjIYK3VZJrj2RIJs1kgshpuSHRd40K3NU8q75v0Kx
	w9z+CNFAPn7JXBUTDhYpbVhS0CIGGRMpYeWGl66ni/jgjJGRuIZ3X1Dzr8eLd02Aydxz1eeUzqf
	pmk2YvqsdnkqSLZKl8299xniL1nsVH2ohATfeig6Uz6QJiKR9jktrgVAd/c=
X-Received: by 2002:a05:600c:1911:b0:49f:faa3:3ca2 with SMTP id 5b1f17b1804b1-4a18e4aae7emr326111685e9.13.1791974969558;
        Wed, 14 Oct 2026 03:49:29 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bd733fsm11231494f8f.58.2026.10.14.03.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 03:49:28 -0700 (PDT)
Message-ID: <f430200a-c6a9-4e7b-b257-51b3968c2933@gmail.com>
Date: Wed, 14 Oct 2026 11:49:27 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/13] nvme-pci: implement dma-buf backed requests
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org
References: <cover.1791924581.git.asml.silence@gmail.com>
 <a8c9ff112d4295e7a3f7c361e03f03ee5eb42e74.1791924581.git.asml.silence@gmail.com>
 <sashiko-outbox-170530@kernel.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <sashiko-outbox-170530@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 22:23, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] nvme: missing controller state check allows attaching DMA-BUF to dead PCI device
> --
> 
> commit 6741fe43dc1132ae4f51db272567ac5b56987f17
> Author: Pavel Begunkov <asml.silence@gmail.com>
> 
> nvme-pci: implement dma-buf backed requests
> 
> This patch implements DMA-BUF backed requests for the NVMe PCI driver. It
> allows mapping DMA-BUFs on registration and storing them as a PRP list to
> initialize requests. Attached contexts are tracked in a new list
> synchronized with a lock.
> 
>> diff --git a/drivers/nvme/host/pci-dmabuf.c b/drivers/nvme/host/pci-dmabuf.c
>> new file mode 100644
>> index 0000000000000..8dab59d936507
>> --- /dev/null
>> +++ b/drivers/nvme/host/pci-dmabuf.c
> 
> [ ... ]
> 
>> +static int nvme_init_io_ctx_locked(struct nvme_ctrl *ctrl,
>> +		struct nvme_dma_buf_list *buf_list,
>> +		struct dma_buf_io_ctx *ctx)
>> +{
>> +	struct nvme_dma_buf_io_ctx *nvme_ctx;
>> +	struct dma_buf_attachment *attach;
>> +
>> +	nvme_ctx = kzalloc_obj(*nvme_ctx);
>> +	if (!nvme_ctx)
>> +		return -ENOMEM;
>> +
>> +	attach = dma_buf_dynamic_attach(ctx->dmabuf, ctrl->dev,
>> +					&nvme_dmabuf_importer_ops, ctx);
> 
> [Severity: High]
> Does this code allow attaching a DMA-BUF to a tearing-down or dead PCI device?
> 
> If the PCI device is hot-unplugged or its driver is unbound, nvme_remove()
> calls nvme_dev_disable() which cleans up existing DMA-BUF contexts via
> nvme_pci_remove_dmabuf().

Looks legit. Going to send a v11.

-- 
Pavel Begunkov

