Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EB7432E62
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113889; cv=pass; b=I6KCqfqjTzPViBtuWqqO48VqTbSDaj/0rMHlgDHFwAl6wko/nm3be28jdNaDftKfSs0ZIN8rEMgSOfMRVltaH9hPtsVkwehKIPfoFSKWeKzgBBr/4En5A4WJ8Y5ouYpPHebXD9XyhxmO954yxvigbfEW+286MG9Xk/xHsXwHedQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113889; c=relaxed/simple;
	bh=pw0VlWhAo+fb4k7qpjT4ZOrIw0oytN8I6SWR8Kn8BVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjGbabnTF/P1dQXq6oO0ehLLRDWqeNEgkkyRtZwHoKMnFBM3A656XK7ty9VVgKuP8EfZNUWEgcNH9dyQ7kroHUyM3eqnto2iIjoTZVa4q/TMF63SgjkvUPbyO6+ikUr53NUKyI7GUeEJHr63WOAzhCwHWxkAU+lncMdj9iQfrNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJWEZw1N; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJWEZw1N"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9030f8ea3b3so46303446d6.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 04:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784113887; cv=none;
        d=google.com; s=arc-20260327;
        b=V5aE6wlAA6LgSBOi1i9e9NfJIIeuel4GJ5hQTd5PxOvY4CTU1P7P4U3m+RuDu/qNem
         gZg3rUrpGCXxtB67maGN3aGYXeOw2dQuZnBB4y7C2qEtO58T0YIOpDT+7w6eXBdGRRqe
         n2CZstLQYiXU/4b2snmgiyh1pfl2FtoC1vc+0zc0qPRrcEnRs4C1IuGOdBYK8iTmJ3CP
         1Ofn5KYbvylJL6mdUQYiJ6FqRhnOqyI9XkO1sPDwJUgeohemhAR7ZCZv43mx6dAnKoQf
         ElaQyed05SrRv0gkZz3P0ugUXR2xkYrm4JEwerdIST0LTR6mWAtOB5NtYkedo0lGLrkZ
         rlkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=szTnsO4LxhNwbRzQB5bKuJP2l0ME8GfVemJxWYZ+tbI=;
        fh=dfvPRi+t5KvUF1qpgNVmacxvd83mvku6fE8K+/2kbH8=;
        b=CIUeAcF1QOUy9aBTUlxR/IWWiunHAk7MAmo1J8yyxtAC/fhij62UNM6GHjWr/H41yQ
         JjPDfiGk3Iwohh2YhpG9SFrVVgJfk0ZFM1JmmEBzxvRrgYBtDu4E88sCo42zNJlDPtTz
         EPppFZ/vTcc1LFAS2el6n/AHmIiq7jfL1r4mNKa0EMqb1d4hIDeiXaCiVBqLXzQ8yLsm
         brUgL0jH7Ut5bbUrE394FaVLNuCyCoWxFlz/lBtS6SrSqgnWjv93CTdL6uIpQ9vkLuC6
         hsWk/NUSpY8pcvRCsQib70vsVFuoQ0oxzcuQ9IlxZUtr5C73LoxFfgsD3N876E39bC0+
         AfsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784113887; x=1784718687; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=szTnsO4LxhNwbRzQB5bKuJP2l0ME8GfVemJxWYZ+tbI=;
        b=OJWEZw1Nj2DV9btiNTn56qCIcKMbHChzmzkO8QeLG1Qe8thTVKk/R9/9X5GdmCN/He
         q/yYst1D3zwOkQt9N7CbLdCwubifpqtxkG6fmr8/fnbjPaRizgyHJ9JAzZIE53+XLYi5
         ILGHaWrcqpriPEbIwNako//R3f16oArZZISfkRVquq3YAqYdP+9ghwM2lu4Hj7huT/up
         rEQc4cNfyEATVWdYMp0Vu5EE5WQrXGTgDSqCagm0fFWIlwCfLL5MCEHQoe3hVrDtBHPn
         aWp8x/gNy+FhPEyxibbXNajj4RCNuPz2dJjCHxNRivjTjSxUrtmXCeI+pP5jrRnRkat/
         tntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784113887; x=1784718687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szTnsO4LxhNwbRzQB5bKuJP2l0ME8GfVemJxWYZ+tbI=;
        b=Eu0JLifPmHmmkCSPKBeCygd4aewASW3idG1Uqh3s0t+dkHJzUr58mr9YQQ+1ClW9na
         reo6qpUs9VbxlApr9vKchUNaGlSmFWwHsypXT3W+YU12SKmXlVU4rkqWfj14FprpHBpT
         GOjKzWGRMDgXyc2RDSqThuTXIlZgqheSgMyIMfIn04FEu0jIEggzC1ERYrrJL5afc1Jg
         lEoSSL129u0ZiAaBGcFHR5BuGohHgybrdjHQBI4hND+Tevlxtvd40umtr/BCDmdmwzwa
         XPp4yia3R2WrFQJY6/1KDwID7kTQg58h6czwtf0k5Toum4KoS4LCxKpXq0U4LwxiYpFL
         zj9A==
X-Gm-Message-State: AOJu0YzP//koB+TvrFPp9lWYu7LxFa1C4ElzBByyK2mSuI4SkN0P8zx/
	aPsf0S15YbGoFfDkF71el8CugwS58Q27AR/VYZbv2HTqLhX/S2hToDyuU5C7grzdLJIQmWgsVFD
	7QlTu57dva1WG1hLYG7PcE7lZHCM9j3xK19Yaguw=
X-Gm-Gg: AfdE7clKdi+5n4vnA6zTDBQ2Fpm/wKfyEvYbrBuSd3uoeg8w4S4bX7R1rEivXwkKyay
	uVGh1X/ujWw2yEhNjYqKVwQGwxTHk3MNXGoOWzctO2kcV4X7qNb/ZLV9es7n24RWb9M8PSLPPzQ
	700B/kX4K1WN8gnZni5urSkJk0mSPqpg8wcm4YKbUD6rCJS4VX97WBDtTmEAkC+5hbj24zjuGE3
	IOg5sj8nj0B+WfMxb6ViYEO8uuOUEpRom6a+cacso6WPBFB27WWWRnYaPPU+3YnM7kbTsyggt4=
X-Received: by 2002:ad4:4eee:0:b0:8f0:9d9c:52c1 with SMTP id
 6a1803df08f44-90758df4b08mr23233976d6.38.1784113886944; Wed, 15 Jul 2026
 04:11:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714102640.18075-1-derekjohn.clark@gmail.com>
 <20260714102640.18075-3-derekjohn.clark@gmail.com> <20260714104459.05A741F000E9@smtp.kernel.org>
In-Reply-To: <20260714104459.05A741F000E9@smtp.kernel.org>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Wed, 15 Jul 2026 04:11:14 -0700
X-Gm-Features: AUfX_mzVZzGf1HSP1Fc-2S8G-lc1uXLUT8nmPZJ-nOhashmkn5Ec1aJOhrhjKEo
Message-ID: <CAFqHKTnhVr=FHvUAPxrgCTT8eWnn1nV9pKZoRkVbtvA4CcMDeA@mail.gmail.com>
Subject: Re: [PATCH v12 2/4] HID: hid-msi: Add M-key mapping attributes
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 3:44=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Non-atomic update of drvdata->profile_pending can overwrite conc=
urrent state changes, leading to sysfs read failures.
> - [High] Orphan ACKs from SYNC_TO_ROM commands are ignored and leave the =
`orphan_ack_pending` flag set if they arrive while waiting for a READ comma=
nd, causing the next WRITE command to time out.
> --
>
> --- Patch [2]: [PATCH v12 2/4] HID: hid-msi: Add M-key mapping attributes=
 ---
> commit 21a823af0d7845d277f06cccaf5818c1b1be1ce7
> Author: Derek J. Clark <derekjohn.clark@gmail.com>
>
> HID: hid-msi: Add M-key mapping attributes
>
> Adds attributes that allow for remapping the M-keys with up to 5 values
> when in macro mode.
>
> Link: https://patch.msgid.link/20260529072111.7565-3-derekjohn.clark@gmai=
l.com
>
> > diff --git a/drivers/hid/hid-msi.c b/drivers/hid/hid-msi.c
> > index 8a48ce099c1ca..9d3249fa50291 100644
> > --- a/drivers/hid/hid-msi.c
> > +++ b/drivers/hid/hid-msi.c
>
> [ ... ]
>
> > @@ -143,6 +327,39 @@ static int claw_gamepad_mode_event(struct claw_drv=
data *drvdata,
> >       return 0;
> >  }
> >
> > +static int claw_profile_event(struct claw_drvdata *drvdata, struct cla=
w_command_report *cmd_rep)
> > +{
> > +     enum claw_profile_ack_pending profile;
> > +     struct claw_mkey_report *mkeys;
> > +     u8 *codes, key;
> > +     int i;
> > +
> > +     scoped_guard(spinlock_irqsave, &drvdata->profile_lock)
> > +             profile =3D drvdata->profile_pending;
> > +
> > +     switch (profile) {
> > +     case CLAW_M1_PENDING:
> > +     case CLAW_M2_PENDING:
> > +             key =3D (profile =3D=3D CLAW_M1_PENDING) ? CLAW_KEY_M1 : =
CLAW_KEY_M2;
> > +             mkeys =3D (struct claw_mkey_report *)cmd_rep->data;
> > +             if (be16_to_cpu(mkeys->read_addr) !=3D drvdata->bmap_addr=
[key])
> > +                     return -EAGAIN;
> > +             codes =3D (profile =3D=3D CLAW_M1_PENDING) ? drvdata->m1_=
codes : drvdata->m2_codes;
> > +             for (i =3D 0; i < CLAW_KEYS_MAX; i++)
> > +                     codes[i] =3D (mkeys->codes[i]);
> > +             break;
> > +     default:
> > +             dev_dbg(&drvdata->hdev->dev,
> > +                     "Got profile event without changes pending from c=
ommand: %x\n",
> > +                     cmd_rep->cmd);
> > +             return -EINVAL;
> > +     }
> > +     scoped_guard(spinlock_irqsave, &drvdata->profile_lock)
> > +             drvdata->profile_pending =3D CLAW_NO_PENDING;
>
> [Severity: High]
> Can this unconditionally clearing profile_pending overwrite concurrent
> state changes?
>
> If Thread A times out waiting for M1, and Thread B starts waiting for M2
> by setting profile_pending =3D CLAW_M2_PENDING. If the delayed USB ACK
> for M1 then arrives, claw_profile_event processes it and executes:
>
>     scoped_guard(spinlock_irqsave, &drvdata->profile_lock)
>         drvdata->profile_pending =3D CLAW_NO_PENDING;
>
> Doesn't this clobber Thread B's pending M2 state, causing the M2 ACK to
> be rejected and Thread B to permanently time out?
>

This is not a possible scenario in v12. If M1 ACK is received after
profile_pending is set to CLAW_M2_PENDING it will first be checked
against the bmap_addr for the M2 button. When this check fails it will
return -EAGAIN which will soft break from the event, keeping the M2
ACK primed. If M1 was requested twice and the first times out then
this scenario could happen ass the address would match, but in that
case we're already reporting an error to dmesg and the device is
behaving out of specification.

> > +
> > +     return 0;
> > +}
> > +
> >  static int claw_raw_event(struct claw_drvdata *drvdata, struct hid_rep=
ort *report,
> >                         u8 *data, int size)
> >  {
>
> [ ... ]
>
> > @@ -171,9 +388,23 @@ static int claw_raw_event(struct claw_drvdata *drv=
data, struct hid_report *repor
> >                       complete(&drvdata->send_cmd_complete);
> >               }
> >
> > +             break;
> > +     case CLAW_COMMAND_TYPE_READ_PROFILE_ACK:
> > +             ret =3D claw_profile_event(drvdata, cmd_rep);
> > +             /* Stale address received, ignore and keep waiting */
> > +             if (ret =3D=3D -EAGAIN)
> > +                     return 0;
> > +             if (drvdata->waiting_for_ack &&
> > +                 drvdata->waiting_cmd =3D=3D CLAW_COMMAND_TYPE_READ_PR=
OFILE) {
> > +                     drvdata->cmd_status =3D ret;
> > +                     drvdata->waiting_for_ack =3D false;
> > +                     complete(&drvdata->send_cmd_complete);
> > +             }
> > +
> >               break;
> >       case CLAW_COMMAND_TYPE_ACK:
> > -             if (drvdata->waiting_cmd =3D=3D CLAW_COMMAND_TYPE_READ_GA=
MEPAD_MODE)
> > +             if (drvdata->waiting_cmd =3D=3D CLAW_COMMAND_TYPE_READ_PR=
OFILE ||
> > +                 drvdata->waiting_cmd =3D=3D CLAW_COMMAND_TYPE_READ_GA=
MEPAD_MODE)
> >                       break;
> >
> >               if (drvdata->orphan_ack_pending) {
>
> [Severity: High]
> Does this early break for READ commands permanently skip processing
> the orphan ACK?
>
> If a WRITE_PROFILE_DATA command is sent followed by a SYNC_TO_ROM
> command, orphan_ack_pending is set to true. If userspace then
> immediately issues a sysfs read, setting waiting_cmd to
> CLAW_COMMAND_TYPE_READ_PROFILE, and the generic orphan ACK arrives:
>
> claw_raw_event() will evaluate the condition above, execute the early
> break, and bypass clearing orphan_ack_pending.
>
> Later, when another write is issued, won't its real generic ACK be
> incorrectly consumed as the leftover orphan ACK, causing the new write
> to time out since its completion is never signaled?

This finding is valid. I'll refactor how this is handled to simplify
it and add an 8 or 25ms fsleep to __claw_hw_output_report() if an
orphan ACK is pending, which should provide time for the ACK to
arrive.

- Derek

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714102640.18=
075-1-derekjohn.clark@gmail.com?part=3D2
