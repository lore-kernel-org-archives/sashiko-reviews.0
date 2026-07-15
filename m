Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641C7322B9F
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 13:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123542; cv=none; b=n+nexJXa1DCJMqGEoYBdDXYqhfTZoDsBHnxD12+Zww94WEI/yaSrGSm3rhN90ivtFuQ5iWXELfxPTHCYjXABPjYypmkmAknhP0PbxQOX5t3VaED/t2cRczxj+wzvZ44ye4Te+B+6gazdfBF5eWBcpHFTtuJRuA9ZRoA63XYtm2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123542; c=relaxed/simple;
	bh=FW104Yn0vU4ziR3QiwwF/Tc3uTUX6RTtPXAjGc7bIcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFQ6mvAmdN1IRdTIGCrTHrF/3vBt1ixwyUZ/fd4gMH3qO34HscEp4Z0UUaSCH5GtvK04HjODa3DKs4u4OdI7nJl38uwvXrBw5I2C+8HEgHeJrOE2Xx2jEjuU5D6pcf77zpavAPbRscdAyxOt5s60pw45EeuwrrHaPUkHmmovmfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ij2YCYZr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ij2YCYZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784123540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wEQR9a2ZwOoKfO74/7iDwCv+D8Y4eljlpUTeLzkGT4k=;
	b=Ij2YCYZrQ3S1OeBXt2yf0d9YhLiWAc3McdyIR0gt6zjBX7dy+ZWBCK4BJwe4JNc4ibV0g9
	EE2eb/JSkH5jidlttY+LV2FxXYy291ofMt8y7lE1B02IzMVCIgXXwlMS3Fqv6L4TiklNVg
	OQFZN4vj6wj+Edm6eia2oWlZ+jAW4oA=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-v2_hvZDrO_qyiRiLuNVw4g-1; Wed, 15 Jul 2026 09:52:15 -0400
X-MC-Unique: v2_hvZDrO_qyiRiLuNVw4g-1
X-Mimecast-MFC-AGG-ID: v2_hvZDrO_qyiRiLuNVw4g_1784123534
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88da04b719so2049443a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 06:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123534; x=1784728334;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEQR9a2ZwOoKfO74/7iDwCv+D8Y4eljlpUTeLzkGT4k=;
        b=SZqKKCwS+W4VXNq1rEJJigprivdCvE/2KWyNPJ/8KpKLtlxG2nDy0WnKf9DjIJUt/3
         g7F8xHraF/KUHnwN5JsSRTHkutSTeWK0D/FX1eS0RvBkq+LVpLQgr/bC9818hneztS6k
         MbTOaWzqzX0G92OzayDLdbW3PYJZoCPoTaA6fl5f1pbKQ4x99AJab8eUqrCKZ7rCMO6X
         6BMIM6kaWvAs00+67Hk03wCuIuZO2HTHoWY1S8rktAImAfrsItFi+gTE77H/M8zy0rd2
         BbRihST9r/uEpVCDlRfD7Ww0Oi2/x0jINS01L685e4rmlWsycbuIGjyr90rLcEagSWq2
         5x5Q==
X-Gm-Message-State: AOJu0YyzVXkjpJq92NI0FJkT90mey7CqQQrOYyEEsaoA7ypvvUROD86c
	i2kh9lFhLM/Ue1Wj5faC6oAqAgKM1VRU9eIKtswiMqR4kvdS/9BEfi6qniw9pNbsGBn0ZJEHN+V
	jF4pkgOcv1A5fMp7+ZPCN/gmhbYDm8t8gTJZmyZuHaZzXSOxrHXDHkALQ/60IDHTFQpKgKrmi3e
	uwekkiUBo/P8HsE0vNDtYAVKIHtLm+m6HADASXbJHaHkLnwqeXgrZVE1o=
X-Gm-Gg: AfdE7ckVvXxP/c2ACqJ372zvD6UB5GC4DD9FqRRi5Vnm8E0B2ue/F98YcMVHVKq3xX0
	8gMCQchj2AE2I+Xhv7RqEGhNrNr5eeWXrNHjCDwMqBPrd9nLI+VLNSuBpldZENPltd8jBpGITIf
	0U3AXRTwpLicDveC8PfhRqEyCT7gdUxhUmO1iWnA1WbK31Ehe73qdyjwuKciUq2hgH1sY4r+Rch
	fryFV9hL3Q6J0V07dibdZFjiw4=
X-Received: by 2002:a05:6a21:32a2:b0:3bf:9cbd:9a39 with SMTP id adf61e73a8af0-3c11076d85bmr20380466637.10.1784123533593;
        Wed, 15 Jul 2026 06:52:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a2:b0:3bf:9cbd:9a39 with SMTP id
 adf61e73a8af0-3c11076d85bmr20380437637.10.1784123533101; Wed, 15 Jul 2026
 06:52:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715124235.1444895-1-aharivel@redhat.com> <20260715124839.DCB811F000E9@smtp.kernel.org>
 <CACUOEi9wRzr2yJJiu1fAk1xYFuDu8NDbpKKzbhQ-9bZhxaKRpQ@mail.gmail.com>
In-Reply-To: <CACUOEi9wRzr2yJJiu1fAk1xYFuDu8NDbpKKzbhQ-9bZhxaKRpQ@mail.gmail.com>
From: Anthony Harivel <aharivel@redhat.com>
Date: Wed, 15 Jul 2026 15:52:02 +0200
X-Gm-Features: AUfX_mzBf6o7KTNkVIgVybdhZQDr47WvQdJ6_YsNIALK6hoAdctfeew4EC8r8T4
Message-ID: <CACUOEi-0LGCh0ZYnsABPb=yL9H7D4dF0gnw-gHv37gge_ZzndA@mail.gmail.com>
Subject: Re: [RFC PATCH] KVM: x86: RFC for per-VM C-state policy enforcement (KVM_CAP_CSTATE_POLICY)
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zszKnEAJbZ5OPtdOngR0_e6b0Cucv2VyshGxrldFkLw_1784123534
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review - both points are valid and I should have been
more precise in the proposed internal flow.

You're right that executing MWAIT inline in the exit handler has two
fundamental problems:

1. The VM exit clears the monitor armed state (SDM Vol 3, 27.5.5), so
a host-side MWAIT would fall through immediately as a NOP.

2. Bypassing schedule()/rcu_idle_enter() would break scheduler load
balancing and stall RCU grace periods.

The correct approach is to NOT execute MWAIT directly from the exit
handler. Instead, KVM should go through the existing kvm_vcpu_halt()
path ( which already handles scheduler and RCU correctly ) but enforce
a per-VM ceiling on the C-state the host cpuidle governor is allowed
to select.

So the refined flow becomes:

```
Guest issues MWAIT with C-state hint
    -> VM exit (MWAIT exiting =3D 1)
    -> KVM reads per-VM max_cstate from struct kvm
    -> enter kvm_vcpu_halt() with max_cstate constraint
    -> host cpuidle governor selects C-state <=3D max_cstate
    -> schedule() / rcu_idle_enter() as normal
```

The enforcement point moves from "execute a capped MWAIT" to
"constrain cpuidle state selection within the existing halt path."

I'll update the RFC with the corrected internal flow.

Anthony


On Wed, Jul 15, 2026 at 3:44=E2=80=AFPM Anthony Harivel <aharivel@redhat.co=
m> wrote:
>
> Thanks for the review - both points are valid and I should have been more=
 precise in the proposed internal flow.
>
> You're right that executing MWAIT inline in the exit handler has two fund=
amental problems:
>
> 1. The VM exit clears the monitor armed state (SDM Vol 3, 27.5.5), so a h=
ost-side MWAIT would fall through immediately as a NOP.
>
> 2. Bypassing schedule()/rcu_idle_enter() would break scheduler load balan=
cing and stall RCU grace periods.
>
> The correct approach is to NOT execute MWAIT directly from the exit handl=
er. Instead, KVM should go through the existing kvm_vcpu_halt() path ( whic=
h already handles scheduler and RCU correctly ) but enforce a per-VM ceilin=
g on the C-state the host cpuidle governor is allowed to select.
>
> So the refined flow becomes:
>
> ```
> Guest issues MWAIT with C-state hint
>     -> VM exit (MWAIT exiting =3D 1)
>     -> KVM reads per-VM max_cstate from struct kvm
>     -> enter kvm_vcpu_halt() with max_cstate constraint
>     -> host cpuidle governor selects C-state <=3D max_cstate
>     -> schedule() / rcu_idle_enter() as normal
> ```
>
> The enforcement point moves from "execute a capped MWAIT" to "constrain c=
puidle state selection within the existing halt path."
>
> I'll update the RFC with the corrected internal flow.
>
> Anthony
>
> On Wed, Jul 15, 2026 at 2:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
>> - [High] VM-Exits clear the CPU's monitor event pending flag, causing ho=
st-side MWAIT to immediately fall through (NOP).
>> - [High] Executing MWAIT synchronously within the KVM exit handler viola=
tes Linux scheduler and RCU invariants.
>> --
>>
>> --- Patch [1]: [RFC PATCH] KVM: x86: RFC for per-VM C-state policy enfor=
cement (KVM_CAP_CSTATE_POLICY) ---
>> commit ba053ea08a3b49a2e72662168226ef280171ed4d
>> Author: Anthony Harivel <aharivel@redhat.com>
>>
>> KVM: x86: RFC for per-VM C-state policy enforcement (KVM_CAP_CSTATE_POLI=
CY)
>>
>> This RFC proposes KVM_CAP_CSTATE_POLICY, a new VM-scoped capability
>> that lets the host set a per-VM maximum C-state ceiling. When active,
>> KVM intercepts MWAIT, inspects the requested C-state, and enforces
>> the ceiling by executing a capped MWAIT on behalf of the guest.
>>
>> > diff --git a/rfc/KVM_CAP_CSTATE_POLICY.txt b/rfc/KVM_CAP_CSTATE_POLICY=
.txt
>> > new file mode 100644
>> > index 0000000000000..15439e6e7ebbf
>> > --- /dev/null
>> > +++ b/rfc/KVM_CAP_CSTATE_POLICY.txt
>>
>> [ ... ]
>>
>> > @@ -60,18 +60,18 @@
>> >  3. Internal flow
>> >  ----------------
>> >
>> >  When max_cstate >=3D 0 (policy active):
>> >
>> >    1. VMCS "MWAIT exiting" =3D 1 (intercept MWAIT).
>> >    2. On VM exit for MWAIT:
>> >       a. Extract the C-state hint from the MWAIT operand.
>> >       b. Map the hint to a logical C-state level (MWAIT sub-states
>> >          are CPU-family-specific; a translation table is needed).
>> >       c. If requested_cstate <=3D max_cstate: execute native MWAIT wit=
h
>> >          the guest's original hint.
>> >       d. If requested_cstate > max_cstate: execute MWAIT with the
>> >          capped hint, or return to guest immediately (C0).
>>
>> [Severity: High]
>> Does executing native MWAIT on the host side work as intended here?
>>
>> According to the Intel SDM (Vol 3, 27.5.5 Updates to Non-Register State)=
,
>> a VM-Exit unconditionally clears the state of the monitor hardware.
>>
>> Since the state established by the guest's preceding MONITOR instruction
>> is wiped out by the VM-Exit, won't the subsequent host-side MWAIT find n=
o
>> armed monitor and immediately fall through as a NOP, resulting in a busy
>> wait loop instead of entering an idle power state?
>>
>> [Severity: High]
>> If we execute MWAIT synchronously within the KVM exit handler, how does
>> this interact with the Linux scheduler and RCU?
>>
>> If the CPU successfully enters a deep sleep state via an inline host
>> MWAIT, it seems the KVM vCPU thread would remain in the TASK_RUNNING
>> state without yielding via schedule() or notifying RCU via
>> rcu_idle_enter().
>>
>> Could this hide the CPU's true idle status from the scheduler, break loa=
d
>> balancing, and stall RCU grace periods by bypassing the host cpuidle
>> framework?
>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715124235.1=
444895-1-aharivel@redhat.com?part=3D1
>>

