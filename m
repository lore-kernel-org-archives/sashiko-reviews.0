Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E784825B8
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 18:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100545; cv=pass; b=AhKh7NNktnAF7A8Zy8YLHEaCvmJsgy9pTa57pBd0Msa2iCu4n2Vahh/EhDclTmRlsV14PeQrf3RMQwVRuorof19jhVoIIsPU7c9oLgrc6fkIeg2vlVkhCjb0tourIDLNI4iE0rzSdO9h+W0+bPo7v1pDW8/UcAY+wZ+q/NATX/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100545; c=relaxed/simple;
	bh=YagOku/D0v5zlu5wCXTkSz9AI7E9UaI6TwljGPvDzgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7pz72LPp3ixRpNKAvcqwxJRgF2KeJfZGy2XCmQND8XQRW1NN701nrw3djHiosEQinW1B/Y8HB4HgpOUozPpd0GI+7UWoMhJmkqsiCfDVfTy9a7NSUyAlL+m+wjP91yTIQvfWN7VVo9m8RAc9R04TJEJAmITBErnutQL0QSCMwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h/fTftTS; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h/fTftTS"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so1394a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 11:09:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790100541; cv=none;
        d=google.com; s=arc-20260327;
        b=V2yGsXtpIWjYQo0Z25dA6gFlJwW8B8OTCL9bec2S3STrYTdDCReGMGC67GrtbFUpM8
         woqE1TbzftVPihl8UY0siUp627tEsueS2glirYDuPzvp1BGKw3JRpC6S3d/mZHfETAK7
         pXLltehhq80zc0r95Fh3ipOoKJ8pNL8WqBrAgQ5ahdNVO7y6inCv5TolTEB8u5k7KmL8
         p9Hw8pTEf1ccPW9DR4AYCHasq0lNNSK702ghMRv5y2xTsaI7KDoJIgR5cMBz5pG667Ks
         byQpuEk8CZuw1+4vwASFgU3ZQjj51gqvcomuaeDY9X5yekKsz8Tp2TsqL68R63JJZEvu
         46VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8UYeuyjCv3q5EPl5dH/d4cKtOpUQwBBX7CUP3vxOjWA=;
        fh=9lL0hF0NMGethsOlsxoDeLBT8jtu7UHbhiekQ8TuZEc=;
        b=gudJeGbiy+SDBE8UKDO9iNevwxhcEnN14qKWhlOBw5ZZPajqf7dCo0PfL9zB/fmoxa
         Tam0GxN99guD9l7WarieTFgpVNCih1UaEnWNIQx2e0HlNNGqb0zTOb1QKzcdyoB0bBoj
         wOpJezvcCDmjAdeVyfwChAl6zfH+89ecMdRETwaMSigzz7TYxMLbszM1PC3RMFoCzcCp
         Bf3l2CGtZqiku6d3s1nY1qZZxUOhkZrLzD1WVxdarqH8kzvBMwi0otGyBn94LI40ZaOE
         4uI4D6xel7ZDoQgHPfr83qQ0FXpJ4rigdqown8NwxzxNiMXpAMGpN+YSX/5JjkLPF4qX
         6b/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790100541; x=1790705341; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8UYeuyjCv3q5EPl5dH/d4cKtOpUQwBBX7CUP3vxOjWA=;
        b=h/fTftTSFNX7TBXudHunnhhQ8MUSkgtTtCU4TFlx3Ve2KVO3UkxCbLE4a0ct7WIBLx
         Oc2RL62LO17dRwnNuNmObQEh6MBbnykiLziyhI1RvYMlkePG69uVxQyAdzxw1LlV7wdb
         0eLUd8TGyiN5oax43PQlrW53014F5tZFColvcXWo9uMsWZw3BmyIvQXMHaCMrkTyL0XU
         zjvXVmVTWrSs8BA1jC7SUXdCoUGwmU55usMTH+JmBf/qDzd6XX7q0gjjU9oJOoHyjV8d
         6m2XQialPdEtvZVikLVCTXmLnJXidb9nE5SRa9SzWtsB1gFmGkavxQ9t4goPw8cZbw5l
         EpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790100541; x=1790705341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8UYeuyjCv3q5EPl5dH/d4cKtOpUQwBBX7CUP3vxOjWA=;
        b=kCAV3tDXcgTxXXF0FxVjWV/MvksyENtmg0GyXYuDbUk5ShSdnhOchJ5GK7IXeRfk6X
         QPaU9hMmGPmg0B6vUWTdJhunF1aS7qcii2yrf4usSeAuO5dRu0QfllZQeoXyRBQ4sOiX
         INUX2ymTEt3bx7OPlPYaD9KUSDlLt05+3F1ssvGszR8cZXCssz8EfVPKcQOZHBdYoDHe
         O4hGsblEqoMD7FTPboYrVxq/4m/W7mR/kAuEbrNLnSKgTDgNna3kpEdRIm8ucmXK2g9v
         C3EnJGH6SyQC8dK4OeDT6QQcf8ByE7vpK5gJzpnVcH5YTK9b5Ub3SBtj2B/m9t1aOFIG
         YKyw==
X-Gm-Message-State: AFuF++msvCWuL+UZEBmp+MSHbfBu4CIvU6kNjvFE3TuvGFJMZ4SWoHzT
	U83IcGQ/LPd+5U4vGpdJZukDHkmSasemmTmlQpCUJPizugfKrsdJJZrGzaGhksHqQhAyKzQp41f
	tRDxraBBktPWOYgusVWRGkOuoeFGpJ4DYxrwY9UpoMg1R6bHszqkLuaMlOzQ=
X-Gm-Gg: AYBFou0EKEJiXBPqC2eFRSRYQgPmDCu/eowlsVAQtva8bO5IgLILXvs9uFSdYuayIP/
	8/mrpZ5BCeJYbtfOcIrAcyTvHHeZw/VsmwLwbq8ABmvo2LSZoyZ9tqU/FSznpBGesD2kMVDdAmv
	+GnmdXRFGsgQenPmBcYZ+RJVhJPA4uHfPalhZmxDVD+lnRgYWaswCfMhUU7RJdTgDUt78QsaZTt
	vfHK8Q6m/ZJf8rV7BtLZBN/5F9txL2qWcmqQZUwezefX+W/Q33XY4zJtUWfHUk8lCKhKMooUfre
	/3bvZn6xNe8NH6Yo/lt4yEptirF5Fv/TKBdgFhbnz7UjTPL8baAAFvY=
X-Received: by 2002:a05:6402:642:b0:6a6:f2a5:1b4f with SMTP id
 4fb4d7f45d1cf-6aab3b1d94cmr4826a12.4.1790100540996; Tue, 22 Sep 2026 11:09:00
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918154530.4129698-1-jmattson@google.com> <20260918160109.E76B81F000FF@smtp.kernel.org>
 <arKJQwAPvApkeESD@google.com> <CALMp9eQboC6DTQfa3N58XCfOLf-qwJ2L7dC5vtqDerHG80eZLg@mail.gmail.com>
 <arKQJJJB8HMK0B1G@google.com> <CALMp9eQi0gm7ojijfKDZz9oZh+BK13qUkJOFrCmxjJTr5sx3Lg@mail.gmail.com>
 <arLAtdMP7LV0r-D9@google.com>
In-Reply-To: <arLAtdMP7LV0r-D9@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 22 Sep 2026 11:08:48 -0700
X-Gm-Features: AclHuK9p9bMGa6p8o9NcyNWNOvoonpnh0HTAaFWp_AwSDuvBs2kVHxxarQtOg4U
Message-ID: <CALMp9eThtND2KddrmySqViNsLyisdd6_ZH01s9jrA9K-_yQzXg@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86: Disallow EFER.LMSLE when EferLmsleUnsupported
 is set in guest CPUID
To: Sean Christopherson <seanjc@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 10:53=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Tue, Sep 22, 2026, Jim Mattson wrote:
> > On Tue, Sep 22, 2026 at 7:26=E2=80=AFAM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > On Tue, Sep 22, 2026, Jim Mattson wrote:
> > > > On Tue, Sep 22, 2026 at 6:57=E2=80=AFAM Sean Christopherson <seanjc=
@google.com> wrote:
> > > > > Gah, I hate the negative "feature" bits, I've gotten completely t=
urned around
> > > > > multiple times trying to sort through this.
> > > >
> > > > Me too!
> > > >
> > > > > IIUC, you're trying to "fix" setups where host CPUID.EFER_LMSLE_M=
BZ=3D0, but userspace
> > > > > configured guest CPUID.EFER_LMSLE_MBZ=3D1?  If so, then Sashiko i=
s right, it needs to
> > > > > be declared with EMULATED_F().  I would even argue that technical=
ly this isn't a KVM
> > > > > bug, because KVM won't advertise EFER_LMSLE_MBZ in KVM_GET_SUPPOR=
TED_CPUID on such
> > > > > hosts.
> >
> > > > I'm trying to make it possible to run a Rome vCPU on Milan or later=
.
> > > >
> > > > SInce this is a negative feature bit, it must be retained if the ho=
st
> > > > reports it. That blocks running a Rome vCPU on Milan or later.
> > > > However, a defeatured Rome (which reports LMSLE_MBZ as 1) can be ru=
n
> > >
> > > So, a partially defeatured Rome?  Because it sounds like the CPU repo=
rts LMSLE_MBZ=3D1,
> > > but then still allows setting EFER.LMSLE=3D1?
> >
> > No; it should not allow setting EFER.LMSLE=3D1. That will fail on later
> > platforms and would block live migration from Rome to later platforms.
>
> Oh, drat, I misread the "Rome vCPU" vs. "defeatured Rome" paragraph.  You=
 want to
> be able to migrate a vCPU with guest.CPUID.LMSLE_MBZ=3D1 between a non-de=
featured,
> vanilla Rome and Milan+ (or a defeatured Rome).  Correct?
>
> If so, then Sashiko is right, the flag needs to be EMULATED_F() so that K=
VM will
> advertise EFER_LMSLE_MBZ to userspace on the vanilla Rome host, and also =
do the
> right thing when guest.CPUID.EFER_LMSLE_MBZ=3D0.

No; that's wrong. KVM_GET_SUPPORTED_CPUID should continue to report
EferLmsleUnsupported=3D0 on Rome. Otherwise, we break backwards
compatibility for userspace that simply transfers
KVM_GET_SUPPORTED_CPUID to KVM_SET_CPUID[2] or userspace that just
doesn't know anything about EferLmsleUnsupported. The "default" for
Rome and older platforms should still be to claim support for
EFER.LMSLE, even though that has always been a lie.

> If not correct, then I'm even more confused, because ignoring clear_cpuid=
,
> guest_cpu_cap_has() will only ever return true if boot_cpu_has() also ret=
urns
> true, in which case KVM *will* reject the value because EFER_LMSLE will n=
ot be
> listed as a supported EFER bit.
>
>                 if (!boot_cpu_has(X86_FEATURE_EFER_LMSLE_MBZ))
>                         kvm_caps.supported_efer_bits |=3D EFER_LMSLE;
>
> > I want KVM to abide by the guest CPUID bit and disallow setting
> > EFER.LMSLE even on hardware that allows it.
>
> Right, and that requires declaring EFER_LMSLE_MBZ with EMULATED_F().

I think you and Sashiko are both wrong. PASSTHROUGH_F() is correct for this=
 bit.

I think I need to report EferLmsleUnsupported=3D1 in
KVM_GET_EMULATED_CPUID, so that userspace knows it can opt-in if it
wants to.
