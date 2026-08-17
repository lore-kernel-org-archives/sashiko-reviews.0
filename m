Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DBC3FA5D2
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965970; cv=none; b=q14bDb5Sa0TKz8qkCMSpILD2ttvSW33+oo9MbRt3ZqmqoKB0v8ZXcSRh66ucVXEjyuEYXrZwNUTGpfLV4saiKrKAwtYY1ZSmMVBYmDoe8TCLXpYXCsTsbfV8CwWMp7MiIYYVuh98eF24XvX/1DsxhEWNbS8VJ73vTsSXJ6TwIqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965970; c=relaxed/simple;
	bh=/HK3S1h/p4YqWHBgoSBiqiJ+ZmeGeH8/Mfh0HXbAKwg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EpQr0axIljnVx/OwBJsnueUmBkqnFzDCMWekvTB1h1MLduBItJHGKkJ0/q7K+h7ZpKCQ8Man6PoJcbbaysTbXhjoKC9VmU+9CYDTJkROfAmSg7/yxCMbr+jOqGRm9HRgMdiiVEMG1jVL9qoBSffSu4TJr5Ja0TmjKvUt/IWuKyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZaIBImFC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZaIBImFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786965967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q73ryK5kUwcmMiYglMvM52gIXR5G72fMcc+CsMgRAr8=;
	b=ZaIBImFCMYO48txZzYLANjLSjodRY0VXDGGG4FfmTM2HSMU6pLQO5fTjmi4htusu4+roQg
	hDNNVzyr9NezYDBqLqi1M+2OF04qEvlRyQdDuYJBOFc+BzmiZ2KPOaSsjgKzJit3Wf8XqB
	amJnjIdutVwxzaD7NR7pnUxEZzFS30I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-bWEI491dP328ukgjfqYOVQ-1; Mon, 17 Aug 2026 07:26:04 -0400
X-MC-Unique: bWEI491dP328ukgjfqYOVQ-1
X-Mimecast-MFC-AGG-ID: bWEI491dP328ukgjfqYOVQ_1786965963
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so21739505e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 04:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965963; x=1787570763;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q73ryK5kUwcmMiYglMvM52gIXR5G72fMcc+CsMgRAr8=;
        b=MYU8qAQ1riGOQC2W7eVTan1kE4LqKws17B9Evq7noSIuedOOSaFmfZNln5OwVYAo5R
         58nnUXNCjmkw7tYDEjihzMXptfeLGaHXJcw0WyadI+DRd7X2PNXEZ5gtKdSRrsnDW9bJ
         gbuPHyy+kUm0e8t1SpEGjPT+GOCJ4KXkNhMRKAOurraGQpC3Pm6WrUlzSVSMYmLN3j55
         BUsHmNLoPWPr25w1zrgPc1G3u361j9B81iAStMYxU5URakP+lqePDOmGKkRybjBV7bwi
         q4OmNBh7ovhUVNqgoAqc19mLppd5xgL4JAG33uFL+WJwls1X2CtI/9o/eUqLQ4tJIxo7
         /1vA==
X-Gm-Message-State: AOJu0YzoPRXHqKuCuHeeenlZ2e77SQXNVUNgm1Gso766+e/TluWgm0W3
	5B2eXi0ZiQAI+Z3CnEAzKUhYZbAQpFs8LrkjGAiKLiRvtsMOLNa2aqKHScy5aHWLF9Z+2Im2S0O
	jplT3K94rpiygBMTohDBnzIRsXRNbYyw0AsKlVzHExKpTSYNnDVXHD4RCEtUPTH4eGEKQPw==
X-Gm-Gg: AR+sD10Ie2VOtr2fkwQgAn5eXCtLuko7lvAY0T4oy09x++tGAFLW9bfT8kZr4ixRHzz
	xB49b+UtmyRDHl5VF60ZBJ+O3tgbYlqZqQ0qzFDYQbXryrjX9W8QwaspqI4e+M1+G69gzZr8Vx0
	/9JaxnvDuNdYl4gES4p0e7eiTLmn0jI9R/ZFmCPg4bQ5KxtKCl52Cg2jDJbkqDj0MLMRM3qa0rO
	k+GZBuTFiLJ1csoFHmTQ3KTa5Fv7wgT3mGhot2bY7FbwrxUI7CgN2jIxE8kY3dJQqdEx+JOu+GS
	1/zQ/kSgbupkElsj55N9ZubcwYS4uaksTXKBGN5TNr/ZuUiyRXzoYwmVaPEyzYffI7xVmQpcIza
	uXA==
X-Received: by 2002:a05:600c:468e:b0:495:6a50:3fb8 with SMTP id 5b1f17b1804b1-49987944202mr342126635e9.1.1786965963229;
        Mon, 17 Aug 2026 04:26:03 -0700 (PDT)
X-Received: by 2002:a05:600c:468e:b0:495:6a50:3fb8 with SMTP id 5b1f17b1804b1-49987944202mr342125905e9.1.1786965962850;
        Mon, 17 Aug 2026 04:26:02 -0700 (PDT)
Received: from fedora (nat-20.ign.cz. [91.219.240.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a6c449dbsm2091445f8f.8.2026.08.17.04.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:26:02 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: sashiko-reviews@lists.linux.dev, Sean Christopherson
 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH 4/4] KVM: selftests: Check VMPTRLD with active eVMCS
In-Reply-To: <20260814163105.BDEC31F000E9@smtp.kernel.org>
References: <20260814162221.2144473-1-vkuznets@redhat.com>
 <20260814162221.2144473-5-vkuznets@redhat.com>
 <20260814163105.BDEC31F000E9@smtp.kernel.org>
Date: Mon, 17 Aug 2026 13:26:01 +0200
Message-ID: <87lda5kmye.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9ZnEInyHicRm3fn4BvlqduvaYV7PrENqSioVmYZo57k_1786965963
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The hardcoded `VMPTRLD_INSN_SIZE` of 5 bytes is brittle
> because `vmptrld` is executed using an inline assembly memory operand
> constraint (`"m"`), which results in a variable-sized instruction
> depending on compiler optimizations and register allocation.

True that, but afair we don't currently have an instruction decoder in
selftests. I see three ways to move forward:

- Calculate the size of the instruction with two labels, something like
  (untested):

    static inline int __vmptrld(u64 vmcs_pa, int *insn_size)
    {
            u8 ret;

            __asm__ __volatile__ ("movl $(2f-1f), %[size];"
                                  "1: vmptrld %[pa]; 2:"
                                  "setna %[ret]"
                    : [ret]"=rm"(ret), [size]"=m"(*insn_size)
                    : [pa]"m"(vmcs_pa)
                    : "cc", "memory");

            return ret;
    }

  and use insn_size in the tests.

- Stuf __vmptrld() with NOPs after vmptrld and keep the constant jump,
  just make it loner (e.g. 10 bytes should realistically be enough).

- Make peace with the fragility (it's just a selftest after all) and
  leave a comment in vmptrld() that changing the asm there make break
  the assumption.

Any preferences? Personally, I'm feeling adventurous and can go with the
first one - calculating the exact size with labels.

-- 
Vitaly

