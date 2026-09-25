Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37080422E3E
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 06:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319207; cv=pass; b=r3u/Ub9MjqBz2fhLxTjA5diRLucXcsXkFJnoIJB6BuCglz6pPqztlOoVypxpy2xgHIOSZ98d+bMRzfh3KM14cMA2mRWIApElkK3Qq7TUjdkp47tCm9JZP0UawEbpycWQiIxV3BRgGTaoZYU5+j+jCisMr01VlerSTbb+aPo40aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319207; c=relaxed/simple;
	bh=BFIkCiMN6Y1LoKTLebJzQG3e63+7y153xXWK22vEVw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/LwLt+Jq6t180EltW2EzuhpaY/NIElhRi9UOtPC5UmJJg757Zhi5fHwm7KjZnLC0g4imqtDABCRK5QS/h1E1UVFnS8iO5OyAwFebhJKsN4QhWg/5kyI60zCZ3C2GK6TmgNnTodziCWxZMB5rjDClG84LDVOYw+Ficu/8a0EN90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZ6xOUns; arc=pass smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZ6xOUns"
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-7fccd4c3f36so541502a34.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 23:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790319200; cv=none;
        d=google.com; s=arc-20260327;
        b=YgZHIdyZCX10dUfTUZfiY2pfyE3Lh/McOitxe+YnNTuAoGwR9VzKdydSXGICxyGFHC
         Vct4PJsQvnta2ZcP2igYJNV+dAE7OatVcoNBLSUd6iC47dFe+rAAMLcg8enWpjrTbgDs
         yQQvLYWgC47JjM/mNRH9Bs+yUi2czNl6Et6RfcZ0URViHSPQw6p2dgSq9nozk6/kvRit
         B0MnCxurF/zxQyw+MYC/3g2wsH5bGoxli9jaKn3ECzuPjgVgPzHZnZjIU/DZtN9vM+A8
         bkfGL0ht6egsTIsDJ8tKWy1+daTYG94+4xPACOH9M+Wg1vAfcF9yS6eSy5madH9mS4Jb
         TJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LD4caPae1oVXrCq1fFq8mP/1u249QbSVdZngF71A038=;
        fh=gj73vF7gfHpskuYo4ZPaNGDMo9r8lFxbvv5q5QAWYg8=;
        b=r1NkBNbFv5l1qZorepvO0s8BBsbPsyp3iBfYBykwSxyHYH5yHwAsdG1pmFVXy7/6hP
         mY3bprG9p8O6c6G0due0g1KfqdAHxAnktNrcWLGotY4ttDfHVCLf/pUeNCfExnzKSTzP
         85ZLCJTH60abnBa2jzJVXu2HBgTF+V4/Uwi5hulQhgRMw/rjj3+kEhWAbq7qd0wLgoaz
         RxvFEmJ+aUvMnERKcS5GTnD+I4a5Y2FXyvM9tCTL+prfz4QK5diTV57jfpGzdCHW1mbl
         Dn8UTn5esBswN95+DUNoUrYajaLzhOhAi42EOvAb1YnXSOAV3C5mRZlpQ4QhFHQz4Zu8
         QTgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790319200; x=1790924000; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LD4caPae1oVXrCq1fFq8mP/1u249QbSVdZngF71A038=;
        b=WZ6xOUnsS99sFSSDVpw+QZitHMV1WP7av+9J41YnNEPOi7Zf5p47TOJGXUV48wA7Lw
         rbGKF1z16KXZwim1N8xUr4ub75c7B5V9lL+4j/wDSMhJRzTJhbnCUEbu0NMYqLhL6j6+
         Qg6nw1R2NolHKYVU6hmqBkTejmksVxgZfCHAaH8fv/Q753Xv5myOoyVnYR3PLQjsA7+A
         aT8HROL9cnMWz9yLTa95YJ0p5amtF2TZiN6MAx7BAC0t4G3dgrJF0l5VvHnjj7ur8XLY
         +yhtkFSvJtNq2Cl6Mv5cE/ZTmIvCcWpvARPCzxHAWuNU5AAOHwT5Vpw5z1akn78KT2FA
         z7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790319200; x=1790924000;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LD4caPae1oVXrCq1fFq8mP/1u249QbSVdZngF71A038=;
        b=0jehO6ozxApLNmL+aIWdxRvhOJLBOQyGgtt9sS1HcYUzTCiCQ8gvdf0EHfjpjJWpGV
         wyJzek+2WRrTx5BVcZM+PCqO8pkGHgK/tF8+7zJ0giMZImtnRO/tzDNr1YWVzhcq5uKZ
         dZULr8LDTKh/gCJBRbllEEAVc336iZCptgkoKwjyZTAc1C078IRnrhVY1ZEpgieVEx5W
         MrOTIm55mWv3g90Qr9Xq16w9PgZXPwVoExfQMu3cAobr6MuZunjAzr5PCYct85LVhJII
         VUNMLoDZhEsQ/+w+7rBY0AiP7xHZdI22gjhu2ooAnS3cA+HufpXPXQD7HfrShcXDbPbN
         GZiA==
X-Gm-Message-State: AFuF++m9zLda3WHxJfbtqtYrXPmOG6meeRMW+aPGMJI6cHfS6W0nB9xH
	zKwlwri59fVLpXKyt7cDoNSE1y+4Ubu6Y6Asqh1N4bj504BxYd4QoqKNg5JAjxDRaPgAeGzUMCl
	VcqyvUIylxDUWDlRM9GC7ma7iE1WAElZiQbpFwDU=
X-Gm-Gg: AYBFou0xzxU546sdsxVO/eUq+bNMG6ZyG7pc3BRd9iSNJoBrS8jNvCPf9UNuq/IOM+P
	3ruaA6TLTSpVBnKyX8GftD3tD8zGxWwxKpKPGqlGxMF+REr5bNm6SMR2DaQI2XiwKD8zqmt75LY
	96onl4rT8QBpSLRWLETvXZJUOqumjkxsrLTkm+ti1TKzcyIfoIUSOkJKXlSHCHp7f8C957el20w
	psiiHchBUR8xpLJac0utT1c39d20APfg0ASCFZMJUhJ25k/dF3XX5eAcc9O5UXYrHIKJmVpEIrl
	VZgF1B29t4S5UBzwLMgXgzNgyEW0746FzAvj+rmSbc1ITWkzt3wkJcU/VixjaMGUsWaNepGzGpq
	SwPzzUjHtg3Ts
X-Received: by 2002:a05:6808:6782:b0:4cb:f40e:6f3b with SMTP id
 5614622812f47-4d72ac48247mr5534034b6e.43.1790319199849; Thu, 24 Sep 2026
 23:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260924053121.17703-1-yupeng0921@gmail.com> <20260924054540.ABC821F000FF@smtp.kernel.org>
In-Reply-To: <20260924054540.ABC821F000FF@smtp.kernel.org>
From: peng yu <yupeng0921@gmail.com>
Date: Thu, 24 Sep 2026 23:53:08 -0700
X-Gm-Features: AclHuK_uHr4EXcshl0s8Z_YRYoCYwHghR4xWOWXss3V9-88IOhUBhefWslpQq4Y
Message-ID: <CAG3TDc3vZjgLmsMH6-nUq-YdJLrX7r9O1gEynhaSMWfWXv62Yw@mail.gmail.com>
Subject: Re: [PATCH v4] nvmet: add cgroup_path to charge namespace I/O to a cgroup
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 10:45=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] nvmet: cgroup IO isolation is silently bypassed for non-kthrea=
d transports
> --
>
> commit dd3858fd51d1cf303ef355857ff0cd794f5322ff
> Author: Peng Yu <yupeng0921@gmail.com>
>
> nvmet: add cgroup_path to charge namespace I/O to a cgroup
>
> This commit introduces cgroup support to the NVMe target subsystem, allow=
ing
> administrators to limit namespace I/O by configuring a cgroup_id. It hand=
les
> both block and file-backed namespaces and associates the submitting threa=
d
> with the target cgroup during execution.
>
> > diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io=
-cmd-file.c
> > index 0b22d183f9279..570e65259ad89 100644
> > --- a/drivers/nvme/target/io-cmd-file.c
> > +++ b/drivers/nvme/target/io-cmd-file.c
> [ ... ]
> > @@ -97,7 +99,10 @@ static ssize_t nvmet_file_submit_bvec(struct nvmet_r=
eq *req, loff_t pos,
> >       iocb->ki_filp =3D req->ns->file;
> >       iocb->ki_flags =3D ki_flags | iocb->ki_filp->f_iocb_flags;
> >
> > -     return call_iter(iocb, &iter);
> > +     associated =3D nvmet_blkcg_begin(req->ns);
> > +     ret =3D call_iter(iocb, &iter);
> > +     nvmet_blkcg_end(associated);
> > +     return ret;
> >  }
>
> [Severity: Medium]
> Since file backend IO submission relies on nvmet_blkcg_begin() to associa=
te
> the cgroup, does executing this in a process context (like nvme-loop) res=
ult
> in the IO being charged to the submitting user task rather than the confi=
gured
> namespace cgroup?
>
> > diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
> > index dbda55895f4fb..62bbfcc4ea143 100644
> > --- a/drivers/nvme/target/nvmet.h
> > +++ b/drivers/nvme/target/nvmet.h
> [ ... ]
> > @@ -732,6 +743,42 @@ void nvmet_bdev_execute_zone_mgmt_recv(struct nvme=
t_req *req);
> >  void nvmet_bdev_execute_zone_mgmt_send(struct nvmet_req *req);
> >  void nvmet_bdev_execute_zone_append(struct nvmet_req *req);
> >
> > +#ifdef CONFIG_BLK_CGROUP
> [ ... ]
> > +static inline bool nvmet_blkcg_begin(struct nvmet_ns *ns)
> > +{
> > +     if (!ns->blkcg_css || !in_task() || !(current->flags & PF_KTHREAD=
))
> > +             return false;
> > +
> > +     kthread_associate_blkcg(ns->blkcg_css);
> > +     return true;
> > +}
>
> [Severity: Medium]
> Does this explicit check against PF_KTHREAD silently bypass cgroup IO
> isolation for synchronous transports like nvme-loop?
>
> Local users can use nvme-loop to submit I/O inline without a kthread.
> When this happens, kthread_associate_blkcg() is skipped, which appears
> to allow the I/O to escape the configured target cgroup limits and defeat
> the noisy neighbor protection.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924053121.17=
703-1-yupeng0921@gmail.com?part=3D1

Per my understanding, the nvme-loop submits the IOs to a work queue, so
the nvmet kernel thread will handle the request. No IO has a user associate=
d
cgroup. So I think we don't need to worry about both the two medium severit=
y
concerns. If I'm wrong, please let me know.
