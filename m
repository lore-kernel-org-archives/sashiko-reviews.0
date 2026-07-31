Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DF740A92C
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512689; cv=none; b=Va5d8rc6k6W+CyTWhhwaSJMsewS2GUY83d8gGPB9d3vBYgdyWZ62rwmuDFjxl/bPedXJs4wEotECG8If5tO9d1FspVMiME/8iWbniHcenEyXZwIqPoa2CD3UhyzcQIxDcEnqhmClMpw1V1b/4pvfQqhmGZFEUdVDZ2MO6RIpv9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512689; c=relaxed/simple;
	bh=VcL8BXxn3Qq0fLyIIYCp9w7e2Bu7vNh9LjvUbXNwyfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SsfQ3X8oETdvk9MnPCQVnP8dOOTldm4LYAiGWrI95FTFR7hTjP579s0IzE5qkDgJvwhHr7wQazABmhsdEsPtG93ja2FHgqUXrMlT7CoCJcxxaBaHe4dT06ke9EVpZgJ+q/0Q6HTSuIyeGf5B29yfjx5TuBxkt4gyhWIckEBC8qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=idXP0igI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="idXP0igI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso748258f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 08:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785512686; x=1786117486; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9vJ13y8Hgv8RV6M9Mxzw3aYrgIriTaGFeY14syFHihY=;
        b=idXP0igIXe4K+ZXMeL3aZXNU5y3YDBvqu9iuFBWUFU3Z8WIm/u53dmVXCkZO9xIFuR
         l0obMz9hmQZVQJrQiQSmgcGiToYJnU3M83zJul44AwlblhrSkIPwLhFgWOPMLDuTEESw
         +dBNe/KGGW3ZD5KDq0uiV4CKld9iT9SlryeyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512686; x=1786117486;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9vJ13y8Hgv8RV6M9Mxzw3aYrgIriTaGFeY14syFHihY=;
        b=q99DuK+AGKNJ05vsWZHQzK/o8TfE6xm+r8zerolMOv4+0dsmYeamlzZ7DxakVirjDG
         IOC+jsE/uKsfPFYrK9Fo+U0kQxHZaTpgdKgs35Z7+FxDPf0MvHD0CJMBtKEoNhY8g2rb
         jOCbXwOzzB7VRb7PIwXL+qM8pJq7yMucva02cHwwyNcDiC+mrg0V4ZSLPiUvfbrc1d4u
         qfaTvk4JjeQLWUy00PFYBBOgV5m+GyR74aDccRVGJIGMZm0cOtyVyVLRkf3Y0Sun0klM
         +bPKb5ZmEdiRYjH+LvvcewUjsYhuNIvqehKQxDmwQcuoJDu1Xs/S5wUMdcBMsTr06Aog
         gceA==
X-Gm-Message-State: AOJu0YyARBTfYPesbKkuQXAswHhwLzdRC3RyiVWwtkCV2qW2wCIz9X8X
	2eHREyxps8BJfhpU26+/2RJ77CWMMID3VM7yWMkV1y9SgEQg8JFweUAlbriRFHsd2uWDwZWtqqh
	HIa9qrw==
X-Gm-Gg: AR+sD13ESQgQ0hYJq+W/2W8ra5Ns5BhUNH9G0h2YOBjweZi9yV0RJfESMNxLaxrSfax
	nH9zlNqCKCTfF2pZNDcriCraMKFz06hJygK5eCHdm1W7tOslYXG7sikhyntzC14gIL7jitHaPOp
	E5qo5FYWM7NrqZNbs8z2ZHpvN+CrBpdV67wurnBfisv+KMwCXfSpiHu9nPlU/u8zL4caIzuBc7y
	fJyz0v9C3LC7tNpoiui2Qkrc50cJbT0ZykYY48VUey8fSWsPKvauNV22BAw6+k0Ev15FT2hKpnP
	DqdD+RRlYaOnutr3LXfBayR0y3Wr5mmKTdTcXDRjGoUUIjytuLk73mi4i6WguxWnK7iaexPB28s
	2yH023Aki1J4iy6KlH3mikHTEl8CHRJLCJB0iym90tERRjFyCbNwJuO5FN1hXxRsEL/yc3+rhPJ
	ER5A8Enf1UX2mJBHX7nV1qIwT4sXh/l5cqtR0ixYiqirGgST9JH4noNb0bwh6kNHd6D3VR4Uarl
	cQNAYVZ2tkSSBogg1ZWuhHAueWcH+BXNg==
X-Received: by 2002:a05:6000:1844:b0:47d:fc33:e6bc with SMTP id ffacd0b85a97d-47fd7307ae6mr238895f8f.47.1785512685696;
        Fri, 31 Jul 2026 08:44:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:285b:8:4d52:883b:57c3:cdfc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4562a38sm5859056f8f.21.2026.07.31.08.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:44:44 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:44:37 +0200
From: Dmytro Maluka <dmaluka@chromium.org>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] KVM: selftests: Fix treating KVM_CAP_MAX_VCPU_ID
 as inclusive
Message-ID: <amzC5dDVAspfK16u@google.com>
References: <20260731150846.1728164-1-dmaluka@chromium.org>
 <20260731150846.1728164-2-dmaluka@chromium.org>
 <20260731152407.E3EAD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731152407.E3EAD1F000E9@smtp.kernel.org>

On Fri, Jul 31, 2026 at 03:24:07PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch modifies a KVM selftest to avoid an invalid configuration but sweeps an underlying kernel bug under the rug by failing to fix the kernel and masking the issue in the test suite.
> --
> 
> --- Patch [1]: [PATCH v2 1/4] KVM: selftests: Fix treating KVM_CAP_MAX_VCPU_ID as inclusive ---
> commit 5e2afeaca4e83d31005f9aa5caf94dbbc9f20b8c
> Author: Dmytro Maluka <dmaluka@chromium.org>
> 
> KVM: selftests: Fix treating KVM_CAP_MAX_VCPU_ID as inclusive
> 
> This patch modifies the max_vcpuid_cap_test selftest to account for
> KVM_CAP_MAX_VCPU_ID being exclusive (maximum allowed vcpu_id plus one).
> It changes the test to use MAX_VCPU_ID + 1 when enabling the capability,
> avoiding the boundary condition.
> 
> > diff --git a/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c b/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
> > index 7e2bfb3c3f3ba..47ee14967873f 100644
> > --- a/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
> > +++ b/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
> [ ... ]
> > @@ -36,16 +36,19 @@ int main(int argc, char *argv[])
> >  			    "Setting KVM_CAP_MAX_VCPU_ID below BOOT_CPU_ID should fail");
> >  	}
> >  
> > -	/* Set KVM_CAP_MAX_VCPU_ID */
> > -	vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID);
> > +	/*
> > +	 * Set KVM_CAP_MAX_VCPU_ID. Note: KVM_CAP_MAX_VCPU_ID is a misnomer,
> > +	 * it actually represents maximum vcpu_id plus one.
> > +	 */
> > +	vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID + 1);
> 
> [Severity: Medium]
> Does this patch mask an underlying kernel bug rather than fixing it?
> 
> The commit message notes that setting bsp_vcpu_id equal to KVM_CAP_MAX_VCPU_ID
> is invalid. However, by changing the test to avoid this exact boundary
> condition, it seems we are leaving the kernel's off-by-one bug unfixed.
> 
> Looking at the kernel side in arch/x86/kvm/x86.c:kvm_vm_ioctl_enable_cap():
> 
>     if (kvm->arch.bsp_vcpu_id > cap->args[0]) {
> 
> This bounds check uses ">" instead of ">=", which appears to incorrectly allow
> bsp_vcpu_id to equal max_vcpu_ids. 
> 
> Should the kernel be fixed to reject this invalid configuration,

Yes, it is fixed in patch 2 in this series.

The reason for this selftest patch is not to "mask" the KVM bug but to
prevent the test from incorrectly failing once the KVM bug is fixed.

> and the
> selftest be updated with a negative test to ensure it actually fails?

That is done in patch 3 in this series.
