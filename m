Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029FB2E22BD
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 10:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865379; cv=pass; b=BrBzuxDA7JJlgqWamebbcgmRLWkFCXeUo3o+dtJ7averalGfI529rdpAdiv2wetFqY3i7WlTHGDHH+GSFC4NUShqvW7yFFTcWJGUNWMhrjUhJForwzlZJrEryl+J0T8dQ4X2kdxNqr9/1EGKMNu93k4INEBcY/8atGQQhPi+Do8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865379; c=relaxed/simple;
	bh=g/dzKyDFHfvLjQCJh2ZSN14OK+5iBhTvwQcSsOND7uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tiwjeS1LSQytO7mfZ6dzsgnf8yb+BnebqNTauKhpt3JApDjxZ6I0GK7Ydc+fWf65aSdvUqQ4bLFTJCEJQN79PpniInM25Z1b4/wWd1/Zekhzs6K7/z6in2nvAicwzeD6MASfCuNiJJpQ6JEhEGZIfeNYpTOh14uzbivXxYu3Zc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=waNqabPO; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="waNqabPO"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51765531803so230151cf.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 03:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781865376; cv=none;
        d=google.com; s=arc-20260327;
        b=WyEkpb4eRBt5m+SPJdT40Di1q0IYZNdXXTEfpfsGKW+f7JTXXDxnGuP2DpBqM0aIp6
         I9VzQ0XLwfUP+dr9iishNdoBdrN/3CKeJUjf6WeC4JfHBy0/u9sLG+dnM3cnhX2CBQDy
         2NcUf2DPdUj2EFDsUYe9+mh2ImuBteUmhEC8Gq2xXf5Cav4zZCPLDfixxAU1rXivKhUB
         omqRmxOsCisXRza5ccyX2O9qVz34G7kfZr2P8isNhzaDCE6ln+TiBEo64dEJTXcbB4DE
         CKhomy3outcRe1bksv+vsD0+n9aWGDVcyPtO0h6wSG6xqGH8V9a8dnp3pqjJXMJi5wuB
         D8Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TCG/665pkyKrSc7+D8LkCnkhR0NtBPIcMfXzYL4JRLE=;
        fh=QO/2cIsGIfGCLZGcA2ucK9O8KUAei36yLEXUwefekOc=;
        b=rnpKOZ8Gcl1yAMeefKkp0i0OBhK0VvJYrcZQtFRzvSPKwx9Z1o6yZOcettzGLp5WPZ
         RtH7cK8KqZ0yptVHo2Avc+YxR3LmSO0OD4bYfzconC19kq+ZW27VXmUyk/OK/arfpm/O
         ++Au7SMTsgwMN75wV9RJYZWsfvppoGMB87pyPSF5a6AHkiuLNBkPFmahxzlPpLw8am3X
         BFKwdh2NKR9M6PuA73g9ID5tD4lm+26n0Z8SF5zIQxYRQZFwVchzd6+LHjnNq6KC/mG2
         SoAdIMausSHet8b++LHabIu6WQsGSN1EfO1nC0u3wL+VhrYGCekwrSbASq6hz8pt0y8e
         8sKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781865376; x=1782470176; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TCG/665pkyKrSc7+D8LkCnkhR0NtBPIcMfXzYL4JRLE=;
        b=waNqabPOdLUW+jxHGEG2eOvJdk5MhYCFM3sZJtAmRwK88B4ej4LXg3ClTpupbbd7+m
         vKR3a/0dV99UocfpZdj3entScSCMUoeB3NuR5kTpcBcoUe6wZXQ5SHU4PFv2b027Ky+o
         1tNJCwyav20gSGFIMfZ4o5LhEifMrX2YcxlHyBFFttxYgA9hTQkAHsg9K2Y/QemdlbpO
         tYHeVJkjNGxrKnxrHUc3ZcQFGPVh8pP0WWSOVshgRRP7q+ioTc606C+A2PbhZ0sLq1w+
         zkVAh+HJ03oOZlp1ebUPkMwGbe0+CjMYjYlmBTvH+RWlFoKBLMn/z8M3WKQU04UV17p9
         fy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781865376; x=1782470176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCG/665pkyKrSc7+D8LkCnkhR0NtBPIcMfXzYL4JRLE=;
        b=Bio3QpRDQldp77pjL35QZVNGpIE2e0HAixKmUVEXZ/Q7cdAoavIwHY6hZrqXb/jdB+
         wNdDSbD7ea5lTKDdvCkC5xqM1w7jRY7TFp5mj0iJ2lFGHQY8NxTgiEYuIafJjCPyqInc
         F/1W5fFopheqE25K9TN//D3d2F5s2sw3cvF0M3H3YJrHOa9G4N+s2295HI64XQqbg/YP
         1iDeCbNfzKQfDvnjY0qKEYuzeRXE005sbR9a6pJotWcM+SVvyAtRqb9aWpTBt5Uv4CD0
         6ifyc6U9W6J2ChFg5GfguykmTWICMAbvkTStncTvMFLD3aF3GeEoljeIwa6sU6y+2hEa
         NhmQ==
X-Gm-Message-State: AOJu0Yzklmt8e8CgTGoYsKbz9uWOXg+CVjsJrPtee4i45nMGQvOwYJ/z
	tBIKl5jzY519KL922m4b4JwWLX1FVgpu2XxmzWkQFzfQ6pwoKQ3vXQlBgrB7n1ao7dqVz5zx0j7
	bOwnfzuuO2IfIb6pAKa99O3GDvl0kYWRGPi7XgDyamvNM+t8VAEzu5WO4S/U=
X-Gm-Gg: AfdE7cnQ4miSNkN5QnjsM62Uf9OFENZIccUmmKPzZ4EYTZEGguPtSaAfi/0OmIWoFj1
	d8Bh0YKgO80w4p0fxbG1TFSRzOsESvUa1Lc+5LhdCQbuJ07/D4o0IbMoOeOiClZVzalLkzAqsaI
	QfZS6WQDdm39uNpYBa9jKlpgNYgc+M7kCR4G/p5G+3h4RhAh/LxTumOfRct4m4SGb/np2Df6j7G
	0ZaSUxK/7KDt9+q1n2M5dDgoeEsDpjPFJTLrRGtwBv4kYn5h5RxMHrzjavvt/g9P+ZJBHCXjA==
X-Received: by 2002:a05:622a:98d:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-519e891275dmr6576121cf.5.1781865375238; Fri, 19 Jun 2026
 03:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-17-9d2959357853@google.com> <20260619005320.51A8F1F000E9@smtp.kernel.org>
In-Reply-To: <20260619005320.51A8F1F000E9@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 11:35:38 +0100
X-Gm-Features: AVVi8CfYEvsMjwMgKNKidWJDSAVnQ8t5EZFvVCHXxAi-8QxaaQZdnuZZQW_VEW0
Message-ID: <CA+EHjTzQhOi-qeiNGpn50o_ko2Cp05qzuKwhiZCgLPCyiwWhrw@mail.gmail.com>
Subject: Re: [PATCH v8 17/46] KVM: guest_memfd: Advertise KVM_SET_MEMORY_ATTRIBUTES2
 ioctl
To: sashiko-reviews@lists.linux.dev
Cc: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Jun 2026 at 01:53, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Missing compat_ioctl handler for guest_memfd file operations c=
auses KVM_SET_MEMORY_ATTRIBUTES2 to fail with -ENOTTY for 32-bit userspace.

guest_memfd is gated on 64-bit: x86 selects KVM_GUEST_MEMFD only under
X86_64 (arch/x86/kvm/Kconfig:50), and arm64 is 64-bit only. Is 32-bit
userspace with guest_memfd a supported configuration?

/fuad

> --
>
> commit d35a6816bc0c5b6e6650f6f4fcbbef3d9b3e3590
> Author: Ackerley Tng <ackerleytng@google.com>
>
> KVM: guest_memfd: Advertise KVM_SET_MEMORY_ATTRIBUTES2 ioctl
>
> Introduce KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES to advertise the
> availability of the KVM_SET_MEMORY_ATTRIBUTES2 ioctl. This ioctl allows
> userspace to manage memory attributes, such as KVM_MEMORY_ATTRIBUTE_PRIVA=
TE,
> directly on a guest_memfd file descriptor. It also adds an error_offset
> field to handle EAGAIN results during transient page reference counts.
>
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index 876c0429f9d4e..129d6f6303251 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> [ ... ]
> > @@ -1649,6 +1650,7 @@ struct kvm_memory_attributes {
> >       __u64 flags;
> >  };
> >
> > +/* Available with KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES */
> >  #define KVM_SET_MEMORY_ATTRIBUTES2              _IOWR(KVMIO,  0xd2, st=
ruct kvm_memory_attributes2)
>
> [Severity: Medium]
> Since this is a new ioctl on the guest_memfd file descriptor, will 32-bit
> userspace VMMs running on 64-bit kernels fail with -ENOTTY?
>
> Looking at virt/kvm/guest_memfd.c, kvm_gmem_fops lacks a .compat_ioctl
> handler. Because KVM_SET_MEMORY_ATTRIBUTES2 is not in the generic compati=
ble
> ioctl list, the VFS layer falls back to returning -ENOTTY instead of call=
ing
> .unlocked_ioctl for 32-bit processes.
>
> Since struct kvm_memory_attributes2 is fully 64-bit aligned, it requires
> no translation. Should kvm_gmem_fops wire up .compat_ioctl (e.g., to
> compat_ptr_ioctl) so 32-bit VMMs can successfully use this capability?
>
> >
> >  struct kvm_memory_attributes2 {
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-gmem-inp=
lace-conversion-v8-0-9d2959357853@google.com?part=3D17
>
