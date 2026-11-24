Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541573;
	b=i/zlg9huOxh0NXFsddI1G6tX9Odp3VhIC4c92XqNGv1UGzAKPV7ozo3E+OGDJa6Pvwfm
	 yGAVn1NbFcFkxASfMI7mZPPr3Q6nZuKX4MU86bXHszqhGktrhDusqf0TKxgA3myHi9c1l
	 GNW9Uw3SG+zjALubX+r5Ek0DCYkrhLVUbtVu+ZtCUcAbI2yQ9Z65f8Q7M7nuh3M5CNX+0
	 TEWqfwx+aQClg/i20ZZq7hM+sn0jiGZ+rhs8SgLZWX/sK4lkXYYAeGs4Fl8Mt2zUkUC5q
	 u6/JBktaTrMYBVrhNCT6nSXJ7MQsWxpzQnjQc8qKybi1cjVbfWzdoIrgjvDTQaNxFLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541573;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Subject:From:To:Date:In-Reply-To:References:User-Agent:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Transfer-Encoding;
	bh=Eod0T0BexMTSHiImrH+aVTmGuUQMNheq/HHDyeubfQ4=;
	b=1dz0JUGihXi+c1pDg15nohircopODIySGEvzyKYXzGvf5lc6mVBc+5jBSy1R1iMCGchY
	 LNm+IuAjoFR5iJOqxeSUzrBGMHPEiKyNwZ+gCN6vru5cKLPMBey240K43GeOFd0frpCFe
	 HQ6pwjnF0QSO2aUAIgiLkxTrLMtgFQxCW8K2Y2CgLN7JCwSZ9cO0SgcoNTNqRVGgoz1eD
	 6tXjAx0q9x0WPuNp1YlX/OVyTApW6jRnkRZvDUo/y+CUqGDPLt3eaZfV7cjmjfQBIuNB+
	 zgNRKoDONx1jCiBZoNxUg7uYHGGZcWGm0SgB0KEXcPrDjOEvVEKJKvpl/BSPe7xXokQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K3tVAvH5;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C18606A680
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 17:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C18606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K3tVAvH5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795541572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eod0T0BexMTSHiImrH+aVTmGuUQMNheq/HHDyeubfQ4=;
	b=K3tVAvH5sm5fUm022tLynxoj/xT/8kb7TtrxuX4D5gfjsx9AOG/b9FtesuPdsaB7cXlFUv
	4fKw8aSvvX0Av/cYEODy6gQZoKOfdhPt5UKNaVEN1d/zllzXXur63vL84zes5ujoXxmT59
	OkxTARC3F1GiWA2pbLmLtn0ov/11qek=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-nn5RJ-UFNlK6yS_miOZneA-1; Tue, 24 Nov 2026 17:32:49 +0000
X-MC-Unique: nn5RJ-UFNlK6yS_miOZneA-1
X-Mimecast-MFC-AGG-ID: nn5RJ-UFNlK6yS_miOZneA_1795541569
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67994010b21so36971d50.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 09:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541569; x=1796146369;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKHHL1EZ/+cFBzRlCdCFp5e4KQB3PH59TU0PApZ9Byk=;
        b=OQGocAfsxDrW0E9LRO6RtC39SFZFYAl17iukrTSoh2P8NMvPBC+ZRayq+oNr3XT6/V
         87B7PG1c7tZEpXZxUmWfrm5BMc8MWkjp0WiH3GDpB0sfwOP/UhnJZcm/xjf7yZ/qOxqL
         D5hTL8rUJ6Y5J0FJpl5l0liFPrnBS4QLroydeZNqwG6XxVkD2yd08hywNgRavlTxpGXB
         AQFud0iOp2ObBrevFpRTzBzly/OFBmyTe6lpIlGJnvX+BnvX1bxlBqqwgfYKYElDlHpd
         l4JjP37oQwr/VvQBlCBPjzTdU0usHm9kflFXSY7uiAjsCnzCbQNm55Hl/0J0hY2oEwT+
         JY8w==
X-Gm-Message-State: APuU4Z/iUOqY9UTRGm0xCOndMOB+gbW5RXWZxCJgQww58BBhAtqb4kOa
	qKabkZDJmmzccU2ni473Nr1vYDSDstQSUyfkJ9hfbFf50nV7PKUamygQ/SJ4VqvoVsfJXhTCTFz
	WJmyqVhDVMpX/nfStKZ/+cuuc5q39Cl8cFAXY8gbSk6MaWnTtVJ23r4/odMXRzLaG28xkRsQicu
	sgpEGh0yEpr92lpnRObMMQJuz7HuyPLc78RjQk0nYl+nOhP+JmpKc6KA==
X-Gm-Gg: AZFdTZechP2h09xcLvUesDgvBDUJ5GgKOhSayraQZUcbjii2bqsjqdXU3mo3JM2ij5H
	1N6bxMhjC/oB5b4Yl+pCnKcyikGrmeIzK+nVFoeY6Mf6aSQtYhp750usVtAW/AEJ6fRiSqSLLtN
	08eSigNpHSO6/M9zWIUqSVuUH8PZmHEWERb1EhL2JOoqSQW8bdO0To3SU4VXShFz9yLWRAmypD7
	QHzVzP10umVpmLapqcm0pQSnQGxG91VHVjHu4bSeJDkq/BKeUDIe9FWmH6n2a1yQ0kwDfgvUNu9
	CIZ+b+ZoeFYyQIyAHI0i5ok6fV3kQ8alnBHbJecvHR7TVnkCvMjwlTxwZMmoEnrGYqQfrOgUa5a
	Pf9BH6y6CM/1KYggrmqMzQK8ejKQUAq6mMGtgLm8hZrqRlVSdZb3DJCa/somBw1Sv5yvlh7KOL4
	Ne0Ujo+UY=
X-Received: by 2002:a05:690e:14c6:b0:679:cc49:55dc with SMTP id 956f58d0204a3-67df44e0fabmr6736181d50.92.1795541569090;
        Tue, 24 Nov 2026 09:32:49 -0800 (PST)
X-Received: by 2002:a05:690e:14c6:b0:679:cc49:55dc with SMTP id 956f58d0204a3-67df44e0fabmr6736167d50.92.1795541568570;
        Tue, 24 Nov 2026 09:32:48 -0800 (PST)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb ([209.103.33.216])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33d64a0sm7635009d50.22.2026.11.24.09.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:48 -0800 (PST)
Message-ID: <431679ef5fac99ad9dd0eab04a081c6de4f728ac.camel@redhat.com>
Subject: Re: [PATCH v3 2/5] KVM: x86: split vcpu->arch.hflags into
 nested_guest_mode and smm_mode
From: "mlevitsk@redhat.com" <mlevitsk@redhat.com>
To: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Date: Tue, 24 Nov 2026 12:32:47 -0500
In-Reply-To: <sashiko-outbox-229793@kernel.org>
References: <20261123175512.80438-1-mlevitsk@redhat.com>
	 <20261123175512.80438-3-mlevitsk@redhat.com>
	 <sashiko-outbox-229793@kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: chc1Nu2iC7v5FQf5qops6r8rVU8HhIyL38GbXMVpJSY_1795541569
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-11-23 at 18:03 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] KVM: x86: build failure in kvm_vcpu_reset() when
> =C2=A0 CONFIG_KVM_SMM=3Dn
> - [Low] KVM: x86: commit log names nested_guest_mode instead of
> =C2=A0 nested_guest_state
> --
>=20
> commit f779a065108faeca6cdd5ce21f760f2b6bdeb40c
> Author: Maxim Levitsky <mlevitsk@redhat.com>
>=20
> KVM: x86: split vcpu->arch.hflags into nested_guest_mode and smm_mode
>=20
> This commit replaces vcpu->arch.hflags with separate nested_guest_state
> and smm_mode fields in struct kvm_vcpu_arch.
>=20
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm=
_host.h
> > index 683bb8bf43a94..17308713a2904 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -735,7 +735,6 @@ struct kvm_vcpu_arch {
> > =C2=A0=09unsigned long cr8;
> > =C2=A0=09u32 host_pkru;
> > =C2=A0=09u32 pkru;
> > -=09u32 hflags;
> > =C2=A0=09u64 efer;
> > =C2=A0=09u64 host_debugctl;
> > =C2=A0=09u64 apic_base;
> > @@ -755,6 +754,16 @@ struct kvm_vcpu_arch {
> > =C2=A0=09u64 arch_capabilities;
> > =C2=A0=09u64 perf_capabilities;
> > =C2=A0
> > +#define KVM_NESTED_IN_GUEST=09BIT(8)
> > +=09/* Non zero when the guest is executing another guest */
> > +=09u16 nested_guest_state;
>=20
> [Severity: Low]
> This isn't a bug, but the commit subject and message call this field
> nested_guest_mode while the code names it nested_guest_state.
Will fix.
>=20
> > +
> > +#ifdef CONFIG_KVM_SMM
> > +#define SMM_MASK=09=09BIT(0)
> > +#define SMM_INSIDE_NMI_MASK=09BIT(1)
> > +=09/* Non zero when the guest is in SMM*/
> > +=09u16 smm_mode;
> > +#endif
> > =C2=A0=09/*
> > =C2=A0=09 * Paging state of the vcpu
> > =C2=A0=09 *
>=20
> [ ... ]
>=20
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index aad065d035fbb..4e515bcdc85cb 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
>=20
> [ ... ]
>=20
> > @@ -9558,7 +9558,8 @@ void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool i=
nit_event)
> > =C2=A0=09kvm_lapic_reset(vcpu, init_event);
> > =C2=A0
> > =C2=A0=09WARN_ON_ONCE(is_guest_mode(vcpu) || is_smm(vcpu));
> > -=09vcpu->arch.hflags =3D 0;
> > +=09vcpu->arch.smm_mode =3D 0;
> > +=09vcpu->arch.nested_guest_state =3D 0;
> > =C2=A0
> > =C2=A0=09vcpu->arch.smi_pending =3D 0;
> > =C2=A0=09vcpu->arch.smi_count =3D 0;
>=20
> [Severity: High]
> Does this break the build when CONFIG_KVM_SMM is disabled?=C2=A0 smm_mode=
 in
> struct kvm_vcpu_arch is guarded by #ifdef CONFIG_KVM_SMM, but
> kvm_vcpu_reset() clears vcpu->arch.smm_mode unconditionally.
Will fix.

