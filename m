Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F6D55D886
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085621; cv=none; b=AHYYcBtH7jol/JB2AmtYDBe9ZEDjDt6b9b7prLEiWtJQLIUqxzg5fT8EgEN7DsidrfYmZQ3MFn9+31FMpzMM2z4dBzdnJyBU9h/2ZRJ/lFC9BWsUzuL15tOvM4uJx81ijl4p0K5BW0JV3T7mZBJAaDJmUceeDG0+nbrehNPxtdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085621; c=relaxed/simple;
	bh=brRNWKnrLqwVE5T8M8LcZ6w1E1wZ91rPRMyhNVJXlts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkBEnsqKyxen7ml/2M3vb9iiCew85H22KKEEThwQXv6ErDIR8iKUc3Pf8gWAU+FbIFM1heKnh1H6toza6ogVnIF74TsgCqLuYP3vTrH+NvucAad4kDxRTD2TZUcNtxwSUo9MLuQ2gwT9e00dcTdkmVvfsb+0CfDOAukUZ2bMIoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=YUINB3jh; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="YUINB3jh"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e7457349eso162088185a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792085610; x=1792690410; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eduX5UuEmhrtcI7x1q9okGgwM5pPRtmkh5WfBPoNnZI=;
        b=YUINB3jhh0Msjl+StRx7El1QjIEn/0n/ErKMXW62s5kHXuCQ6C3mGmTJwadOsAU8CL
         AaZnKBRTR2OAVUpmVa/tasJXJJ8/xhAIwh6Y28jtXZEQ9FvA3rb1dhJVfonkoIS0BKDn
         53I+qvNabsj8K5g2DbBi4qFEqDH+HmSJ9BlbEUx3ySQ5+vTn25NXwJwafkTYGZDkZbkV
         TdU0+wC9Ukgz7+LezwfFkkwwgqhLlzkex/CJ539kHqEobVFPQBCXR171wvY3XhOPtxV5
         PcE0+tLRvvwYdQwqFHxtPrUYLOVVt05w9wXzhmYoG7jBINtFtnuOyAe/J3+IAjIjAAuV
         0SKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085610; x=1792690410;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eduX5UuEmhrtcI7x1q9okGgwM5pPRtmkh5WfBPoNnZI=;
        b=XWcNWxGPJNkXI3Ouf5cosGceCGCMBZtLLnCpDQtcpWp2UMlX9jvN2vpAzff5Raxrth
         wXbaiQNR6NU88m/BaOg2QX1xJmne5hoha9dJzmo93G0PmRiMlRti5Cumri7cpgWGGITm
         FvoOKvt1DQbx4+iCdmDLLnjsq+H5sKDbbxa5A3ZcjJKRFLENN0Z2qkOydckO2DTLfR8P
         mx+hecA96OB7NVG4jjPpux7NH17LLgxISy13mhOkagk6OdfWjvD+0p3OlEzCaoqKhTbl
         X6poquMGTrqgruiJhXjcXYrXLQU6DKgbm70XIrk2e7FEJqoEFPw+ngLbZuZhEekVd26S
         ZKGQ==
X-Gm-Message-State: AFq9FYLlvc75pra3SzOO4FhxV0mTv50Dz5jtwEiR1EkQ425GcYfG/p20
	4CiHrbL+tPY1qSb4rFYs4Wk2irGT0Ds/DEVjLnJ0BiMJfMFhG03J6TyXGlKbehtHAik=
X-Gm-Gg: AYBFou0mtzQvvL4Vvjzv+npDl+4q0p/EQWtuLWzeHf2Myks/yZAPqOw0JPnHJSE7hi+
	YpBSbBsqSbtVuoLufBVpUXKcIh69R7nNGoD+ggLISNxXBvfBG2We92fIrEqz+qgkvew3HyFhiqI
	spCX/YGNu+bUL3fE7HRqcXrGZ0vtzGVybCAhYQaESxkY/TmKvAvJ13dsuiDxU954lxuIgkMFiaJ
	ZMU+L+DrP2LvwPHYw9o7rSdSL4RPboC+m+l3gq4Wj3dbjqQcTCIKCGBVFGO2CNEKg0U17M0yjZO
	MwMgMxyGa69nQqL0ZY6FwweyDai0Fh9dlAkfqga9WwoCGhMQcc3q4ySVwt7GLuq4/slxO08SM8C
	SVVk+Wsa/LUAIoLh8NiXnwJp6J4/y/NN/xxSexu51N605hb6TpngIwy5br9LlyT9a0YbiLwmBYC
	SEtvmCZzWjdM/intGkD/D50FVpp6aSicCfjNshpkX2io+3Fh7QbqMqjSoxpDMrvSqcZEO9DC0xk
	Y1mp4LyCQDUAS36sdkwRYRvILOdG+eZNiUpqqkNtU1BCTDRpCPUuZh+
X-Received: by 2002:a05:620a:730e:20b0:93f:16d4:3bf0 with SMTP id af79cd13be357-93f16d4429fmr164733385a.42.1792085610273;
        Thu, 15 Oct 2026 10:33:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef502946fsm819330085a.24.2026.10.15.10.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:33:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHPKZ-0000000H5sg-3rcW;
	Thu, 15 Oct 2026 14:33:27 -0300
Date: Thu, 15 Oct 2026 14:33:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Eric Davis <eric.davis@broadcom.com>
Cc: sashiko-reviews@lists.linux.dev, linux-rdma@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH rdma-next 02/13] RDMA/core: add the UET GID types
Message-ID: <20261015173327.GU14213@ziepe.ca>
References: <20261014-uet-ib-core-v1-0-a0e626117113@broadcom.com>
 <20261014-uet-ib-core-v1-2-a0e626117113@broadcom.com>
 <sashiko-outbox-171976@kernel.org>
 <CAMouMY+nCYZ1V_-0La4phKNkvYBke7Njhsr+HRwWkAfahgf3pg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMouMY+nCYZ1V_-0La4phKNkvYBke7Njhsr+HRwWkAfahgf3pg@mail.gmail.com>

On Thu, Oct 15, 2026 at 08:57:44AM -0700, Eric Davis wrote:
> On Wed, Oct 14, 2026 at 3:35 PM <sashiko-bot@kernel.org> wrote:
> > Sashiko AI review found 3 potential issue(s) to consider:
> 
> Disagree with all three and no change planned. None of these paths runs on
> a UET port.
> 
> A UET port's core_cap_flags are RDMA_CORE_CAP_PROT_UET_[UDP|IP] plus
> RDMA_CORE_CAP_ETH_AH. It has no IB_MAD, IB_CM, IB_SA or IB_MCAST bit.
> 
> > Does this explicitly fail Address Handle initialization for UET-only ports?
> 
> Yes, deliberately. ib_init_ah_attr_from_wc() is called by the MAD agent,
> the CM, mad_rmpp, and user_mad. These all need IB_MAD, so none of them
> sees a completion from a UET-only port. The check is a guard as an
> unconnected peer is named through an extended address handle (patch 5) or
> the job's address table (patch 7), never from a WC.

How much of this follows the work Sean did in the consortium? I
thought he had defined AHs?

> > Could this cause incoming UET packets to be incorrectly mapped to a RoCEv2
> > GID index, breaking the UET transport response?
> 
> On a port that runs both RoCE and UET the MAD traffic is RoCE, so mapping
> it to RoCEv2 is correct.

You will need seperate ROCE and UET ib_devices with the current state
of affairs, we don't support multi-protocol today.

Jason
