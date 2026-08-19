Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE875364EAB
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787129034; cv=none; b=b6VYHAdHjn9YwuGIs9p/F8iaSAWQf6zR3XDONCfvRDI5kS7s2knLNe7H+/Pc5JBtv9oj+wSYuKJJQzI+Gj//MFM8i/QTrOlWAvTdATefo4+zR+wHP9SPo/NWOPJ2yUqn1yALPbFCy2BC9jzw4YfRYkuE3JqrJXhJXgrJcNroK1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787129034; c=relaxed/simple;
	bh=Uv1K79NbGpJeNGDWogYsDBbzlPFxjmBAgzsk5++s5E4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xd/N5VhBzmQTTHJM7BIIJz9CKs8/1l6LsQTI5FqcWF6pSab1GEvbdHMaMaX57WsnUQq53oFySv1iq/QpMygTfx6tLqCqBBWBL8qTpQuT8eklp1jEfjsP0IepvNCyo/zv6ZnlJOZ83fRtPh0S9bPbQSbgFec3F/K3tbEEQZg1Oqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OP0Gwp0A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OP0Gwp0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787129031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MTelDZFss5bzde/fj2VbnN0q0pzXKI8uuhHquLDc6v4=;
	b=OP0Gwp0AFmCnjsSuWTKnUDpJaGHRYNOniyykpjfA97LbnzAmC7QMBIW/Af86qQQhTJBDnq
	rS6V69rITm2mGTtx49LCXowAxPByICPk6yQuq2aw9Hz/MypwQJpyJ4h6q6ol3bxEdunjne
	fbOBbRfqWNvGUThGhR+IClr1Zckd/NE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-2zEfA1yiNnCnwqMFwopfbg-1; Wed, 19 Aug 2026 04:43:50 -0400
X-MC-Unique: 2zEfA1yiNnCnwqMFwopfbg-1
X-Mimecast-MFC-AGG-ID: 2zEfA1yiNnCnwqMFwopfbg_1787129029
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47faa02f707so511967f8f.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 01:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787129029; x=1787733829;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MTelDZFss5bzde/fj2VbnN0q0pzXKI8uuhHquLDc6v4=;
        b=AMDa1Xw/iiPWCudDnjZ+3wgNxLOxwnA/pCTl7LX5lhNF8ODgxPqBCCJsa1k4tbaSRr
         XdG/U/iNWU8C30Wyq1WKLYWaBlj7l2cMs/YwL1j5CoitH+92ByyzPVAnf/3K7hBEUxjA
         0RXrRrk1fbNaIyAVHQcLF/lUK6jzaSE8EXYXLqknSAqXjET/I0Plhb6Pj1wr24qfmB2K
         U3Ao82H4yrSnlznCwM/7ivgaHnUoU+dZuDhxfbAfoEIKU5K615tMDL++xU3IQ6RnTIpi
         0qEyGo+ws0YNFOqsNCpv1EDA/9jCow0S+aPndEoxl71Zs6YOqXMtcNHg59JOuu360HjO
         nbRg==
X-Forwarded-Encrypted: i=1; AHgh+RqXBG77Gs0s8ZlVN2eWiP9zYP0ISofzLbtKpxBpODzcszXjfI0ZayBJi8lLh7wjvDPlqhptSIS5IoIUSRyUgjc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBQNrRKsVBn7JRueqQkWC+w4v+d0X+5OfUF4OV0zbpFCtc+Zki
	BT4smDtUlaukIKXVFo/WS/3bu+4GWYSqwzneYAmF9BLlj2tG2Zc88BF8EWq5jHuTCiVQrGgd18b
	uhtQEbEAeeVGb3vOBw9J9JhTyEOTtUU3p1UAG2LUYnVj3V6BPzniOIJ5lbhN46vro+rpSex6bN1
	Lgr4WtRwT05WpworpzOc16u4KMYmmEhLTuPyalYLC+TR8XKgBuMKfckA==
X-Gm-Gg: AR+sD110kH3dP4hPSENUKs2q8vNiXojx7XpihpZMf+NOPm3Moq0wUaT6QyL+dWF1F48
	zTto0ml0dWst33iuvkHgffABYA+U3XIeMJbokZWTut2n8z8FF8AAgjJxl4blvF1teW7u0cXp5Ww
	vNqJ3Hv5oTF5zWrUTYgzHDtO9sukPB80o0/XQ07TszntI3myHZi/mSIXC9msSoDxK7YWkWCz0c8
	R2XqiOEpO4Za8PmR0ugPz37Z3hn8sbZwV/RLfs5d1NMEcOYCEFSVUTO9JrMpUeVqa623ZvwT50g
	a8X0NiapwFzrJctTINwCDkUQs6uH+kQKFq2TM773vnN908818cDKeo6UZSh21oIhGg2+uA2vSWy
	sgg==
X-Received: by 2002:a5d:5d10:0:b0:47f:ece1:1eca with SMTP id ffacd0b85a97d-482b0f3c6c9mr5058054f8f.1.1787129029134;
        Wed, 19 Aug 2026 01:43:49 -0700 (PDT)
X-Received: by 2002:a5d:5d10:0:b0:47f:ece1:1eca with SMTP id ffacd0b85a97d-482b0f3c6c9mr5057957f8f.1.1787129028515;
        Wed, 19 Aug 2026 01:43:48 -0700 (PDT)
Received: from fedora (nat-20.ign.cz. [91.219.240.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b7d3asm3982321f8f.23.2026.08.19.01.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:43:48 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2 4/4] KVM: selftests: Check VMPTRLD with active eVMCS
In-Reply-To: <aoTVAdqoAAuVKi8L@google.com>
References: <20260818165258.2613603-1-vkuznets@redhat.com>
 <20260818165258.2613603-5-vkuznets@redhat.com>
 <20260818170534.07B561F000E9@smtp.kernel.org>
 <aoSTeLzhaWohymLf@google.com> <aoTVAdqoAAuVKi8L@google.com>
Date: Wed, 19 Aug 2026 10:43:47 +0200
Message-ID: <87ecfuxzy4.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m4pcXpgsDXXf5J5fPdklnZlb3zxKsZ134T5qpyEY2Ww_1787129029
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Aug 18, 2026, Sean Christopherson wrote:
>> On Tue, Aug 18, 2026, sashiko-bot@kernel.org wrote:
>> > > +	asm volatile(KVM_ASM_SAFE("vmptrld %[pa]")
>> > > +		     "\n\tsetna %[failed]"
>> > 
>> > [Severity: Medium]
>> > Will this setna instruction incorrectly evaluate CPU flags?
>> > 
>> > The KVM_ASM_SAFE macro executes xor %%r9, %%r9 on its success path, which
>> > unconditionally clears the Carry Flag (CF=0) and sets the Zero Flag (ZF=1).
>> 
>> Shame on me, I should know better after dealing with ba5ca5e5e6a1 ("x86/retpoline:
>> Don't clobber RFLAGS during srso_safe_ret()").
>> 
>> Untested, but I think the fix is simply:
>> 
>> diff --git tools/testing/selftests/kvm/include/x86/processor.h tools/testing/selftests/kvm/include/x86/processor.h
>> index 6e6f70035508..119715ffe93f 100644
>> --- tools/testing/selftests/kvm/include/x86/processor.h
>> +++ tools/testing/selftests/kvm/include/x86/processor.h
>> @@ -1318,7 +1318,7 @@ gva_t vm_alloc_stack(struct kvm_vm *vm, int nr_pages);
>>         "lea 1f(%%rip), %%r10\n\t"                              \
>>         "lea 2f(%%rip), %%r11\n\t"                              \
>>         fep "1: " insn "\n\t"                                   \
>> -       "xor %%r9, %%r9\n\t"                                    \
>> +       "mov $0, %%r9\n\t"                                      \
>>         "2:\n\t"                                                \
>>         "mov  %%r9b, %[vector]\n\t"                             \
>>         "mov  %%r10, %[error_code]\n\t"
>
> Vitaly, I'll send a v3 of this series with a rather large pile of additional
> selftests changes.  As often seems to be the case, my desire validate a simple
> fix has snowballed...

Sure,

I guess you can start using 'Provoked-by:' tag in such cases :-)

-- 
Vitaly

