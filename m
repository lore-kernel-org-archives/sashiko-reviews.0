Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7849E846A
	for <sashiko-reviews@lists.linux.dev>; Tue,  6 Oct 2026 05:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791265027; cv=none; b=stlyaj/Tzxb8qoPgYsQMYpqxnU52lxopisVOWSYbfNC5ucvn+8vwdsZjYydDmti9JBQv3gPlYttwYG/Cd9z4OUxNJ2dIPc0P50i+E+fM2TCTONsNve8OfXzDEBURzmM4sOxtWxurEzchQAgJ2bjEh6NN7yxCGo7rHd8+pr5lCA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791265027; c=relaxed/simple;
	bh=8GHqHHW4P3wMvCdDuwdvXLkRiUFHsX1QeAsDhLHpns4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=neJPVVQs5APKNueQISbMXODJZ165qNXQ0joxFRJwACfD82lMDGLKgGhQTJEXSBXPSkDZ22YAvMLTQKwjAJ7MeKC1OseKhSbFAJPYTWclecg0qa8dh1NzCD88SN+8uOgMdZve1wSSkt503oQGiJH30mtUPklmAGB9FreldmYlVpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nUmT38Nj; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nUmT38Nj"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc489e7a701so2753136a12.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 05 Oct 2026 22:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791265026; x=1791869826; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JrZ+9fylt/opwUtHI9ou9/fKWBeNkcZDirBcL4MFEik=;
        b=nUmT38Nj6BHmkNYFbZL4Uge5QkZWGplGJ1JqaMoaxCcdr2vOzgFt0iqUxp/Xh51o4Z
         7SajkRYL9TICWfZBQU5N692DxYKIsRWFgMfRx2QLP1TbkQQjDyZXUd0kMuyPS0apamD8
         zhnj5hJOn5Ajw9ecHTiUasMw31913EqfAnFzp9qFXE+4QJkajTAkA5U2bB3GatwksfzA
         yubL6JIbHw9NJN+8lStNxuZJdQPA0yW7ZmyezBvuWFyG+oCG6tQmwOb+hpB2JSEuZ6uQ
         ceoejv5ij2BUEttPqg9kFPSRaorEO3I/vX/u88vjipnT2K+0kW4nqr5RsVOem7nZj/tO
         Z15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791265026; x=1791869826;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrZ+9fylt/opwUtHI9ou9/fKWBeNkcZDirBcL4MFEik=;
        b=mGf2JjFhqgXskNsvTO99qRJa1VyHY7oNq6pOUD6V4uP83E4boK2Yx0Ja8PMPRqpjXf
         ABRpoFDgbfeihbPR9ESM/tKjlmb9so6Fz/f7CUrwYAnJxHnr+3D2pMZgKWT03iaERR8G
         SQ9d9lXlZkW+RWuaZiRNNvax+y2P5p6uEhKk1mHlwyfZKFf9L7JXvTzrBplhvMfKlG+F
         oFb7f1uvMgnj6/7NPq2VfrWiWY143wjzapCySk3L85vgsb+DPrx54X6ywS6D6ZQqIw8e
         PvXwk/N/FyXcmXUsP+hETvfYdXgcBrAfKwibt2EQ2gClV/E2721OOhekFcDAb+iOWz/v
         LYRw==
X-Gm-Message-State: AFuF++ka+2u0LraPRzG5+BoBICfZH+BnnstddCvPLu3r78Pz7HCMM6Tg
	oBD3OyUUzC9M1+USn5MDvlPxuVVDBaRAlOu0IWYZRFXi811iO4L4YZU2MJb2u9MJsRIQvCleZwR
	gi6M5yA==
X-Received: from pgap125.prod.google.com ([2002:a63:4283:0:b0:cc7:ac0b:f49d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1405:b0:3dd:85a8:cb81
 with SMTP id adf61e73a8af0-3e12472425dmr273047637.36.1791265025528; Mon, 05
 Oct 2026 22:37:05 -0700 (PDT)
Date: Mon, 5 Oct 2026 22:37:04 -0700
In-Reply-To: <CALMp9eRkgiFYeQcTU_aweJQTfrq7ijN5hw+6otKE_RvgGQm=Uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com> <20260930173635.3362655-14-seanjc@google.com>
 <20260930175237.A8FD21F00898@smtp.kernel.org> <ar1QBSKMGJUFBExK@google.com> <CALMp9eRkgiFYeQcTU_aweJQTfrq7ijN5hw+6otKE_RvgGQm=Uw@mail.gmail.com>
Message-ID: <asSJAJUuvCAXkCwi@google.com>
Subject: Re: [PATCH v3 13/21] KVM: selftests: Use KVM's reported TSC KHz as
 L0's frequency (sanity checked)
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026, Jim Mattson wrote:
> On Wed, Sep 30, 2026 at 11:23=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >
> > On Wed, Sep 30, 2026, sashiko-bot@kernel.org wrote:
>=20
> > > > @@ -212,18 +209,30 @@ static void test_tsc_scaling(u64 l0_tsc_freq,=
 u64 l1_scale_factor, u64 l2_scale_
> > > >  int main(int argc, char *argv[])
> > > >  {
> > > >     u64 l0_tsc_freq, tsc_start, tsc_end, l1_scale, l2_scale;
> > > > +   struct kvm_vm *vm;
> > > >
> > > >     TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_VMX) ||
> > > >                  kvm_cpu_has(X86_FEATURE_SVM));
> > > >     TEST_REQUIRE(kvm_has_cap(KVM_CAP_TSC_CONTROL));
> > > >     TEST_REQUIRE(sys_clocksource_is_based_on_tsc());
> > > >
> > > > +   /*
> > > > +    * Create a dummy VM to get KVM's default TSC frequency.  All C=
PUs that
> > > > +    * support TSC scaling should have a constant TSC, i.e. there's=
 no need
> > > > +    * to calibrate the "real" TSC.  But do sanity check that the o=
bserved
> > > > +    * TSC is within range of KVM's reported TSC frequency.
> > > > +    */
> > > > +   vm =3D vm_create_barebones();
> > > > +   l0_tsc_freq =3D (u64)__vm_ioctl(vm, KVM_GET_TSC_KHZ, NULL) * 10=
00;
> > > > +   TEST_ASSERT(l0_tsc_freq, "vcpu ioctl KVM_GET_TSC_KHZ failed");
> > >
> > > [Severity: Low]
> > > Does this properly catch an ioctl failure? If __vm_ioctl() fails and =
returns
> > > -1, casting it to a u64 and multiplying by 1000 results in a very lar=
ge
> > > non-zero value (0xfffffffffffffc18).
> > >
> > > Since TEST_ASSERT only checks if l0_tsc_freq is non-zero, won't this =
pass
> > > using garbage data instead of failing the test?
> >
> > Eh, yes and no.  KVM_GET_TSC_KHZ existed long before TSC scaling, and w=
hile KVM
> > doesn't sanity check tsc_khz, i.e. KVM_GET_TSC_KHZ could return a "legi=
timate"
> > negative frequency (when those ~2.17PHz CPUs come along), in practice c=
hecking
> > for a non-zero value is sufficient because any bogus value will quickly=
 fail the
> > functional checks.
> >
> > Heh, actually, kvm_arch_vm_post_create() *already* validates KVM_GET_TS=
C_KHZ:
> >
> >         r =3D __vm_ioctl(vm, KVM_GET_TSC_KHZ, NULL);
> >         TEST_ASSERT(r > 0, "KVM_GET_TSC_KHZ did not provide a valid TSC=
 frequency.");
> >         guest_tsc_khz =3D r;
> >
> > so this is a non-issue.  I agree it's not the prettiest, I just don't c=
are enough
> > to clean it up.
>=20
> In my best Sashiko passive-aggressive tone:
>=20
> Is it possible that vm_create_barebones() bypasses that check?

LOL, *sigh*.  I'll send a patch to add a wrapper, having to manually do the
assert is annoying.
