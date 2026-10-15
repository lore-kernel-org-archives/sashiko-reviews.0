Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6243F9F44
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 19:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094052; cv=none; b=mRQw1gr3ynbQkxgl0rtyEZS1PVUpm2hxWB43IbxezgD6AR+DtltxC+i9DGp5blZAvSj4kI8I0coqA7TqysEr7HHILejPMZWwmv1tBD0hD8AZXPvTq9mlnVxMJlRfay69D/YrK+juBWBQvaOMxUpcIpfpcK6clBGxoo6hkRrQTzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094052; c=relaxed/simple;
	bh=lamv/oWnH/WNaVd0xYfru+Uciw5oZNdonWGeFyBY37U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWORjRSwHWz1r3Za8GAjTGJ14UIJr4v3xHmYeO3s+BFeFacRYCVz6a3a2eXCct5kcLbQzgxkEPGupHkMwodsz22seDDgtSWdj4we50ZNVoC+HgT59cJqPJ5QUDR3ZKy06Hv4DJKixTSGKqOPf1SLSEJDDaA0Uq/ewHq8TUfuVi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Ba9jt0xm; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ba9jt0xm"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e503815adso409025685a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 12:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792094050; x=1792698850; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yz7tOCbp7wDhENSlXzMolHxr7bpwiFTGlAsANFk9cDs=;
        b=Ba9jt0xm1F3edeItYdyB4wVb1LkXioAhOusLDOGvFSnWGTRAbVaF/Kc/1Td8jy1D+w
         VSEbeZnFMpp02LQ7O2kgmM+h7HSuKUXb1IB7eKMgUazOX3INZrcCcpxZ+cR7rfWtsSDS
         76D1bWnCSwZFygL5pIbnDgJvRGZ3HD+DDyRf8NBRK33WcGb3JpKJe27BaGD9mlNpm+GF
         E52Iqp4UA8s+zk1jlDKVKTOG+wBpSfp8NMfFmo6OU4i9dbqq1smFKbWSxMZLznCc+pPm
         qy8i4HO2HtAQ4apeQBS6D1DEQh/c2FH+Yk7kAHblQ1x5vuGJJxT9sg2HUQA88JCnydhZ
         f3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094050; x=1792698850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yz7tOCbp7wDhENSlXzMolHxr7bpwiFTGlAsANFk9cDs=;
        b=So5owZsT5oDAoCvd8ggTZ7cj0MmByZpmUd9h3mMuqtc4l9B47B5KYCuq4zHMtDjXHX
         9VbTZSyILwGJ/GG3/oVD8yCda9iH4OnESEMi01b8uhhaU4JV1PdMDASKdC8/Ty5ff0fJ
         AlZKflB4DPVbMq1o0ev00xAsu/x+o061zsmbsSUl/LjDYbNUoPCNYWMkTbYJ6Td2Zebg
         OIaZpnnJOqm1c3sd3h521bfBo5cdjMuNUEyuzPPYTPMr7TnsPOzAPQPnL+L9smj5U91V
         KqG2Vtl0X6b1Ws8+wIJXst2oQlhIo8rrKr7I+aBCoPr3VGSg0BRnLCWUI/czeHDYcbL3
         n7fQ==
X-Forwarded-Encrypted: i=1; AKwUvBynAoO8pYHNlFoUCwpXX2ZuH8sGBpu0ffmrw3cI95cSgujewWdE0gI9cnFX1RONkwvriVK+1yng5oT3mkUmeAQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYJFhv3Frbyezri8sVkXLcnjTMn6eglxvisgy0lp7pbfvT8e9eik
	FwfakoAIBHUaGNOiCDOE8HVtZuWRYDkdtpB6TsBdK86uooQ2lV8shgP3s3pdTXxf1L0=
X-Gm-Gg: AYBFou0/SC+CCPtDu5Y5TLXwOwiiBj/Xndg4ZzJeBWhi1rmCnkq5rgrStoHVip0+5Ul
	uXV14qL4Oj8d+EkqSUHp1oxXzls4xkUzr1rGIK1jXsSS9newpLw2DiyUppInNOuNwgF381FiFFP
	+KaKPFzLErkR+wKJm+YBeqScw6umGZAvpLDXq1M7m97vplncYpg9+oWimoeVf/PYzd6XLbfqlvN
	OKfuCt7fOEl1BphZf98czMqnuQ91RymIgr4Y0SOEfNIbM1bakY1IlHcsHf8/IkQfVARw7nFfGgH
	4v7spaSfmBbfFF/UthNMIQo3ko9beX1AZP+gtm+OFeSGPhlqARRs0iOCXkS/EX0zs3eOEjx3VNf
	rqgZjJSxnePMDxtdoj7v6TnGos88Vraou0ADJOAJ/lHrzRmYKMDalKuBz9N0YAs9N8zjuDM9FUa
	Jwy4r/UPlzszX5/ZV6aUk1rpjSPFQyv2LT+hmhU95+2IrIdQPYxud7aOO+1YssUD+BEekoyItNp
	gSYoTuj5triauphIuDvdnIinLfb4hBs8oibl/4KViuzucrHQXq+VuUZ
X-Received: by 2002:a05:620a:2b9a:b0:939:a0f3:6aef with SMTP id af79cd13be357-93ebd1ba6eamr3282413485a.23.1792094049829;
        Thu, 15 Oct 2026 12:54:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a198853sm16982085a.28.2026.10.15.12.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:54:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHRWi-0000000HPMl-2XS4;
	Thu, 15 Oct 2026 16:54:08 -0300
Date: Thu, 15 Oct 2026 16:54:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Hefty <shefty@nvidia.com>
Cc: Eric Davis <eric.davis@broadcom.com>,
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH rdma-next 02/13] RDMA/core: add the UET GID types
Message-ID: <20261015195408.GX14213@ziepe.ca>
References: <20261014-uet-ib-core-v1-0-a0e626117113@broadcom.com>
 <20261014-uet-ib-core-v1-2-a0e626117113@broadcom.com>
 <sashiko-outbox-171976@kernel.org>
 <CAMouMY+nCYZ1V_-0La4phKNkvYBke7Njhsr+HRwWkAfahgf3pg@mail.gmail.com>
 <20261015173327.GU14213@ziepe.ca>
 <DS6PR12MB53456734E5A7CFFCDD7FBCCC0CBD9C2@DS6PR12MB534567.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS6PR12MB53456734E5A7CFFCDD7FBCCC0CBD9C2@DS6PR12MB534567.namprd12.prod.outlook.com>

On Thu, Oct 15, 2026 at 06:57:31PM +0000, Sean Hefty wrote:
> > On Thu, Oct 15, 2026 at 08:57:44AM -0700, Eric Davis wrote:
> > > On Wed, Oct 14, 2026 at 3:35 PM <sashiko-bot@kernel.org> wrote:
> > > > Sashiko AI review found 3 potential issue(s) to consider:
> > >
> > > Disagree with all three and no change planned. None of these paths
> > > runs on a UET port.
> > >
> > > A UET port's core_cap_flags are RDMA_CORE_CAP_PROT_UET_[UDP|IP] plus
> > > RDMA_CORE_CAP_ETH_AH. It has no IB_MAD, IB_CM, IB_SA or IB_MCAST
> > bit.
> > >
> > > > Does this explicitly fail Address Handle initialization for UET-only ports?
> > >
> > > Yes, deliberately. ib_init_ah_attr_from_wc() is called by the MAD
> > > agent, the CM, mad_rmpp, and user_mad. These all need IB_MAD, so none
> > > of them sees a completion from a UET-only port. The check is a guard
> > > as an unconnected peer is named through an extended address handle
> > > (patch 5) or the job's address table (patch 7), never from a WC.
> > 
> > How much of this follows the work Sean did in the consortium? I thought he
> > had defined AHs?
> 
> Eric and I worked closely.  Most of the UEC work focused on the user-space interfaces, but the overall structure should be aligned.
> 
> UEC defined an extended AH.  ib_init_ah_attr_from_wc() could probably be extended to support UET, I don't think it would be used, however.
> 
> > > > Could this cause incoming UET packets to be incorrectly mapped to a
> > > > RoCEv2 GID index, breaking the UET transport response?
> > >
> > > On a port that runs both RoCE and UET the MAD traffic is RoCE, so
> > > mapping it to RoCEv2 is correct.
> > 
> > You will need seperate ROCE and UET ib_devices with the current state of
> > affairs, we don't support multi-protocol today.
> 
> UEC intentionally considered multi-protocol devices, with a vendor deciding whether it would need to provide separate SW devices.  E.g. using UET for MPI, but RoCE for storage.  Protocol selection is via GID, same as RoCEv1 vs v2.
> 
> What blocks multi-protocol support?

Principally I don't think we have the APIs to discover and link the
GUID to protocol to QP type appropriately..

Jason
