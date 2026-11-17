Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874568;
	b=ewY2PNxEIF9ZSH0VksTh3oCBkHctn7966P+nQQYE3D3yLiUQFKWqXO7/lSucBYEwNI8F
	 kCJFhNCUg1f2bllbKf13bUcO0BZK+W0wfaCFcnhdrMY2dF8lOjYr1Nj5Z2vpEkaZjMl7B
	 zAUV44HCBFOWzC7CsaJDGJfS4ge05LZfR9GoxxquPbsC+Ks3hCcQ9wjWDvgSIKs1mlTMh
	 w2umkYinzvLbxRMw+bl8QE0k7yvmbvg+ZflSAk76jtmtjhIurFRjs6kCB6/FbnHIxqBZf
	 daYfhFY6XyfDi8vBQOvldTaslIlt1i2jOZlmzeg9aZ71Sa5IOuTT0SCheaHOCO4sstQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=6Fr2y94eB7vF/SQa85O6565KP4ExGO7wSrwqxd2tRoE=;
	b=DyazyoFmwkwVJ6gTGcO5AgBcBDtnS3RyqCIrB5MXpICS2wczA1efQqpBiQYPbnwuZlu4
	 srLMDaXJsW+f2yGNYj9A9GBPhsTGliJ4HKmcoHx6K4uh8ClltvtZ57ze71t47OMu6DvhQ
	 YgHhLkMH9LNPT8V4Kg+OvK4NVt+hbw6K+RmQD7drc8CMS8QN4qV1M87jdzAgg6AqsozgF
	 alQr86rr5qsHIjsZ5YTPP1eWhE45LdJQu262wQR7mwmGvPEHUkKt958V2dTJZt+W/bGjt
	 nEtCLfpPcKcGw/bp6T5Ms4HjUwQ0H06tsPbXi/n/+P7RGARWIgnady23v1BLj4cNV6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=fF5pevfF;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811F0606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 00:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 811F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=fF5pevfF
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6685238eec.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 16:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794874566; x=1795479366; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Fr2y94eB7vF/SQa85O6565KP4ExGO7wSrwqxd2tRoE=;
        b=fF5pevfFhu+sVrl00qdrw1nYxlIVfH3PbAqB0TTmPB1ZBncNWvi3qHfDn89/pw/YyW
         huCzqmu6kwti9fMm6x+UhWuI158pfRmflrluecYsXM2UQXyP2xUPaf7ZWEvj4vTbzacL
         +nAq4QI5F8/hfggCTuX5gme6UxdSz1THZ4cfXc/fJQ2s2vATG+GKEJivFNR5V5Fwr/5w
         ewCMp5+S0XBxdVBhEoKeL0fE4t9ab9mGlpmhxhYrdrUlTay41S3VGP3UubELgTNsf99m
         HFY72S7zB1dsMuBq9PrxZdJXpjDwRzI8BneaLLMXjUMAPjt1BLhvKKTOS/8sBS3KZXFd
         FTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794874566; x=1795479366;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Fr2y94eB7vF/SQa85O6565KP4ExGO7wSrwqxd2tRoE=;
        b=RwgtOXD9xnyPdifoe7knCmwlfEcTTmNDDGUjEkSalRtA1i1OwlKp1lJEPZD0Z8vubV
         zLnUESWtv3iCeOB95AP4244Eex9ZZQTnizIhskfCDS7cC0TiP6zyCK5gdGhKCZdyC+bo
         QXb3sBzxsJxUmO96x+RUNHcZBQa00GqWFgoCc5WIZSNRC3TQ6AJJdLoUJ2zCCzroS6Ac
         IswqiIHqFWEme34yfF3cGtmSdoiB2+S8iHysde2YD0fOdAPebWA7XNQlV3U7DBKTNO6L
         DNYDJQcbL47AAdWLpuRJhAivdTs6S0ZzlaFNHr4/TF0NTGD2ksqEmVOPr0x4rPFv1W89
         90ng==
X-Gm-Message-State: APuU4Z9Py5ZR7cDLxbQh2r+8XrE1ytc6VadT6lVHDxk8+MduRVQHs69j
	bNYSUpv00Un+h9CV55nca4nHmlcB+GdZTT4ryx1zoUFslXS8jBQfntE220awRsIaaiWABZjaMm3
	yTxqAU9ujmL4LIKJaJLlJ5qZga/144zAa/Mnk2hsMPLrhAVy+9Ksegh0IT80+kYdaK1fh88W/gp
	rCvvcY3Lp46u4DfNqDgvcOzphqobvGZ+eB6J48n7h9vdb170+w2gStFlq5+/JO
X-Gm-Gg: AZFdTZcK4soxOIhQUuW5sO3gs2JqJu4vpUS6xXCxcqDrAtKKu2uOEfBIJ2LoWvSnnIC
	h6be1Y6YT6hae8krNsDCw3dxt0CL2Z04cp/rz4dKJADvszIVDDvhTiru4XH1qgFLQKCoU9HtU6o
	aSBDgQ6CCDhM4a8ajym4Glwxh35gRX029NNRUauChG467Rg6VCCBYLoadPkVgWhr0Qy9EaJRdzR
	D6T4mI4/WQs6FcU+WO3uLvAxHGynUPf2o/0lOssaTCfnZKehFyrKDujLOxCZI9QxoxRXGrn81pR
	3yVEBwoPD9p3jpjSNifBbm3X9mCO/Lb5troGYOkVPJGZEorHdp1dywxFwRn7tQ+dbdUokG52xNV
	2CuOoJmThbe+hQpJeS2DaSHCb2ZuMzwMKC6YpHQ2p0Oi8xbCQq2q9eFDlXRntIVc72qccY+WOgp
	ILaTL9NVGplXFDA18+BwknO4i6TU4T+bXkK8hWBTc7npuQrbUoo4XGfSD2cQgBE5zrTNp2b/huA
	eQvv58uwT8CW2Ab8p4bHZ3nOUheKLtQ2gC1pUtFsjdeZVSCIbLAGuRKTuTxzleBaE+wTTayPlSp
	BA0Rg5+IBSmWQz5ipyL1+/Ye5gLrBnYdgIrcTI472JcbcRmSaQ==
X-Received: by 2002:a05:693c:68ca:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-37967410b8cmr11537513eec.28.1794874565874;
        Mon, 16 Nov 2026 16:16:05 -0800 (PST)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-379565d269asm41244285eec.23.2026.11.16.16.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:16:05 -0800 (PST)
Date: Mon, 16 Nov 2026 16:16:04 -0800
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
Subject: Re: [PATCH v7 04/17] nvmet: Implement CCR logpage
Message-ID: <20261117001604.GE1670230-mkhalfella@purestorage.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
 <20261114030454.2836543-5-mkhalfella@purestorage.com>
 <sashiko-outbox-214097@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-214097@kernel.org>

On Sat 2026-11-14 03:20:48 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] nvmet: uninitialized SGL tail leak in
>   nvmet_execute_get_log_page_ccr()
> - [Medium] nvmet: premature CCR cleanup before SGL copy in
>   nvmet_execute_get_log_page_ccr()
> --
> 
> commit bd4c242dbfa9b91e0bb3eb6e57be8d11c6a19d19
> Author: Mohamed Khalfella <mkhalfella@purestorage.com>
> 
> nvmet: Implement CCR logpage
> 
> This commit implements the Cross-Controller Reset (CCR) log page (LID 0x1e)
> for the NVMe target and advertises it in the Supported Log Pages log.
> 
> > diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
> > index 3df9db454db9c..25c320752d2a7 100644
> > --- a/drivers/nvme/target/admin-cmd.c
> > +++ b/drivers/nvme/target/admin-cmd.c
> 
> [ ... ]
> 
> > @@ -617,6 +618,46 @@ static void nvmet_execute_get_log_page_features(struct nvmet_req *req)
> >  	nvmet_req_complete(req, status);
> >  }
> >  
> > +static void nvmet_execute_get_log_page_ccr(struct nvmet_req *req)
> > +{
> > +	struct nvmet_ctrl *ctrl = req->sq->ctrl;
> > +	struct nvmet_ccr *ccr;
> > +	struct nvme_ccr_log *log;
> > +	int index = 0;
> > +	u16 status;
> > +
> > +	log = kzalloc_obj(*log);
> > +	if (!log) {
> > +		status = NVME_SC_INTERNAL;
> > +		goto out;
> > +	}
> > +
> > +	mutex_lock(&ctrl->lock);
> > +	list_for_each_entry(ccr, &ctrl->ccr_list, entry) {
> > +		u8 flags = NVME_CCR_FLAGS_VALIDATED | NVME_CCR_FLAGS_INITIATED;
> > +		u8 ccr_status = ccr->ctrl ? NVME_CCR_STATUS_IN_PROGRESS :
> > +					NVME_CCR_STATUS_SUCCESS;
> > +
> > +		log->entries[index].icid = cpu_to_le16(ccr->icid);
> > +		log->entries[index].ciu = ccr->ciu;
> > +		log->entries[index].acid = cpu_to_le16(0xffff);
> > +		log->entries[index].ccrs = ccr_status;
> > +		log->entries[index].ccrf = flags;
> > +		index++;
> > +	}
> > +
> > +	/* Cleanup completed CCRs if requested */
> > +	if (req->cmd->get_log_page.lsp & 0x1)
> > +		nvmet_ctrl_cleanup_ccrs(ctrl, false);
> > +	mutex_unlock(&ctrl->lock);
> 
> [Severity: Medium]
> Can nvmet_ctrl_cleanup_ccrs() discard completed CCR entries when the log
> page fails to copy to the host?
> 
> nvmet_execute_get_log_page() only checks that req->transfer_len matches the
> command's NUMDL/NUMDU length.  If a host requests fewer than sizeof(*log)
> bytes (for example, reading the 8-byte header) with LSP bit 0 set,
> nvmet_ctrl_cleanup_ccrs() frees all completed entries from ctrl->ccr_list
> before nvmet_copy_to_sgl() fails with NVME_SC_SGL_INVALID_DATA, so the host
> permanently loses those completion records.
> 
> > +
> > +	log->ne = cpu_to_le16(index);
> > +	status = nvmet_copy_to_sgl(req, 0, log, sizeof(*log));
> 
> [Severity: High]
> Does this leak uninitialized target kernel memory when the host requests
> more than sizeof(*log) bytes?
> 
> Transports allocate req->sg for req->transfer_len bytes via sgl_alloc()
> with GFP_KERNEL (without __GFP_ZERO).  Because nvmet_execute_get_log_page()
> only checks that req->transfer_len matches NUMDL/NUMDU and
> nvmet_execute_get_log_page_ccr() neither rejects req->transfer_len !=
> sizeof(*log) (like nvmet_execute_get_log_page_rmi() and
> nvmet_execute_get_log_page_smart()) nor zeroes trailing SGL bytes,
> requesting more than 4096 bytes copies sizeof(*log) at offset 0 and returns
> the remaining uninitialized scatterlist pages to the host.

@@ -626,6 +626,11 @@ static void nvmet_execute_get_log_page_ccr(struct nvmet_req *req)
        int index = 0;
        u16 status;

+       if (req->transfer_len != sizeof(*log)) {
+               status = NVME_SC_SGL_INVALID_DATA | NVME_STATUS_DNR;
+               goto out;
+       }
+
        log = kzalloc_obj(*log);
        if (!log) {
                status = NVME_SC_INTERNAL;

Fair point. I will add the check above to fail get logpage command if
the buffer does not equal the expect size. This should address the two
issues above.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261114030454.2836543-1-mkhalfella@purestorage.com?part=4
