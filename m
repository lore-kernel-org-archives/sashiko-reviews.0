Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEDF2F9D85
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 21:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581728; cv=none; b=e4T27m2DKdiYO02fzU8x8lWv/iA0/Bt8Hbc45Gn10Hq1PfR8ufZL1W2TLxXtdUs++ddVxIMbI0a9LD57T1MPCNXILAmpTKTqweCfNGByZE8zSVzOP1bj4MraEflomwhs0XVzEDMB8BocZdHn4hIVOmPHZah7oIhL69y4s0L8qQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581728; c=relaxed/simple;
	bh=2XYfCKasrJS3bo70qdG/Jf9BEWoeG0DpFS1+eLaefAk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dZiK+EsZBIU5hFa4RV5zoTYPQg1dDTiO0MPxENe6e5RioOVJekSq4mVTmZgLWRQDVPR5J/k++pjBMUJr44i4ClAti3tSKYR8Y6tO6lwYOB3sKUcjzyDNGpjir7K1+ZQX+IyqGw0TFYzILBCjRVtXtbVOLZMYee7fSnmu8mclrJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SJRYGG/n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SJRYGG/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791581726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2XYfCKasrJS3bo70qdG/Jf9BEWoeG0DpFS1+eLaefAk=;
	b=SJRYGG/nl7zT9WDyVTcylCzERTddm3goDXxK1h6UXDG9Elx+n/8kYlPeayihzi2xzrzV2R
	STHVrqCZHREBUN+jMle41zrMP9oMIqRBDjxfq2VJXpvg4lLH2GdpvVeiK5georaepjJr5f
	DxfF8XVlSNLzWQu3yUxpt0IGthqgbws=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-Y3fvwLl-M8eICBjU1eqS6Q-1; Fri, 9 Oct 2026 21:35:25 +0000
X-MC-Unique: Y3fvwLl-M8eICBjU1eqS6Q-1
X-Mimecast-MFC-AGG-ID: Y3fvwLl-M8eICBjU1eqS6Q_1791581724
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b529a8610so6135766d6.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 14:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581724; x=1792186524;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7qrnbWCiEvCZxzwHJXj+vDALX5giaXNbTIm72EEdEPc=;
        b=I6ra+L6/c3zs4JdblKuaARffvcdBS0jRKAK3jU3An1sJDg3wc86g9NlcDUxhtjRBZ/
         +ClT2kOkZYklZyx7P2JA/j+HekjxcEv+6TpF8E0FVkja/m7zHy8G0zotZVMLq80zKkFc
         /siM6912QOr/3ejaDvVkkeqKVMRRzQkye9WLb8QWIZnJ7QPCouH5yZ4ts9mRwgrhGsXk
         xyWFD+5eskKtn+AWrcEh/XNnMTQmhOuk/nphlr5Yr6uxcFZtiJR0fWj7TNJIZT2qGdhX
         OBmAThggOEq9BLs4vRPgAXQXgbwx9E8lRJhNxItTf7xp50fxzuwZ5Jq3FKdlfSWiSbWG
         fSZQ==
X-Gm-Message-State: AFq9FYJBpS32kzfUd8tXbW4dSFjp/nz9VhCGf7iTrbeQYTVQ+uf/uNtZ
	Z3VsgCaT2+0zHU2GYYFLlpxtNQfDdq/BLv+3hVvKB5usm0IgT0pjXV4eJVC8FQC1Z1PAhTXSFJB
	61ZGxeGU8b81JCWvJKgRvgkY0KvUKwmhLZAObqCIHF9awJx2KplnHpCN/yFgJBOE8fbi2VziyhB
	CrDEu3tvSJ4ckTG+ZXs7GhEzoe4h6tQ0+QhOkRbel2jWzUDIy1ucXiXA==
X-Gm-Gg: AYBFou2yjlvOVxlQOuSOyF0x894ohWE/f0L5iOAhsNAObkgkeGfxSYHy9YYpqxtlYKr
	EXp6Ip5w+eZ/71eJ9ns81onxNqDHY7aJhgpabjvEEAV+g+hIr3QucP7F02ktBzJjbtK1bk7hXOT
	JrdeVvmdFBn5gg4+Pc8HoK/1sxCx4ECRqLLjXo0JCXc412gUqowxEM14fi2DQ7KPmBpFKaVx5wN
	gxpqdCVBzQiNp/tl77iLXjaHtFIKD/EX2IoBZpp+WMr/L6Gi1H/wRbJ/2wQUc2pUq+cZNVTijLd
	MWcAL/HGQdJz7582MB9RnkdSWUARRXAdaCL0iL9AhS3LlGG7N1tthw2DyPvnf+O1BCcrf2O4nTR
	+LSFBX5O+Go+h9QmHWC2JqfRZ+Qis5/ruB0TA5eJ1JdCFGQgtCyOtmglP/4igPCCx2D+/Z/6MuO
	ge/jQmF+cq
X-Received: by 2002:a05:6214:5f0a:b0:919:867b:5215 with SMTP id 6a1803df08f44-91b55334746mr52190026d6.3.1791581724311;
        Fri, 09 Oct 2026 14:35:24 -0700 (PDT)
X-Received: by 2002:a05:6214:5f0a:b0:919:867b:5215 with SMTP id 6a1803df08f44-91b55334746mr52189576d6.3.1791581723628;
        Fri, 09 Oct 2026 14:35:23 -0700 (PDT)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb (pool-173-33-204-162.cpe.net.cable.rogers.com. [173.33.204.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550e177csm28434456d6.47.2026.10.09.14.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:35:23 -0700 (PDT)
Message-ID: <c1eac67937b1f625a251e910f3b85000bf7a7504.camel@redhat.com>
Subject: Re: [PATCH 1/2] KVM: nVMX: don't check PIR.ON when processing
 nested posted interrupts
From: "mlevitsk@redhat.com" <mlevitsk@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Date: Fri, 09 Oct 2026 17:35:22 -0400
In-Reply-To: <sashiko-outbox-166078@kernel.org>
References: <20261009205036.672523-1-mlevitsk@redhat.com>
	 <20261009205036.672523-2-mlevitsk@redhat.com>
	 <sashiko-outbox-166078@kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tYd6eqNvXULEx0IWPtHz852ClOv4hoGFJ-YoBH-E7pE_1791581724
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-10-09 at 21:04 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] kvm: spurious vector 255 injected due to TOCTOU race in PIR upda=
te
> - [High] KVM: nVMX: missing compiler barrier after pi_clear_on() leads to=
 lost L2 interrupts
> --
>=20
> commit 3c2cccabb927f653f71a7a79b1d1600d4fb5f728
> Author: Maxim Levitsky <mlevitsk@redhat.com>
>=20
> =C2=A0=C2=A0=C2=A0 KVM: nVMX: don't check PIR.ON when processing nested p=
osted interrupts
>=20
> This commit modifies nested posted interrupt processing to no longer requ=
ire
> the PIR.ON bit to be set. It achieves this by replacing the conditional
> pi_test_and_clear_on() check with a direct pi_clear_on() call.
>=20
> > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > index ddf6df7bee93b..11362aad2bc8a 100644
> > --- a/arch/x86/kvm/vmx/nested.c
> > +++ b/arch/x86/kvm/vmx/nested.c
> > @@ -4033,8 +4033,11 @@ static int vmx_complete_nested_posted_interrupt(=
struct kvm_vcpu *vcpu)
> > =C2=A0
> > =C2=A0=09vmx->nested.pi_pending =3D false;
> > =C2=A0
> > -=09if (!pi_test_and_clear_on(vmx->nested.pi_desc))
> > -=09=09return 0;
> > +=09/*
> > +=09 * Don't test the value of PID.ON.
> > +=09 * It is valid to trigger a posted interrupt without setting this b=
it
> > +=09 */
> > +=09pi_clear_on(vmx->nested.pi_desc);
>=20
> [Severity: High]
> Does this change introduce a missing compiler barrier that could result
> in lost L2 interrupts?

>=20
> Replacing pi_test_and_clear_on() (which uses test_and_clear_bit(),
> providing a full memory and compiler barrier) with pi_clear_on() (which
> uses clear_bit()) removes the implicit compiler barrier. On x86,
> clear_bit() uses inline assembly without a memory clobber, providing
> no compiler barrier.

Yes, this makes sense, I will fix.

>=20
> Without an explicit smp_mb__after_atomic(), could the compiler reorder th=
e
> earlier vmx->nested.pi_pending =3D false store to after the ON bit is
> cleared?
>=20
> If reordered, the CPU could execute the PIR read inside
> pi_find_highest_vector() before committing the pi_pending =3D false store=
.
> If a concurrent software IPI triggers
> vmx_deliver_nested_posted_interrupt() on another CPU during this window:
>=20
> - It will set the new PIR bit.
> - It will set the ON bit.
> - It will assert vmx->nested.pi_pending =3D true.
>=20
> The delayed pi_pending =3D false store would then silently overwrite the
> concurrent true signal. Since the PIR was already read prior to the new
> bit being set, KVM would miss and permanently lose the interrupt.
>=20
> > =C2=A0
> > =C2=A0=09max_irr =3D pi_find_highest_vector(vmx->nested.pi_desc);
> > =C2=A0=09if (max_irr > 0) {
>=20
> [ ... ]
>=20
> > =C2=A0=09=09__kvm_apic_update_irr(vmx->nested.pi_desc->pir,
> > =C2=A0=09=09=09vapic_page, &max_irr);
> > =C2=A0=09=09status =3D vmcs_read16(GUEST_INTR_STATUS);
> > =C2=A0=09=09if ((u8)max_irr > ((u8)status & 0xff)) {
> > =C2=A0=09=09=09status &=3D ~0xff;
> > =C2=A0=09=09=09status |=3D (u8)max_irr;
> > =C2=A0=09=09=09vmcs_write16(GUEST_INTR_STATUS, status);
> > =C2=A0=09=09}
>=20
> [Severity: High]
> Could this execution path erroneously inject a spurious interrupt vector
> 255 into the L2 guest?
>=20
> By removing the pi_test_and_clear_on() gate, the code now unconditionally
> falls through to __kvm_apic_update_irr() whenever max_irr > 0 and
> pi_pending is true.

This is true regardless if ON is set or not, guest can do the same with ON =
bit set.

>=20
> If an L1 guest concurrently modifies its PIR/IRR memory structures during
> L2 posted interrupt processing, clearing the PIR and IRR in guest memory,
> __kvm_apic_update_irr() can update max_irr to -1.
>=20
> When max_irr is -1, the code subsequently casts it to u8:
> ((u8)(-1) =3D=3D 255)
>=20
> Since 255 is typically greater than the current RVI, KVM would write 255
> to GUEST_INTR_STATUS. Can this cause L2 guest crashes or undefined
> behavior by injecting vector 255?

I guess if the L1 corrupts PIR and that crashes L2, it gets to keep the bot=
h pieces.
However here could be a pre-existing bug, I'll take a look later.

Best regards,
=09Maxim Levitsky

