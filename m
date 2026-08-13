Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608D22931CE
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 00:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786580437; cv=none; b=buRdcTgoIkdhHhIHOZgwn73pt5xt29aP0Fh+pXxeM5QLWEFC2xFIc4IxN+9s9uJMd6QSvaE1bh/3Ix/E10B4wg2EeHvKDiBqKq3I3mE4Ug1OFVEQ//3q//q7yGJyLxN3O0nb5+K2lZ3yrndOyq+qbUR1t0OfrtrsCnM5Kc1f4kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786580437; c=relaxed/simple;
	bh=Sxrwx/3H6vvFb4P3DmxA3ygoHV+JvbXJNwmyBv4uFDc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IoEPoJkPHmsqqMR5plpqZC+dOsPTLhZK+P3dBw9A4J2hMsJwtXiBldawIDWh+Oy4rjhMIwo5NQV9uNrtkM3ZKe5/jOlZ1w8+XtRoZYF9GXJLGEDfsmC83edf5S4TjEpilkAB+VCMjNFrbPgBbb3SiqlGLxWpyQvCpKQpFuZxaZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UQnjikY9; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UQnjikY9"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84eee2147ffso231209b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 17:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786580436; x=1787185236; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTTJxbYDLzilzFrnq/ue/6XV3N0/n+FGwD1ynmItG2U=;
        b=UQnjikY972da+ottXgt+TWLcuZ8NmYculLfkJz6NCfAOfVurWyqRyyt2vkapSdTb5b
         FBpiR3aBQS4oUTXy0tVCtbGw/OF3b9jPi2H4phFacbURc274NLOWfMyEkMpxI/Rkjawe
         Jj/lUOc5ulW+mgK0dbAbHoB6g9AL/zNHE91uv+5O1czNxKAqbAzcr1TLqMQEXYx+TST5
         1GXMqTA4o2VY+7CDPuyK+HnpKkIiv1jr3BWuA6qHNcUKsp1pftpT/ooAZ8j2LA0EePii
         IUsGxTMzWZuSx6t0kdFQfsek9qJAv0SQaX4su+pZHtP01sDXZ7xaawSDHpMqeewxM7yG
         0iWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786580436; x=1787185236;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTTJxbYDLzilzFrnq/ue/6XV3N0/n+FGwD1ynmItG2U=;
        b=fDo9XGMWl21ZqKADTUSDKSu5IAtVUTubYWFI/MsGd1XmNP2LYu5+s0iyaeirJSe5aZ
         HGG5Svbk/ARy0dRSIJw8/2gEVn/N6anzx1dOg2v3zG6+yX22ngP8sXyOzvc4CXnUxFFH
         xOvicraP/aAUvqhNCUWeBOT5SnhDzU0toe7udSYaJoLRDFLyIm4ZhpkMe8yFz6j/HAJI
         Gzc7rfMLZ6oCDFSMBoSiEEr7+HtQr+zHNADrDquL5yPCVtyK6P2t4iGbEEN5JpSV3yun
         nXHJ0pCJRhwycfrRjvuyEZ9Zc6QaCX0sxzmauItphAGwoIazKjp7nUvCiHT15eubb3Z/
         NzTQ==
X-Gm-Message-State: AOJu0Yyvyg5zyf4SrBnGdnXcIF3on5/xK0934kG6+sw6KyqP36FLRkRq
	pWGzY/hvWPa/u6MIqso5SRQQ4vBQNMffj2hRxrpR0n/sumuWHrY8lbB5zJdtmJZ20HOrT25NQaf
	KvINqFg==
X-Received: from pfbhu19.prod.google.com ([2002:a05:6a00:6993:b0:84b:62d1:9fe3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a257:b0:848:3e74:85eb
 with SMTP id d2e1a72fcca58-84fc74936d1mr1770176b3a.1.1786580435517; Wed, 12
 Aug 2026 17:20:35 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:20:34 -0700
In-Reply-To: <07df932f-ca83-463d-b830-aa10a8fa11f2@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260810112200.2326727-1-xiaoyao.li@intel.com>
 <20260810112200.2326727-3-xiaoyao.li@intel.com> <20260810113924.4ACBE1F000E9@smtp.kernel.org>
 <13ea6279-a342-493b-a0f8-15ac5b4c59ad@intel.com> <anplcWfYReCMeu1A@google.com>
 <07df932f-ca83-463d-b830-aa10a8fa11f2@intel.com>
Message-ID: <an0N0vHwsYEqjpRe@google.com>
Subject: Re: [PATCH v2 2/3] KVM: TDX: Fix the exit reason handling
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 11, 2026, Xiaoyao Li wrote:
> On 8/11/2026 7:57 AM, Sean Christopherson wrote:
> > On Mon, Aug 10, 2026, Xiaoyao Li wrote:
> > > On 8/10/2026 7:39 PM, sashiko-bot@kernel.org wrote:
> > > > > @@ -2147,7 +2156,7 @@ void tdx_get_exit_info(struct kvm_vcpu *vcpu, u32 *reason,
> > > > >    	struct vcpu_tdx *tdx = to_tdx(vcpu);
> > > > >    	*reason = tdx->vt.exit_reason.full;
> > > > > -	if (*reason != -1u) {
> > > > > +	if (tdx->vt.exit_reason.basic != -1) {
> > > > [Severity: Medium]
> > > > Will this check always evaluate to true due to C integer promotion rules?
> > > > 
> > > > The basic field in union vmx_exit_reason is a 16-bit unsigned bitfield. When
> > > > comparing it to -1, the unsigned 16-bit value is promoted to a signed 32-bit
> > > > integer. If the value was set to -1 (65535), the comparison evaluates as
> > > > 65535 != -1, which is always true.
> > > > 
> > > 
> > > Well, how about something below on top of this patch?
> > 
> > No, we need to not rely on magic exit_reason.basic values.  Can't this be?
> > 
> > 	if ((tdx->vp_enter_ret & TDX_SW_ERROR) != TDX_SW_ERROR) {
> 
> I think the reason of checking if (*reason != -1u) in the original commit
> 095b71a03f49 ("KVM: TDX: Add a place holder to handle TDX VM exit") was
> that, -1u means there is no valid Exit Reason in the lower 32 bits in
> vp_enter_ret.
> 
> Change it to check TDX_SW_ERROR, doesn't look correct to me. Set the
> EPT_MISCONFIG magic handling aside, TDX_SW_ERROR only means the SEAMCALL
> instruction faults, e.g., hitting #UD, #GP, or VMFAILINVALID. Just a small
> subset of the cases where there is no valid Exit Reason.

Surely we can enumerate those cases?  I.e. why can't that be something like:

	if (tdx_is_exit_reason_valid(vcpu))

where tdx_is_exit_reason_valid() decodes vp_enter_ret.  Clobbering the entire
exit reason and then _relying_ on that clobbered state is gross and brittle.
