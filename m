Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B616B3C8C71
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 23:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786664680; cv=none; b=mX7bp9I4lmE8Xq8hg+zctIUAM3QkptQWs4pWoFMsaKi01QHOrUHcNHY/eFpZxk72iDayGSf1t017t0ZtcvmpVdGsexQe1KNBd2RoaKXp2phSWjq+bZfbX0Kpgp5JyWg+n3OFZC74CfoFxrgAUtfu5Wr3kueOIiKj7ka8Me9AWXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786664680; c=relaxed/simple;
	bh=srmb9zTlyp51XEA972IHbfAxn8h2GD0juy/qxH/QcN4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Jc+gPnDAiXPmQwCudAO6w+rWVzsD2JBttKMHlsmH1S3Fg76OTUmTObs7jmyr98kt2zCbH65tvPg1dJSHB7DSbRGn4IZTXBOvClYInomFQ+L4J8/1pc6sSw8RrF1LBiiAmhETO2TvLAm/x1K8YMWZvQFrk+r1Cx/ksuvxKmF0U7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VdocajAB; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VdocajAB"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbef7b172easo774547a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 16:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786664678; x=1787269478; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqxisrCvBgfkAZVjDOUq5Fmah125u9gQAdSBbncAguA=;
        b=VdocajABXcPJNPaUNLAvJWgsAVa6z86bRBA+aBx4zGesAJcVRyrBVlTwMq7kERnZQv
         TMAVlERAuvHlAwVSvxVDJQZpQA1GmL0zr5hAJwD9PU2LQdxiZeUIkz6AiO5mLDA2yP6T
         XpM6xok6D0M5GEpQKY+vZ2qWw3AD1hGrUfhJzato9GAD2jDoPzZoOc0ro/WgidJHF9ou
         kNNDakBBjR1fEv5IRSv5jQGAo1xnLGLNWIUWGv5wf5T/4CCurUmlTi+G0qUThoHGHiEZ
         h3tbOyDr8Q8Dlu53ETylBXL6W/IFsrgejPxxAO7VZkojNvr6/ljMtVk3CSmzbp2r8zSk
         ZPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786664678; x=1787269478;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqxisrCvBgfkAZVjDOUq5Fmah125u9gQAdSBbncAguA=;
        b=OvNNTts9t6crGPNuNI8D1MLNRddzo4Hp5akU2glRo+rdKUsE0frhLARXOjVUYuP10Z
         T4jW9j/gmChpwckVsyIS7rr/z0BNNZ/EYh9Xo7KJ/mZ2I8zQv8npB6cRy5qv5yR53ug6
         G0/BFxoLBKhW4oqg2WykL1pIZpwZi4BSMSCwRpbusN9irCCJPJ28ldP16H9iERu7qRJg
         B7hRJn6zcO3zaayDNtTTLu+mQiNaY56d0hBtjrSSGPeqiKKGBjN3G1JxVxfkT1V74Ese
         2oq7uGwApjZ2MzMLeisGLRGTsMGeCd3iNpc+h4SfNSUWw5y7YvnMMaGHspiKQQik+VUm
         ZHJw==
X-Forwarded-Encrypted: i=1; AHgh+RpDeHY+QJYKjwAB47JUta32uJGqDcvDPi2N1uitQPfKXGlF8Z1yjO4+MEQvlFe7LadUduGYExgFsGlmhRDXqcM=@lists.linux.dev
X-Gm-Message-State: AOJu0YznTqdJy1pu1pAduGzBpqMp/fnANWrPhyWBUtuUcxrh4yxbighD
	/iM3QIYzcJo+/ZPdlzbUSCsumKv16hj4t69LWU7QwovaCR894KnkYRrzhhB3b86N4T4Z6Vg+bO8
	v3i+Mrw==
X-Received: from pgdf6.prod.google.com ([2002:a05:6a02:5146:b0:c85:9c9a:ab5b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e613:b0:3cc:55ed:dbfa
 with SMTP id adf61e73a8af0-3cc71cd3ee1mr1657677637.27.1786664677905; Thu, 13
 Aug 2026 16:44:37 -0700 (PDT)
Date: Thu, 13 Aug 2026 16:44:37 -0700
In-Reply-To: <138969948dac13369ddebd72bf523dda4dda6b85.camel@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260812080229.2481439-1-xiaoyao.li@intel.com>
 <20260812080229.2481439-4-xiaoyao.li@intel.com> <20260812082306.11E8B1F000E9@smtp.kernel.org>
 <8b05ead1-ef2c-472f-a613-bcd1a65b64e1@intel.com> <138969948dac13369ddebd72bf523dda4dda6b85.camel@intel.com>
Message-ID: <an5W5XC97HK229MX@google.com>
Subject: Re: [PATCH v3 3/4] KVM: TDX: Don't assume exit_reason[31:16] as all-0
 in tdx_to_vmx_exit_reason()
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, 
	"sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 12, 2026, Rick P Edgecombe wrote:
> Side note. I really dislike how tangled this area is for something that seems
> like it should be much more straightforward. Deriving partially I think from the
> overloading of the TDVMCALL leafs with the exit reasons. So we have things like:
> ...
> 	case EXIT_REASON_EPT_VIOLATION:
> 		return EXIT_REASON_EPT_MISCONFIG;
> ...

I peeked at that code again, and FWIW I still think swizzling the exit_reason for
TDVMCALL is the least awful solution.  If we don't do that, then we'll have to
update every single use of the exit_reason to demux TDVMCALL into the "real" exit
reason, which will be a mess.

And once we track the exit_reason separately from vp_enter_ret, IMO it all becomes
more logical and easier to follow.  vp_enter_ret holds the information about why
VP.ENTER returned/exited, while exit_reason holds information about why the _guest_
exited.  Obviously it's imperfect since we're still fudging EXIT_REASON_EPT_MISCONFIG,
but again, I think that's a better alternative than demuxing exit_reason in multiple
locations.
