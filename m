Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6899C13C908
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 00:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788826795; cv=pass; b=Xv+LPBp8Y0f5wxmf6bbDqDNDtMWzhHWcI1CeON8bEtUbppF8zD2w7YMBm0GN75+v1atx3dUQTxlLBdbZG6iX2OANEfcU/ih5dzHix5lSeuV7BCB2qEh1FqwJLB0TbIFrjU/zeMe9kxhCHtJKXQGq95K3JNlSIL4Y70d1KsIMo10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788826795; c=relaxed/simple;
	bh=Q8k4JBwkn9qj97tJmtIvdRGBltVIRsnJA54YWSJ8ygQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIFHP8Rphzu+axrJF+0RNyWzBzM5tYSAm4m2HJ2cFgV+FY8gdc1yyyN98Yl45W4OkQX7DcEI3ETCLj05WGDhTUWktTOZQQA7KvQH8K7ArU2BoGASfIokjiBBSBpu1PBJ98EGsZoJLNvH9KzdsYWRESz+0OlypbF/u/y/egoUfGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSetbrNw; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSetbrNw"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8535a9be75eso2958037b3a.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 17:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788826794; cv=none;
        d=google.com; s=arc-20260327;
        b=YLLRzgN6egcJCf3hCOIzqFSPjujRhipX+Q1QKdQASK3dFfvEuL9FonKVLTSA+GL8oO
         1XGMe/2WInwb0FUZTrepjMmnQ8sonx3qz6vbLfkPmTMzK9Q+7g5m0iJPQFHKsEKiTHwz
         wy8q9RbsrIr5G4diLtdE0nFZPnS50X5cRdS/as8VklBWkuulM26kH3f56DeAe38LdEvo
         iQEqOAzRRxs+XvaM+lZw9MsgOXdo4n1p1ZhJy6sI6xfF/fsrazcz5qLt031yQod0y4IL
         dMa1HBQDUhUfnzOiPqJcdbTpKP26azCZR68+aKVDFJMOlfpZzQlnuSYJpaBz2RD1Mt8w
         X6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aRhPX2DkqiPbS5/gszpBUQmRnfwNaa4WG41QYbV4fTg=;
        fh=AOLefe9U5j60LDSuPVgeRd+h39TddQykec4Vv+wU5oM=;
        b=iMap/pG8PzH4UiEyKrBURGvIUy0/Xe2fB1FNSXZAhTNq/69zgunzUAuzQrJZCXTxfW
         q+67rEP+J+z4X2F1qvSu3LASypp6SETFTdXm5Exc8bNTdTweqsOhx8qlzEK+AvOAjZdL
         guam/pciN9w/ssVtZmdZmpk2fw1zQZISZpLV6021NV33XLXBnCS0DZ+d1iHq5DlePsYV
         vE8SeQDNkx+ATjoJU6RvOxVgYdTEsk2U3g299BNLqmBlL1Au+DU65hp6JwTCYoFZfrqT
         pioHAmcW8XUkCwHiL+DBqODa8AaCiwenzWbRyWNF7jSIqujt+DBt5MdnsYUOXQh4H7Q0
         K83A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788826794; x=1789431594; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aRhPX2DkqiPbS5/gszpBUQmRnfwNaa4WG41QYbV4fTg=;
        b=QSetbrNwpSdXeNn5+FWioBSzS57aGXBnnGve17c3zKb3eXLvW3vY7Hs9bzsedT5pZq
         79m0hKfGdLbtK5Q/fuGY1i4HWP9ixiGXS9WSPeLJUJ/uTQQc+0SqKAabaGWplhyiMBEo
         UF2xXM+F6ZN+v2pmnwQRTF0Sh2KlEmLQbBOjaDeCA7QBtMSiHhS99JkpwK82z+YgjbHU
         /48QzQldlV22NvXLGlck2E1ZAFgtGrwKBR7mRZPhMKKWUmoSwXrPxXcnXn8z5SG8c1oT
         0TQUq7VUd0k+l2Mjcbuu8BRcQ4sCiKXavVDuN2Ffek0lCpM/Yrk/nOGUdBvyM26zih2t
         UT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788826794; x=1789431594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRhPX2DkqiPbS5/gszpBUQmRnfwNaa4WG41QYbV4fTg=;
        b=IPH1gtLMSc4ogH/609U5o59u9G+zaiKzrEul4NepvXEFl8G2QK65jq2L8U98/sYC6S
         ZtUzjSk5lY8fZcQjrWSHwboJuPVIBZif7cKEIzN3FIhysDObOpxm02mRefqMhrWlDEd+
         oXZCUcj1movRm+Fkx6SnrcKRqMcxCjpVMU8O+4PA2vc/DbbJoq4yapRBV/GAyPFWZ5xh
         NZP10q642//hIQdevnqpZYvCbJAwRWmoXk66lphn645qTZUdwZVS/Ug/WDhn2kZLrgP8
         VnD5pJLPvqodmPf9VryfewgTtVLcuhMYdmCOva4bYQMN/uD+droqdEMZsxWizqhLKGQ4
         LwPw==
X-Gm-Message-State: AFuF++nL52uNJER2pbG+LgPFwt+D+tAJMGGO8ydE3xDTxuyLP0mJoTRq
	VJWXoB6NXNzqZLf2bTCPHJ1cVnA7Itm/ATBfVyqfzSPY2wR3Op8OojgUYVWCorNHVt9uHCZwFm7
	F1nzPi30MgvjPd1stQordjs5cJmIny88=
X-Gm-Gg: AYBFou0y8bwh2NsvTWJGW4r2j01FoUZY18dyND0nZ46ltiVg7MqgIiNvGAmB8oJxh2W
	p1a70HBCo2YC9B7HFyJC/ZM0z6P/hIWP4+HnX7POyDvvctk4qyBst+FPZ62wwakEUFtiZd/EFaO
	CCukyTHZOCJAFil+0hOfhaF/S4/Hoau5DJeY7AXiedTianZFdI/GI7PJ0ZTIyUeJlaOiqZMRVK3
	n6g4ragRwcDHlxBDQaVMgvVySLI6Og69rOwJdVPsnyWr299OQH1Q4tvC3jUx0yIy5VXRYnEuKIl
	GtY8SR+jYZPPDfzTeokRgCApFnGm+VQewuzBu7iuBxX4c4waLCWt8KKCRfKrGfOzNPoHDwxQTBi
	h3DmoxVJqK72IHuJnh6JWIytaax84
X-Received: by 2002:a05:6a00:2d81:b0:842:7296:dba with SMTP id
 d2e1a72fcca58-86166bc04cemr33898479b3a.7.1788826793606; Mon, 07 Sep 2026
 17:19:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907134552.1772405-1-puranjay@kernel.org> <20260907134552.1772405-2-puranjay@kernel.org>
 <20260907140642.B02581F00A3A@smtp.kernel.org> <CANk7y0j33fmyQyTvL37Tx6Ua_bGfT5n_=Smw44u_H7G6rMcr_Q@mail.gmail.com>
In-Reply-To: <CANk7y0j33fmyQyTvL37Tx6Ua_bGfT5n_=Smw44u_H7G6rMcr_Q@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 7 Sep 2026 17:19:40 -0700
X-Gm-Features: AcwNN1UDzjWhlQqa_zuA9xBANyMEKplEHlSnjEttoFs_1HeOjm_Le8Sd_yIyMX0
Message-ID: <CAADnVQLeCzCAF1Ku2Ri=PUfespAKPMEO_qQLJ1XEhAtLERgeBA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/4] bpf: Add bpf_call_rcu() kfunc
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 7:39=E2=80=AFAM Puranjay Mohan <puranjay12@gmail.com=
> wrote:
>
> On Mon, Sep 7, 2026 at 3:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] Calling `bpf_call_rcu` from NMI context causes a raw spinlock =
deadlock because `call_rcu()` is not NMI-safe.
> > --
> >
> > commit 3385037afe11a72dffbb6db99b4174626596c231
> > Author: Puranjay Mohan <puranjay@kernel.org>
> >
> > bpf: Add bpf_call_rcu() kfunc
> >
> > This commit adds a new bpf_call_rcu kfunc that allows BPF programs to d=
efer
> > operations using RCU grace periods.
> >
> > > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > > --- a/kernel/bpf/helpers.c
> > > +++ b/kernel/bpf/helpers.c
> > [ ... ]
> > > +__bpf_kfunc int bpf_call_rcu(struct bpf_rcu_head *rh, void *map__con=
st_map,
> > > +                          bpf_rcu_callback_t callback, struct bpf_pr=
og_aux *aux)
> > > +{
> > [ ... ]
> > > +     rhk->callback_fn =3D (bpf_callback_t)(void *)callback;
> > > +     rhk->map =3D map;
> > > +     rhk->prog =3D prog;
> > > +     call_rcu(&rhk->rcu, bpf_rcu_run_callback);
> >
> > [Severity: High]
> > Does this code risk a raw spinlock deadlock if called from an NMI conte=
xt?
> >
> > Because bpf_call_rcu is exposed to tracing programs, it can be invoked =
from
> > NMI contexts, such as when a tracing program is attached to a perf even=
t.
> > However, call_rcu acquires rcu_node raw spinlocks and is not NMI-safe. =
If
> > the NMI interrupts a path that already holds the same rcu_node lock, th=
e
> > system will attempt to re-acquire the lock, resulting in a deadlock.
> >
> > Should the verifier restrict this kfunc from being called in NMI contex=
ts,
> > similar to how it uses btf_record_has_nmi_unsafe_fields for bpf_obj_dro=
p?
>
> This set is supposed to land after the rcu changes that allow call_rcu
> to work from NMI have landed. Please see the cover letter for the link
> to that patchset.

The patch would need to be updated as s/call_rcu/call_rcu_nolock/ ?
or more will be required?
If the former then we can land it now.

Also notice how your LLM doesn't know about your earlier work ;)
+ rcu_read_lock();
+ migrate_disable();

that should have been ...

pw-bot: cr
