Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C23433E79
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 17:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222658; cv=none; b=iSao+Uz/OBfkj2KL3Nxm+CSzdiIkoB8PnT1wPlje7FjL5H2EKoPJRlnWPw4EajnCdslFiE6H00A7k5Fs2v0Pvi2yR532G8OBJmuVVe1UOr420M+FhN7zODmzTG9Ed5HtdG+EMIt5u3QfnYJLoDqxL70td4+kOjXQAYR6f1CqcBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222658; c=relaxed/simple;
	bh=sITUUNKWqzTY5nA5d1dtCOT0qEP5ePE+d3ykIrAA9xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASGO0DDh7+sina65iwMBtZwUM+2b2iHvRI0n3CL/kqIVOoESdSJjaFkb4uKP+Y76SC1UqgRFW/q/7/1FG/wnPbK5GaKWl+Aa9LbvI6Ylle0WqCu6eGlRB9rMXceTJBrvO3p4KtrJ2AMubYcQaoPKyZqi0t2PtHfywVes2DBGfOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nwDLSTmM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nwDLSTmM"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso28422055e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 10:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784222654; x=1784827454; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lKtR9Jxp2MImzZP0T9BC3u+TcUq704oO/4jwxoBn6sY=;
        b=nwDLSTmMcZlRdAeCTk4BiBoh8BucgZKKQCWDI+LjH0MqFL28YynXws7ENXcR9TSs1K
         IjOk6G5Ne75IoWeVIXeczIVXd6VttBzts9RzC0ljkgPHw8SjYEAUd1xanor9cnco3dP9
         dJ1e0TltjPXS27/uhmaCu0tI30xK1n//as/iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222654; x=1784827454;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lKtR9Jxp2MImzZP0T9BC3u+TcUq704oO/4jwxoBn6sY=;
        b=emZvdAze541hvbk3TIZtPJuyS/T7tW1v/aZLRTd5If6RLiP5pmiAv+faMy5ouXJ1hQ
         xUCE908GZIVdQgrxp8Zzt7tI0o4YBhCbH9GLMYqofJhXJoKi9CIf3K8lTEuSxFd4LGiV
         rgcNysCd1MJ9B+yHW4NjZmdl9rqXfZNZ2RRGu39oK1ChyqeWVsAhbLFLYflhvqiODrJT
         guFdkBPhhLwfCqSfI2EcndkXqmiuuDvT8pSb2306dDaQmXZiLJs5xee8ncmCQCKOIid3
         e+7NkjmzwrogPHlHZAqrG7eO9GAt/+vktwWTdxNqZ0ElE/U5QJq2voxuCwhH+FDxn/4q
         xy6Q==
X-Gm-Message-State: AOJu0YyplLfYM0+eFBhndci4eEMZM7LbtYiUlofdC6HexMpypD0x3+aq
	5g+q6fgDAn0/KdKsQv2xJuTJ6kOJlea3YKD9dlOvIRkMTP4teYQEi8312LV5Pp/htKUv8SP527Z
	7S89umw==
X-Gm-Gg: AfdE7cmzfi5vhHniUxVQ9x9UrmoJL97YsPzSycJ6w2QXNIoi6lymqZCSad9BY0ua/fS
	ns2cWeaxnfN9AQ+UQhnPRZ49qWhWet3aue4CF/eysePemyqeOLPoj6tycORJc8AQ6byHHwGFjGi
	pJyMWtcB8ni4Wqb+aPkLhaxjxJsrkjte3Nb7QudF3ffxrFnnE6RKLepwWx+FDxbUPSgIMCIZZqc
	oqWJGGcOLhB0QshsUo2llTMGeH7zUtMc10OWkMH8IJCtb2MtRrEICDNQ12sEjHA1U/cE92+C5+g
	6bA3CRiXsxri1bMlOlLonyLzpRtmEr8+yGXVjeIBx41kivwjQohnQAlARBWtu8N2VwT0y8OEmZK
	utxRXyTVVVwiOeoCz36ReVzkW7G/RDyadCc54SegNPPIGxi4t2dtS9HC5IJM6Ii7R+ZOgjBEPuR
	WyD/T8c5RThYx+rJl8aSmX2DYGq29DOrbgLNZ7
X-Received: by 2002:a05:600c:638f:b0:493:dcad:84da with SMTP id 5b1f17b1804b1-495158c6a66mr146906325e9.1.1784222654526;
        Thu, 16 Jul 2026 10:24:14 -0700 (PDT)
Received: from google.com ([2a00:79e0:285b:8:ac40:81d7:8c61:d942])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e8c41asm73221925e9.9.2026.07.16.10.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:24:13 -0700 (PDT)
Date: Thu, 16 Jul 2026 19:24:10 +0200
From: Dmytro Maluka <dmaluka@chromium.org>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH] KVM: VMX: Postpone IPIv setup after successful vCPU
 creation
Message-ID: <alkTuicE2ELcakS9@google.com>
References: <20260716160801.3155582-1-dmaluka@chromium.org>
 <20260716162900.9D8131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260716162900.9D8131F000E9@smtp.kernel.org>

On Thu, Jul 16, 2026 at 04:29:00PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Critical]
> This isn't a bug introduced by this patch, but does this exact same
> vulnerability exist in the AMD SVM AVIC code?
> 
> It looks like the SVM code suffers from the same use-after-free pattern
> when userspace creates a duplicate vCPU ID.

Seems plausible. Can someone with AMD expertise look into this?

> In arch/x86/kvm/svm/avic.c:avic_init_backing_page(), the newly allocated
> APIC backing page address is written into the VM-wide hardware IPI table
> before the vCPU ID duplicate check:
> 
>     WRITE_ONCE(kvm_svm->avic_physical_id_table[id], new_entry);
> 
> If the vCPU ID check later fails in kvm_vm_ioctl_create_vcpu(), the
> new vCPU is destroyed and kvm_free_lapic() frees the backing page:
> 
>     free_page((unsigned long)apic->regs);
> 
> However, the AVIC table is never updated to revert the overwrite.
> This leaves the physical address of the freed page in the hardware table,
> which could cause a hardware use-after-free if a guest subsequently sends
> an IPI to that ID.
> 
> Could we also implement vcpu_postcreate for SVM to postpone the AVIC
> table update, or do we need a separate fix for AMD?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260716160801.3155582-1-dmaluka@chromium.org?part=1
