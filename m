Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B60477E33
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 18:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781633810; cv=none; b=mEhM6ybJbMzEst1fJ0zG9uU5e5P7iz87gPgOCk7EYfn1avVf63jbFSAckbSUnWSMy83bFtedafwBp1rjZg/9vuIIpKZSj+asi9QFCJHyxcUxZn1/o4yH1H5OSfCWMx5mXrMT6Tkr1T26mCQm7nG1uAU/LqHFPyJ9RBTxzsyCRBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781633810; c=relaxed/simple;
	bh=NmpYvmp6cwxFHn3mg6u1fb6FA3N2hxqBeQIzCnLivYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JblZGLUYD08hi4T/n3TtVF2ivbCqrE3cCl81Q15Zbmrw5LmzkT3vS6/FiZTHIxE6oP8qINKnDJa9rNeFX1ZNVHS8/t/j4Gg62M/K0/8gjUJv3Q7UFx3hPZoeRdIt8udc6vvO+GZcED48AIJDFJTCFY1yREVzYziQYwjXPnDW7h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5mUDVe6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5mUDVe6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39681F00A3A
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 18:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781633808;
	bh=uYZjBFBZyt8jiCkJQvne5/0yuISJdA32kXbGUb9705I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=V5mUDVe6Q2N01xUWyMl23IfxNfnRqhsDvVepLuiWpU6kQsixqK1cdY9tUMxLD6r1x
	 ZfYszjzDO00URyZLw52zwtDduoeQFOoi7AOamk2DxuGP8KvvROD0POV6KR9PHUuIms
	 MtEOcR1KncH6dARCpzVnO3voIBtgKzKtGUBUVIhf+mpoMYOuHZLDfBHt/DBIEWzpgh
	 1GrkExwOMLSCJ4O9+l9abeH0SlhKztJasYtIq5kUeib6SQlTULtF51cIQaEEL5uODN
	 xm/+Fzx+7HL8JhQWYWoNq5owLR2C06hCjueFZjxk4kZUtVCAXbQuTuwo1+7GMRhAp7
	 TORNxcFZM116g==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bf84a2b2077so576787466b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 11:16:48 -0700 (PDT)
X-Gm-Message-State: AOJu0YwmvcPOJbUBSCNnAHTNV8hYMvV+D0urnLMg+lNzJwFKCbL5neM5
	NgAfnSCK5lptYtV4VZkF6PEi99nnya9zUVx5febLyYN+Rfhg8uyGyHZeCiihot0Bu0qTmP/jvVo
	KO0WzwtRKyy7vHVPc3q6G8NvnuyoK5gw=
X-Received: by 2002:a17:907:934e:b0:bd6:4d8c:bbff with SMTP id
 a640c23a62f3a-c05a5414006mr53106166b.22.1781633807830; Tue, 16 Jun 2026
 11:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616004155.1435766-25-yosry@kernel.org> <20260616013031.53DAC1F000E9@smtp.kernel.org>
 <CAO9r8zPA6B72RDWeBMHqv1xz6o9dDHEEjwnMjwAwVwA=5qxaKg@mail.gmail.com>
In-Reply-To: <CAO9r8zPA6B72RDWeBMHqv1xz6o9dDHEEjwnMjwAwVwA=5qxaKg@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 16 Jun 2026 11:16:36 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNzWTbt8j1s7uU8zGGaw1Qy6zuYTrBTbgthHBB6Lvso0A@mail.gmail.com>
X-Gm-Features: AVVi8CdYSl4SsTmo3Sy5DNpk3bRvzkRhKdmW2YBJM4D8KI5kKw2GYH4nijrSDN0
Message-ID: <CAO9r8zNzWTbt8j1s7uU8zGGaw1Qy6zuYTrBTbgthHBB6Lvso0A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 24/25] KVM: nSVM: Use different ASIDs for L1 and L2
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 11:14=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wro=
te:
>
> [Omitting the previously reported issue]
>
> > > @@ -1557,6 +1550,8 @@ void svm_free_nested(struct vcpu_svm *svm)
> > >       if (WARN_ON_ONCE(svm->vmcb !=3D svm->vmcb01.ptr))
> > >               svm_switch_vmcb(svm, &svm->vmcb01);
> > >
> > > +     free_asid(svm->nested.asid02);
> > > +
> >
> > [Severity: Critical]
> > When the hardware ASID is freed here during nested SVM teardown, does
> > svm->nested.last_asid also need to be reset to 0?
> >
> > If L1 disables SVM, svm_free_nested() is called, freeing asid02. This A=
SID tag
> > can then be reallocated. If L1 later re-enables SVM and uses the same L=
1-managed
> > ASID, nested_svm_entry_tlb_flush() will see:
>
> Hmm if L1 reuses the same ASID, it's up to L1 to explicitly flush it if n=
eeded.
>
> That being said, KVM needs to flush ASIDs when first allocated anyway,
> otherwise we risk reusing TLB entries from a completely different vCPU
> or VM. This series correctly does so for L1 (calls
> vmcb_set_flush_asid() when initializing vmcb01's ASID), but not for
> L2.
>
> So yes, we need to make sure asid02 is always initialized (and reset)

last_asid* not asid02.

> to 0, but not for the reason Sashiko mentioned. It's so that the first
> nested VMRUN using an L2 ASID always does a flush (as L1 is not
> allowed to use ASID 0).
