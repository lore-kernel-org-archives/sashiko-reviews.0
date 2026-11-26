Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701889;
	b=IZ14S7BRFjmFnaviUS1jiYSuVuwzUKqLd9mV4cRchKLHZNfjnVOj9FVyIILSpA9DbDKP
	 R3ORJPxVN6KCxtoEXQ1btn5bHQzT6sfrSUTxIMTihwVqChUmaxCSpp9BxC9Y5Vein7+SL
	 UcnX3slwQ5uv9UN9RkCMpEP5F/ujrPSqfFY8obX9hYXomkCLH3x32JxtNqMyD3ke81578
	 52Uu8Oj8izEOP4YQI4abg4szzmwdBfYaBh2vNTRztHwV7ghThRGMdEvT7WXXI1OzitWkA
	 J9HOpvjzpYde3DO7pgaAm+kp7Ay/ivSaM8ZcSK3wmdq3CKw+bgFIMuHwUjqrVYuW6JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ULOdJrhzU/wAffNTY82qW4SO373n9wxqM9z/O7l2caA=;
	b=Ca1B736GK3OzY3YMRCZS1LSUkNtZxXOES2yiOEocv4iiuV89p9GaLl1lCI25Ma5jbdFP
	 +FOAsCizuXB8gTnZzj1iJLvd6hM71zRxRervfYHwHmIb7382bVEVMGx60nQ+CqPJrtcAo
	 AgojxCZWima3eLekLJy3jQMDYJuCmIWbV4OUKlFL5nOeSzGjfC025p+r+NrGidJQFSck1
	 F0+m66QwfdkgDksMz5Zi5vBYC+0en3L4xmLQEYUMnTR+Uul0sfmQBFA0p94K5dvXdB0X+
	 ProtwKYJVVBYVWi7+5B8f4hrx4fOw1RH3ve2Gq/pmQDtRneZ6Ja9QRiJE6wJIvAPmyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=I09l4ZDN;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66070606A329
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 14:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66070606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=I09l4ZDN
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so66341705e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 06:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795701888; x=1796306688; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ULOdJrhzU/wAffNTY82qW4SO373n9wxqM9z/O7l2caA=;
        b=I09l4ZDNcHtcyK8YRWXxxJpkIz2HzJvD0ODjihfffcmROTbzOKnrPhtCsumAhMuSFT
         INO0dDry+Gu53Y0W9UDUnvxKVbQxpVkU3NtgknEpFBw5PvcDwAuiveMlIgQIjiCP9zTF
         pAIyEhlUQ6d9Q/MzCGUEZYiaS1rh72wNZaFW4dWZoJU9o0INzvt6eTzDXKN8HmDUA1Il
         u8vnUdBCv7i1ZBDlaSxg0lWYLFcWmcKLbcps9QkNQnXIWeWpSJLvXuZXKD5xRHPW/r+A
         uixUuj3GR1bUq4KO8kJcMRjOkUoRKQ+Ok415i946+7QAY3l1uDNudPu9plWk5D+vxRxC
         LHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795701888; x=1796306688;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULOdJrhzU/wAffNTY82qW4SO373n9wxqM9z/O7l2caA=;
        b=uir2Tn9pphFFRO39UNKnlTTSTRlTP3qJQwzqENqSjj5X4BlkWZNGw+ImvwKcgIkBYE
         Fp1kvMxW05uLhTTgbbzGv0msqotROUnSyDHjw5+wdZHE9x8Ymz79oa4OFKFDcv5xQiRB
         NVAGGxKok6d3j2f+fEnAM2PWS31bSBYtwQ0BVdNKrwiImHXuiXP416UW7eDYFbTa4249
         ojnnH5zagyUhp/gczONy+H1a7eeUQeJHolSejgbRJHH0syuG9FD8Fgtot2OvJZbxLREW
         honiMUcPQBl8RTT3tHxMpxUmM3vSyM1hU2ifwUXGm75X6UlJSgi9xz5oSe4AoeCGXnst
         MJzA==
X-Gm-Message-State: APuU4Z/zNUy+Z6/gRuTTipLnjXT9C1yvJvXOZXMuV5yxj5Ii791270Mi
	PKHIjwR+zOY+Hj+ywgtFdP2AYG7+tPeiCCGJy+6WSCkW8EJ+uQjeSMlHO+HLNd2Xb5I=
X-Gm-Gg: AZFdTZfCXwg+5HnvssMzfTqeyjo5NfE7hIBJ80GsbywPZKzaXyp62PQd0wH3z/FSTzY
	WUiDVOmlt1nhsZ9NUTLaW8QO88mxgigSlcIsstUHOH5AoUA/FNFusUVgFFLPCQCPQvOD9o4/sgn
	KkHCeJO0qInRRSLqNlbPu0cYyK2KRD0rWlYgH1+kqYJO7kyKSlfFORaqraawlLGJX8V70h4j/n+
	5zP84APuWVS12pVdxvpOdzaj/f/hs0HTO0B8Eb1sYNdNWzu36kulRsUp+E7AiPqHuw/hJnY+ccj
	Jh3Ywxrcjbujk1O0wPovoP0pc4+Csodx3UOL7n9nYqRmUZJ+MRKTGF/zmmqXL66NP6927vD7SrE
	EW/FUZ6CDgLAe1KCLwq8iO0S+uzh+vMWkk4oXXQhj0+0rF1yIsMqOIm/zRdUzsiOikxfw/AoO9i
	49oYY+k0WrgkGhA7aRKzgG5mgRXK7o87p0wbwqWfe0iaweveTTuYEajMR/riNxJfG1bbrW0VRac
	i9u4s589X8REc39bFZBvquQzGUBMGO9lyRiWbC8a7MTP1Row0o8ZNrw51FuJg6f0phqizEA1vyk
	gLKy3SMzsLe5gb8Gdp3ZZLp0MNSBrYAJNQKArxzy
X-Received: by 2002:a05:600c:8b83:b0:4bb:60da:56af with SMTP id 5b1f17b1804b1-4bb8893053dmr381871055e9.25.1795701887195;
        Thu, 26 Nov 2026 06:04:47 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm736831665e9.6.2026.11.26.06.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:04:46 -0800 (PST)
Date: Thu, 26 Nov 2026 17:04:43 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: sashiko-reviews@lists.linux.dev, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>, linux-s390@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: Re: [PATCH v2 2/8] KVM: arm64: Reset SP_EL1, ELR_EL1 and SPSR_EL1
 when resetting a vcpu
Message-ID: <awg8e0zM2DL87AKP@stanley.mountain>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
 <20261125-double_exception-v2-2-224689d8a764@pereq.eu>
 <sashiko-outbox-232760@kernel.org>
 <awam4std0Zifdn9k@stanley.mountain>
 <awan8mSx5cbzXzJ7@stanley.mountain>
 <20261126133744.219929-A-seiden@linux.ibm.com>
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
In-Reply-To: <20261126133744.219929-A-seiden@linux.ibm.com>

On Thu, Nov 26, 2026 at 02:37:44PM +0100, Steffen Eiden wrote:
> On Wed, Nov 25, 2026 at 12:18:42PM +0300, Dan Carpenter wrote:
> > On Wed, Nov 25, 2026 at 12:14:10PM +0300, Dan Carpenter wrote:
> > > Let me add the s390 maintainers to the CC list.
> > > 
> > > I considered doing it the way Sashiko suggests but s390 doesn't have the
> > > __vcpu_assign_sys_reg() helpers so it broke the build.  The registers are
> > > not the same so, either way, some of this is going to be specific to
> > > arm64.  But Sashiko is correct that s390 probably keeps a stale SP_EL1
> > > across a reset.  The s390 maintainers could probably take the selftest in
> > > patch 8 and modify it for s390.  :)
> > > 
> 
> FYI: the arm on s390 KVM in the current upstream state has no idea what
> SP_EL1 is :) 
> 
> > 
> > Actually, never mind.  This can be done in kvm_reset_vcpu_core() like
> > Suzuki Poulose suggests.
> >
> 
> We share kvm_reset_vcpu_core() as well :) 
> 

Yes, Suzuki Poulose told me about kvm_reset_vcpu_core().  If I put it there
then I don't need __vcpu_assign_sys_reg().  Thanks, though!

regards,
dan carpenter

