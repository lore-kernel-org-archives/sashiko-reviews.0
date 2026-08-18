Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F71C3D0930
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787073403; cv=none; b=Knwlza+Bk3N/e11D1OlkZX6ihMPyBCpU0+PiYJmw2Le1ipmfcmzrrOKBfFz9BBSwBBqBaY4QuDcFxDNlM6BciodK0vmM9sFxDnrCWdWVEh04xeURdeskb0Gc+dGRnZr2oX7tvIjGW4kgj7u9GHlxQK77/XQ4M1OgNE6K2/ay5Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787073403; c=relaxed/simple;
	bh=joRLrHQ5PciVlyhcB33kf3F6lW7tZpKQ6/AfYULRl5c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f3GRz7UG5qByodQgO9p7dOlj5MQ6hlTjZdOr86JB0TGG6A1ZIHmEidR0WwZVw13zGUysnuHbFbY/lGPJLLNI2SokWD/MkgssD/ws3GuTX1E1Ar2q0tMpFdxxNpt04IfEzJ0ED663dY8WTWLQM3p9THYavI+zwsTTqNncKVqaYdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cER1hgPc; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cER1hgPc"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so746735ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787073401; x=1787678201; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XT1Rr2HB3t99psvHxumchfGyXnfabp1WpWGCjDa/GZU=;
        b=cER1hgPc9fBKKTvRN6H/80Nkd3dzt1+t1FQ1HnBzW5oa1yDKGnlpyajkqtflntfxZA
         ihQpg4HVf7hGtWcfNkII0zfq5X94ZmDMQaxumSUyl2VyaXnhw/s0Xn3ECzNcdLPGiwpu
         vJ4nCl7kCAZu+8V+FryVZKx2RAqqcOww1PSqPllw54N2nQJ17S2Ojx6BjmA39ol42E5B
         GyBkoU9LIG4yAQoo8zL7Q+HijbZRfeTAnxkaKkcCrVexesK9CM87LUD099LS7eZJwxQZ
         c94ba0GGed+EaFC+tpKE/5e3vb6dTVniz7wZOzcbe1k9mY1g3fws+lK5d4CDEWbBCr86
         oQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787073401; x=1787678201;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XT1Rr2HB3t99psvHxumchfGyXnfabp1WpWGCjDa/GZU=;
        b=npFXe05C4XnxWgl9XWlAKlQoWDk1AX3/47FCNS37ADvDt0+ALP67dUY8Nm0mppJx4i
         iWUbFnVYhAtWZfLepERcDkDb8ACOH2Wfw3XL7NYWp+QgKTJoBFfLts48hz3gICyK/qiX
         +alJ2cWjpUtnoti+nv6SFvhiex2KiK5wO4/yzBx6+xy+Mzoy+lz++wvaxLCPa2cO+Phd
         sAgIjIdEXuK6yFWTAxECmvbjIAPymzFxgFZBqxLA5axznitCPkeiLF63uqKK1op21CVA
         H1lfurA2F5OEhW6aL6D4/x6J6InjckxkKY7q1e1zsVBz7nFztsbNKpZwmMQsB2rZtrHC
         6oLg==
X-Gm-Message-State: AOJu0YyWaYikqx0DesQRTip4HX15utJ4iQBTccM0m8KOA7k4i1jP5hiT
	Qy+P0Rty8AgFCFKHx0mk+BFrEtn8pyFTnGGE5jPUXW6QsHnUu2ei4X/kqtDxN5rGY+2FtO9EOvG
	9hZq/FcqLpbJRqpN9lBDr9oOl3ds2LWkkz7UQ853SNPKFt9ekaR/ttn6p9UgtnjOX7B7BhB8BP1
	I8n4y3qDq4SKeP3eiIVX4USOySy6/oSxjQYs8Xo7EbGL7Brx2W
X-Received: from plbiy23.prod.google.com ([2002:a17:903:1317:b0:2ce:7984:4347])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a2e:b0:2ca:9d5a:8b6c
 with SMTP id d9443c01a7336-2d5c4ee9bf2mr149762845ad.5.1787073401220; Tue, 18
 Aug 2026 10:16:41 -0700 (PDT)
Date: Tue, 18 Aug 2026 10:16:40 -0700
In-Reply-To: <20260818170534.07B561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260818165258.2613603-1-vkuznets@redhat.com> <20260818165258.2613603-5-vkuznets@redhat.com>
 <20260818170534.07B561F000E9@smtp.kernel.org>
Message-ID: <aoSTeLzhaWohymLf@google.com>
Subject: Re: [PATCH v2 4/4] KVM: selftests: Check VMPTRLD with active eVMCS
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 18, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Code relying on CPU flags after `KVM_ASM_SAFE` incorrectly evaluates them because the macro's cleanup instructions unconditionally clobber the flags.
> --
> 
> --- Patch [4]: [PATCH v2 4/4] KVM: selftests: Check VMPTRLD with active eVMCS ---
> commit d5821824a958c354147206d0cf6cf26eaeb71cc6
> Author: Vitaly Kuznetsov <vkuznets@redhat.com>
> 
> KVM: selftests: Check VMPTRLD with active eVMCS
> 
> This commit verifies that VMPTRLD triggers a #UD when eVMCS is active.
> It uses the KVM_ASM_SAFE framework to safely handle the expected
> exceptions from VMPTRLD testing.
> 
> > diff --git a/tools/testing/selftests/kvm/include/x86/vmx.h b/tools/testing/selftests/kvm/include/x86/vmx.h
> > index 047d02aa96889..e6adde3970d4d 100644
> > --- a/tools/testing/selftests/kvm/include/x86/vmx.h
> > +++ b/tools/testing/selftests/kvm/include/x86/vmx.h
> [ ... ]
> > @@ -336,6 +333,22 @@ static inline int vmptrld(u64 vmcs_pa)
> >  	return ret;
> >  }
> >  
> > +static inline int vmptrld_safe(u64 vmcs_pa)
> > +{
> > +	u64 error_code;
> > +	u8 vector;
> > +	u8 failed;
> > +
> > +	asm volatile(KVM_ASM_SAFE("vmptrld %[pa]")
> > +		     "\n\tsetna %[failed]"
> 
> [Severity: Medium]
> Will this setna instruction incorrectly evaluate CPU flags?
> 
> The KVM_ASM_SAFE macro executes xor %%r9, %%r9 on its success path, which
> unconditionally clears the Carry Flag (CF=0) and sets the Zero Flag (ZF=1).

Shame on me, I should know better after dealing with ba5ca5e5e6a1 ("x86/retpoline:
Don't clobber RFLAGS during srso_safe_ret()").

Untested, but I think the fix is simply:

diff --git tools/testing/selftests/kvm/include/x86/processor.h tools/testing/selftests/kvm/include/x86/processor.h
index 6e6f70035508..119715ffe93f 100644
--- tools/testing/selftests/kvm/include/x86/processor.h
+++ tools/testing/selftests/kvm/include/x86/processor.h
@@ -1318,7 +1318,7 @@ gva_t vm_alloc_stack(struct kvm_vm *vm, int nr_pages);
        "lea 1f(%%rip), %%r10\n\t"                              \
        "lea 2f(%%rip), %%r11\n\t"                              \
        fep "1: " insn "\n\t"                                   \
-       "xor %%r9, %%r9\n\t"                                    \
+       "mov $0, %%r9\n\t"                                      \
        "2:\n\t"                                                \
        "mov  %%r9b, %[vector]\n\t"                             \
        "mov  %%r10, %[error_code]\n\t"
