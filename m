Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F418C433E9E
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 18:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102093; cv=none; b=IyRlo5IqBBCrt0ulLmK7gpHRq7tlam9lLXfoDfS9mvDrl7J1519+NnAQnr/pKqp8AO1ZKFIljD+Ql2+/xcNhIumxHRcueFnLS9uXqIRg5w5oZODkRNV1AF8M0qy2JazJEaJfzE53HG/ZLUz5QcbMJjAYai5kdt04hqDA8qhozSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102093; c=relaxed/simple;
	bh=dE6blP7xL/WHMHL7CQSKGlnHE/Koi3s3g0Al+rqSe8o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hzx5a9z3oXhTSTbg9nw3PQahgTMcfjy8/+aa2TgXhDh85LttziA0rL9kxOE34U52PnkBYkMr1qwHJKNyO/YGtw74deiFZxVgV9M1/Qo5trjXBQM27GydWjB2EAR1vk5xP7nGsFa2xFE51iitgzrQBXYqNyQYONUaZ940U+vWXEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=okRu66y6; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="okRu66y6"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so341145a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 11:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790102091; x=1790706891; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bJLCRmfCHJwYyMuCa+r79MDdK0EYy9EEEkSv2qnLSYw=;
        b=okRu66y6jjhsGoNqi+o81DXmt1oCIt8Xk4MuVQhUeEyA/TG8iFsgah98QniGF4ZTDy
         PlH9/BsnWwYwCFTjbNDtUBUdIp2jRXYRjA7IGpy6PjamGH7PEz90Jn7xS1nBUH2KGiI3
         uecNHDoxmWKmnqSiSEOM3nisHv5k0ed5uaNt4cq59vlEpvl8nVPbmGDnYkjO6of8vmf4
         hial8+0uiwU4xArEucHrmO0KulIa7aNN29KycvapffM//6KNkg8XupvUJLd35PvKLQQr
         eFDDSTlwcWPknVhlZ+btlVokXQxlMoWaBRGvDdmnHWRqVBRzxKZI4N5not/JsrL3QBIv
         6HDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102091; x=1790706891;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJLCRmfCHJwYyMuCa+r79MDdK0EYy9EEEkSv2qnLSYw=;
        b=1Z2bkhM6zrmgBqi5nvGoZAw8E4a/OmWKvKSbvjhd/9KroHazUnrobEeeTn29aI1xAe
         6ywD2itZomTZVpn/eniTY9xSJ+bKgViaiQXAQmmBgiFVSNIaO1ipx/byJJKqFosfyXv0
         e4GVjF3fmzvpAM5KjnLG7ALEEfET91//dhw+u3ipy05TmQaNS9B2OFmuiX9mLR+/WD0s
         17i3aZeExyTmSEkzi0EF1G9DIqDFJ2VjzoU1ifABHf229VxN1G3A3VgEadEvFcv9iOsa
         u/aP1oqfNZoRIHggz1pO7L20WGQ9Benk/YqKHdIPmtEWhce7DK1floixb0lFY+alb56Z
         XHGA==
X-Gm-Message-State: AFuF++lZtaEUBZKVompe8QMUQBRkHZuVRz1pZdyzNvm0VsyIq96ozmIG
	/9dNBiWEz6YMZAYBEvw7lrfBvIDn0r7o1ypHuEbqcx0/LAqjoyyzySMvq0WU6zFopTArx04I6+m
	HUe7V0g==
X-Received: from pjbnm10.prod.google.com ([2002:a17:90b:19ca:b0:3a0:7ca0:31cc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2ce:b0:39e:6a80:b793
 with SMTP id 98e67ed59e1d1-3a07e5ea2bemr271386a91.35.1790102090837; Tue, 22
 Sep 2026 11:34:50 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:34:50 -0700
In-Reply-To: <CALMp9eThtND2KddrmySqViNsLyisdd6_ZH01s9jrA9K-_yQzXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260918154530.4129698-1-jmattson@google.com> <20260918160109.E76B81F000FF@smtp.kernel.org>
 <arKJQwAPvApkeESD@google.com> <CALMp9eQboC6DTQfa3N58XCfOLf-qwJ2L7dC5vtqDerHG80eZLg@mail.gmail.com>
 <arKQJJJB8HMK0B1G@google.com> <CALMp9eQi0gm7ojijfKDZz9oZh+BK13qUkJOFrCmxjJTr5sx3Lg@mail.gmail.com>
 <arLAtdMP7LV0r-D9@google.com> <CALMp9eThtND2KddrmySqViNsLyisdd6_ZH01s9jrA9K-_yQzXg@mail.gmail.com>
Message-ID: <arLKSkliAXuww3-0@google.com>
Subject: Re: [PATCH] KVM: x86: Disallow EFER.LMSLE when EferLmsleUnsupported
 is set in guest CPUID
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026, Jim Mattson wrote:
> On Tue, Sep 22, 2026 at 10:53=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >
> > On Tue, Sep 22, 2026, Jim Mattson wrote:
> > > On Tue, Sep 22, 2026 at 7:26=E2=80=AFAM Sean Christopherson <seanjc@g=
oogle.com> wrote:
> > > >
> > > > On Tue, Sep 22, 2026, Jim Mattson wrote:
> > > > > On Tue, Sep 22, 2026 at 6:57=E2=80=AFAM Sean Christopherson <sean=
jc@google.com> wrote:
> > > > > > Gah, I hate the negative "feature" bits, I've gotten completely=
 turned around
> > > > > > multiple times trying to sort through this.
> > > > >
> > > > > Me too!
> > > > >
> > > > > > IIUC, you're trying to "fix" setups where host CPUID.EFER_LMSLE=
_MBZ=3D0, but userspace
> > > > > > configured guest CPUID.EFER_LMSLE_MBZ=3D1?  If so, then Sashiko=
 is right, it needs to
> > > > > > be declared with EMULATED_F().  I would even argue that technic=
ally this isn't a KVM
> > > > > > bug, because KVM won't advertise EFER_LMSLE_MBZ in KVM_GET_SUPP=
ORTED_CPUID on such
> > > > > > hosts.
> > >
> > > > > I'm trying to make it possible to run a Rome vCPU on Milan or lat=
er.
> > > > >
> > > > > SInce this is a negative feature bit, it must be retained if the =
host
> > > > > reports it. That blocks running a Rome vCPU on Milan or later.
> > > > > However, a defeatured Rome (which reports LMSLE_MBZ as 1) can be =
run
> > > >
> > > > So, a partially defeatured Rome?  Because it sounds like the CPU re=
ports LMSLE_MBZ=3D1,
> > > > but then still allows setting EFER.LMSLE=3D1?
> > >
> > > No; it should not allow setting EFER.LMSLE=3D1. That will fail on lat=
er
> > > platforms and would block live migration from Rome to later platforms=
.
> >
> > Oh, drat, I misread the "Rome vCPU" vs. "defeatured Rome" paragraph.  Y=
ou want to
> > be able to migrate a vCPU with guest.CPUID.LMSLE_MBZ=3D1 between a non-=
defeatured,
> > vanilla Rome and Milan+ (or a defeatured Rome).  Correct?
> >
> > If so, then Sashiko is right, the flag needs to be EMULATED_F() so that=
 KVM will
> > advertise EFER_LMSLE_MBZ to userspace on the vanilla Rome host, and als=
o do the
> > right thing when guest.CPUID.EFER_LMSLE_MBZ=3D0.
>=20
> No; that's wrong.

Heh, it's not "wrong" per se, just unwise :-)

> KVM_GET_SUPPORTED_CPUID should continue to report EferLmsleUnsupported=3D=
0 on
> Rome. Otherwise, we break backwards compatibility for userspace that simp=
ly
> transfers KVM_GET_SUPPORTED_CPUID to KVM_SET_CPUID[2] or userspace that j=
ust
> doesn't know anything about EferLmsleUnsupported. The "default" for Rome =
and
> older platforms should still be to claim support for EFER.LMSLE, even tho=
ugh
> that has always been a lie.

But you can't have it both ways, KVM can't enforce a bit it doesn't support=
.

> > If not correct, then I'm even more confused, because ignoring clear_cpu=
id,
> > guest_cpu_cap_has() will only ever return true if boot_cpu_has() also r=
eturns
> > true, in which case KVM *will* reject the value because EFER_LMSLE will=
 not be
> > listed as a supported EFER bit.
> >
> >                 if (!boot_cpu_has(X86_FEATURE_EFER_LMSLE_MBZ))
> >                         kvm_caps.supported_efer_bits |=3D EFER_LMSLE;
> >
> > > I want KVM to abide by the guest CPUID bit and disallow setting
> > > EFER.LMSLE even on hardware that allows it.
> >
> > Right, and that requires declaring EFER_LMSLE_MBZ with EMULATED_F().
>=20
> I think you and Sashiko are both wrong. PASSTHROUGH_F() is correct for th=
is bit.
>=20
> I think I need to report EferLmsleUnsupported=3D1 in
> KVM_GET_EMULATED_CPUID, so that userspace knows it can opt-in if it
> wants to.

Hmm, I think we should have this be a "partially" emulated feature.  KVM de=
finitely
doesn't fully emulate LMSLE, and presumably anyone that cares about migrati=
ng
Rome vCPUs to Milan+ hosts is already advertising EFER_LMSLE_MBZ to the gue=
st,
i.e. doesn't need identify which KVM version have the bug and which don't.

E.g. something like this?

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 38450e9fca9a..67807cd95958 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -1416,6 +1416,22 @@ static int cpuid_func_emulated(struct kvm_cpuid_entr=
y2 *entry, u32 func, u32 ind
 		if (kvm_cpu_cap_has(X86_FEATURE_RDTSCP))
 			entry->ecx =3D feature_bit(RDPID);
 		return 1;
+	case 0x80000008:
+		/*
+		 * Honor the guest's EFER_LMSLE_MBZ even if the underlying CPU
+		 * allows setting EFER.LMSLE, e.g. to allowing migrating a vCPU
+		 * between hosts with and without EFER.LMSLE support.  To avoid
+		 * breaking existing setups that reflect KVM's supported CPUID
+		 * into the guest, KVM doesn't advertise EFER_LMSLE_MBZ unless
+		 * it's supported by hardware, i.e. unless KVM *can't* support
+		 * EFER.LMSLE=3D1.
+		 */
+		if (include_partially_emulated &&
+		    !kvm_cpu_cap_has(X86_FEATURE_EFER_LMSLE_MBZ)) {
+			entry->ebx |=3D feature_bit(EFER_LMSLE_MBZ);
+			return 1;
+		}
+		return 0;
 	default:
 		return 0;
 	}

