Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC483E0245
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 23:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539968; cv=none; b=ldXr8v1djad12D5KaNcQCuUk2+MO9/LpC/KRRcBStOPz3IUTGl3qa0VlJ3nVj4ghglsuiBWBfXLaAJKA7vOHRWEy30tlkI2yvA64JZC0siyWZlwWvesUsUo+1gYfuanyPv+Rpy24sxUqYp4ri22Et7PpfyH5hlwiK3sJLb/4pQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539968; c=relaxed/simple;
	bh=MPhtSNdp259YwbhvdnYEIywaz8He+z1aY2Qu+Ib99/4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oc1actBS2Q6Pzk2+tA8OwYTso63ms9hv6ThBRB5haqXma+01QDAZ7G3fcoeCKUMBF/Xuw2vXnIUKaeEq60Tlu4p7Vukuz4rHgh6pJsXyQNeWBJ2K5+MI3GGX1O1oNtMPjVqLaqsn6pxr7JOcS7LBU9ypFOXnsnzcIO2sfnB7v1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G29dEYuV; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G29dEYuV"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c1c4715cf0eso163176466b.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 16:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785539964; x=1786144764; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aZvj0EqkYnWsWC4m/hseqMhPvArHO1cIvq/DRulioko=;
        b=G29dEYuVHXLD8VOb9dKOa2RS0napVDw6tmgWMhFqQBKBgQrFKGA8P6R9D1HWYzny+T
         A4M26h7j6Kic05ZYEOYVpuZgatnaq5JHVe4EkMHwXIlhxTvF6EXA8YVTmxvLKz4PrWhu
         xMNokqUhmngDvheUkHMKPdouCMHTJkv+USdtUIlili/ELV78NhAI0AAkpjD0K2jgrCJG
         9VSrKDQaKIaRirpNo4vGwtITFTVnZO3ZUF441erlVK/E9ujUag7khKZlr+95oKam8jmX
         YbgE3I2y3sEJGMBpvWG4vjOnbvyjxR0hdWtyS2XIzOmeiyD5TShGHNW/a0JHka8sLOkw
         VVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785539964; x=1786144764;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZvj0EqkYnWsWC4m/hseqMhPvArHO1cIvq/DRulioko=;
        b=TX2e1YBYNict/Xm0qUT16sJRfYVTwXtpK0xW+9eB15HXND3QiQgDuS8Lxn0C/qZv3e
         ZEhuwK4Uc4tOhTFtah+/fwVC9akst6neI/6V8T2smEyiAWAC0k/2VusF+0AaTGC/COb4
         /lV08PpLumLwqm/cmK/pSxaJkYJl6O8ox7xQYgnTKpJ8L4rmwv5p5Zp42gfgWA+RIqII
         RuEzZd2zDgiJ5aiGMLaY7niJk2Nuq9VazXe7FVM9rUZ+ZUSwe7lw5rS6yzujBgOSkxWF
         TK0PYb2H+ZQUiC09hUlBXmq6oeLBHBW/kF1TAt0zHS7V8i6/4kj+6F3XM2CMBM7N1HNT
         CVxA==
X-Forwarded-Encrypted: i=1; AHgh+RqwZWFCyyQr3a481rDzl9wgroy6zNemSAKxUDdOzsKhyusJ8y4XHE7g4C6qBoDmVy7uhlMIVjXZBAp0oTYK5w4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpM93YbZmD/kjJ8X69BNzcaeGeJaOo9Qi4ANjkgbasnk9DPs6V
	pFiO6AkxCNYLKZnlDGB/08FDdthM5ClgH/2Af8WY9luiQDuy/QVAlshgyVC5goYUPNUpJ++iKRJ
	UflbLF7lcaUyeqlL7Cg==
X-Received: from ejjt19.prod.google.com ([2002:a17:906:6093:b0:c1c:4c42:d190])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:b79a:b0:c15:b869:e64a with SMTP id a640c23a62f3a-c1fe82ea2d5mr65497866b.56.1785539963663;
 Fri, 31 Jul 2026 16:19:23 -0700 (PDT)
Date: Fri, 31 Jul 2026 23:19:22 +0000
In-Reply-To: <CANghDUUFrGN3CiJmRhQS0jtDwNnoWbKv490E=UxDXGgKsy6m7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260716230411.2767394-1-tarunsahu@google.com>
 <20260716230411.2767394-5-tarunsahu@google.com> <20260717025913.067B41F000E9@smtp.kernel.org>
 <CANghDUUFrGN3CiJmRhQS0jtDwNnoWbKv490E=UxDXGgKsy6m7A@mail.gmail.com>
Message-ID: <9huzpl02px1h.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v19 4/7] driver core: do not always lock parent in shutdown
From: tarunsahu@google.com
To: David Jeffery <dhjeffery@gmail.com>, sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

David Jeffery <dhjeffery@gmail.com> writes:

> On Thu, Jul 16, 2026 at 10:59=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
>>
>> New issues:
>> - [High] Unprotected read of dev->parent introduces a Use-After-Free rac=
e with device_move() during reference acquisition.
>>
>> Pre-existing issues:
>> - [High] Dropping and re-acquiring device_lock(dev) allows dev->parent t=
o change, resulting in locking an obsolete parent.
>
> We could add additional locking around device_move to exclude moves
> during these times to quiet both the AI tool's concerns. However, both
> these concerns are already not possible in reality. The only user of
> need_parent_lock in the kernel which will use this code path is usb
> devices, and none of the rare devices which use device_move will move
> a usb device which has need_parent_lock set. Thus, there is no actual
> device_move which can cause these conditions the AI tool complains
> about.
>
> The AI tool is finding a non-existent issue by applying a very
> specific special state as a general condition. If really wanted, I
> could add a patch which locks out moves during these times as a form
> of future-proofing, but from my view of the code all it would be doing
> is creating additional code and complexity to the driver core while
> currently fixing nothing.
>

I agree, it is very special case. device_move is associated with virtual
devices only and need_parent_lock is used with phsyical bus (Only with
USB) to prevent port reset during device probe/unbind. Even in future,
I dont see a need where a virtual device using device_move will need
need_parent_lock ever.

But I suggest, We can add the comment like:

/*
 * device_move() should not be used on devices with need_parent_lock
 * set, as concurrent reparenting during device_shutdown() introduces
 * a potential race when locking the parent device.
 */

WDYT?

~Tarun


>> --
>>
>> --- Patch [4]: [PATCH v19 4/7] driver core: do not always lock parent in=
 shutdown ---
>> commit 6be56e5bea0fe214a5199c9f806c49e62e60127f
>> Author: David Jeffery <djeffery@redhat.com>
>>
>> driver core: do not always lock parent in shutdown
>>
>> This patch modifies the device shutdown process to only lock a parent de=
vice
>> if it is strictly needed, rather than unconditionally. It also defers
>> acquiring a reference to the parent device until the point where the par=
ent
>> needs to be locked.
>>
>> > diff --git a/drivers/base/core.c b/drivers/base/core.c
>> > index 82a7af1f3ba2e..31f95e86856e0 100644
>> > --- a/drivers/base/core.c
>> > +++ b/drivers/base/core.c
>>
>> [ ... ]
>>
>> > @@ -4925,12 +4921,32 @@ static void shutdown_one_device(struct device =
*dev)
>> >  static void shutdown_one_device(struct device *dev)
>> >  {
>> > +     struct device *parent;
>> > +
>> > +     device_lock(dev);
>> > +
>> > +     /* use parent lock if needed to avoid race with probe/release */
>> > +     if (dev->bus && dev->bus->need_parent_lock && dev->p && !dev->p-=
>dead &&
>> > +         (parent =3D get_device(dev->parent))) {
>>
>> [Severity: High]
>> Does moving the parent reference acquisition out of the list_lock critic=
al
>> section introduce a race condition where the parent could be freed?
>>
>> In device_shutdown(), get_device(dev->parent) was previously called whil=
e
>> holding devices_kset->list_lock. Now that it is evaluated locklessly in
>> shutdown_one_device():
>>
>> CPU1
>> shutdown_one_device()
>>     evaluates dev->parent, but is preempted before get_device() is calle=
d
>>
>> CPU2
>> device_move()
>>     changes dev->parent and calls put_device(old_parent)
>>     dropping the last reference and freeing the memory
>>
>> When CPU1 resumes, could it pass the freed pointer into get_device() and
>> dereference it?
>>
>> > +             /* the parent lock needs to be acquired first, so re-loc=
k */
>> > +             device_unlock(dev);
>> > +
>> > +             device_lock(parent);
>> > +             device_lock(dev);
>> > +
>> > +             __shutdown_one_device(dev);
>>
>> [Severity: High]
>> This is a pre-existing issue, but does dropping and re-acquiring the dev=
ice
>> lock here allow the topology to change?
>>
>> If a concurrent device_move() reparents the device while device_lock(dev=
)
>> is dropped, it appears we might lock the obsolete parent. When we re-loc=
k
>> dev and call __shutdown_one_device(), we haven't verified that dev->pare=
nt
>> still matches the locked parent.
>>
>> Could this defeat the need_parent_lock synchronization and allow a
>> concurrent probe or release on the new parent to race with the shutdown?
>>
>> > +             device_unlock(dev);
>> >               device_unlock(parent);
>> > +             put_device(parent);
>> > +     } else {
>> > +             __shutdown_one_device(dev);
>> > +             device_unlock(dev);
>> > +     }
>> >
>> >       put_device(dev);
>> >  }
>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716230411.2=
767394-1-tarunsahu@google.com?part=3D4
>>
