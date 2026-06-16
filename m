Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D2F21767D
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569123; cv=pass; b=GMjSj5AB4TrITx5O1u9mmOQ+4wW2UfHodHEFEL2ugIphBew2/usY/aACAuV/9EYweMOITtOByTOYKTtFxzotvMQHtGGwFNQhn+T66gPEvTSwKaZ9HBWJiodPiJDgmY1021MjRJeGuxCey4cR05a7pllkK4uRWxcRaxP8/tVGYs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569123; c=relaxed/simple;
	bh=g1iWUngKBWgvy1Q9i5A84SULL6ZtHth0v2HCTTDx4qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBFL2Ti2YLENxsPSok3Sqq1nu7wPYhCIrqqP0JWALjFAZmJYn3sN91j1djSndmSinpLH3ol6uaG/T0Mu3xSwNzxEYC6lcxvj5KULnGEBRGKh0ewhFdqcE0/azhE5OIpyqvUVeb0hy/Rk7h9357UHCoSES7XPA8TIzFGt5lum5s8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NpKKGM3a; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NpKKGM3a"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef1198766so2087900f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 17:18:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781569120; cv=none;
        d=google.com; s=arc-20240605;
        b=RToPI4AI/0D27F9fjw8bUiXIxUIRqAsyP6RmleQ2YojnKuvPTk4unSxV9vlIKuq78F
         sy/oHvLyZpDQxS21ZoIyRalzVjKN4FwiJi539sgxDOuNf6z/FHhvzqcRwM7JUbKKPaaH
         YfOqszPysaFG0sVAz9657WiQIxjZq6UFv38asfTMrIGgsYmSdiIZHAq5MVb4y0mGckGp
         aSvID+8k/MkvGdYD0Gf9As8GlvFVsveYzU+o3/fcAcuRYfE29p26dSFgEXTUoagvTWYn
         bc3N29jwkZ+fJkstGrv+UmTu3HKcs7D0H0zyx9fDN+oUCQD/3KyzG+HNZrABogyncCxR
         xp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7V4TYqZmCFCtv7Jj7gCWIHnUd+jvmCQLH/LBtW5JKcM=;
        fh=VtL6X23xetjhT17pT+3DX5HYdYFWqymP69UvUYj5CiY=;
        b=F/K0OFHD1j9/41XRfxTxE7LupUuD7HAgir/Rq0eJO8PRm8vPZ7Qq7Dd6RiiVs+kcJ1
         2WxVU6KXMdumg2BJELkJHeKLOpTWdd/Rto+F2SQOWSYpMGvj5WNRVQ2yIAudbHgGuqp+
         ocoUpU5dC1PvjaaKvmUlOkiOwefF8XG6YZYQ5DKmNdoKgA6jElVsd51J6ELlz5e4v6HK
         pOAxBcT4vFnt2C4RlUOcR2zprql94Bo6GQYG5TXWl/p4Q3IWdCd6WiC1OyKvZ0w/1Khz
         +Kgt963HiOiVvp5zQWJqpodpFo9u9WqWp9kGAuP4Bw4KcIOPbR5AUze7DJc5Z+qqjoWW
         SR0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781569120; x=1782173920; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7V4TYqZmCFCtv7Jj7gCWIHnUd+jvmCQLH/LBtW5JKcM=;
        b=NpKKGM3aHt+AGHhNAtqBqrD6WeNhfmTtb0v0ngqWbVgEMO0KDXWvq6tf+U//6jiO1J
         ek9T2rBd+AUhtVQ2RuFeINXJiC1rejXZxoLySlyT+f2GN/9Tiaih7wduH0N9LrvirGTo
         9848dTXTHu39fxm0hZKApgeTbk9yw8R+gH6rh+/lj+y8z01f7D8BU9y8Pnv6sxXjv7WP
         JL3tszLxC/ZslZUMaV4VG00EjCx8HMNxQLlt4C3LFtTV4H1QtFqk5+Xi8JV1eGXaa6MN
         nhneJwXvGyxvRAZ5NOahAhTmkKNnul6wEqcE/kWvSJ5Uk9vpq2wXaqTnIw14ty9X71W+
         EZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569120; x=1782173920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7V4TYqZmCFCtv7Jj7gCWIHnUd+jvmCQLH/LBtW5JKcM=;
        b=qIy2zLgBw7xzEnKw/+1KKOU3WB8nML0ZbO27VKRgOVLS8ra0eHHKRRl71ZsNNjmI0I
         wnCdKkMGBO0DamUWsDobM6HwBuS31n+onLTilFGJbONFFuussEkQCEubhPNv7Wwnj7vN
         k+K1Up6TKe5skQciW9vHttoJvdQvkhBhL61A+QjlCPVzmnhPLtF9p69tRAmvqsgECSge
         +pQAguAeA/ZbrLaBDeniVm25Ip8ezAlgCyJvxpey4hD3AOs60uohZLAdV9d+79vpRO3j
         7EFSp/wjB/Max9OqLLpkdOM2NmdmN2CkcpMdOjoY8gKgyUooVi8aqHNOseRNie2dVRo/
         K1/w==
X-Forwarded-Encrypted: i=1; AFNElJ8nSWTI9ZMRvZBFFJlZiU4KfIGHKyrmSCuY5qV0waJTlnn/SSCQEJXUockGtBLmZOtcW8VqU7M/SWUgRaWrfiw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZJe7MPElaC/qiQoU75mWXqe5Vi0wepHBDzTW/XKPhUP1VRAuu
	Oo0WdNHctaOMHFK86tRJ6ToQPfWTJzUzA8lpIH+UdLcYoHuiR6fKUxqCfBHKrhcV02iRB8VNuXm
	oqiyeFDg80y6z1+R94wkV7R3w4dW6FUGW7Lvac2bQ
X-Gm-Gg: Acq92OHb1xvnudeKWoKomfIs5rZtR8NeosPXQ0F9xhePqIHN1ibU7UxSocYcTi2AGBG
	405nYU3sYsbaQjOdx9AnZ8CU7/QRngQxsj6gXkTswI/5gZpNEmmyos1erAWjZp/6Tm5KCsMvLCe
	Wo9szREcma7TM3p0tvKDn0YgQjTCJJlVDE/TlWoBjJi+aMNsauxUm7NhACDiX3h2MvCl0IR08yA
	YTmBAT9jJC8mcdhFJSMPWh90k0Nxtm65XhnNMpBLWXm6PDsKd1WzGUMRHkBhjdCccRAopkTmux7
	N2PaNCT2Hwja4QyorMRoDQMoan40JWsUTagq
X-Received: by 2002:a5d:4535:0:b0:45e:dd32:92fa with SMTP id
 ffacd0b85a97d-4619f2efb2bmr1748820f8f.12.1781569119492; Mon, 15 Jun 2026
 17:18:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601-sev_snp_fixes-v2-1-611891b28a86@meta.com>
 <20260601231728.C67C51F00893@smtp.kernel.org> <33dccdf4-45f7-40b5-a0cf-3f99b26d46f1@linux.dev>
 <2ae6f15d-695e-44d7-b2ab-905f83e78a6f@amd.com>
In-Reply-To: <2ae6f15d-695e-44d7-b2ab-905f83e78a6f@amd.com>
From: Jacob Xu <jacobhxu@google.com>
Date: Mon, 15 Jun 2026 17:18:27 -0700
X-Gm-Features: AVVi8CcNHlYEIY7vtPJHaSAR184gKQPmK9REzocI5UsdWbDrKqC39vM_qiFlQk4
Message-ID: <CAJ5mJ6jVX++74H2o=ZFcQbppHoNTWD0a52wOycYL4En3_dUWeQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] KVM: SEV: Do not allow intra-host
 migration/mirroring of SNP VMs
To: Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>
Cc: Atish Patra <atish.patra@linux.dev>, sashiko-reviews@lists.linux.dev, 
	Peter Gonda <pgonda@google.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>  Could this silently
> drop important execution features for SEV-ES mirrors?

f43c887cb7cb5 "KVM: SEV: Update svm_vm_copy_asid_from for SEV-ES"
notes in its description
```
For mirroring SEV-ES the mirror VM will need more then just the ASID.
    The FD and the handle are required to all the mirror to call psp
    commands. The mirror VM will need to call KVM_SEV_LAUNCH_UPDATE_VMSA to
    setup its vCPUs' VMSAs for SEV-ES.
```

This seems to assume QEMU (or whichever VMM being used, i haven't
checked QEMU) syncs this for us by calling the other ioctl on the
target VM. Notably Joerg sent out a patchset that directly sets VMSA
from userspace (https://lkml.org/lkml/2026/6/11/1200), so we may want
to coordinate this a bit.

Adding Joerg to the thread as FYI, we'll also be wanting to support
copyless migration for planes which replicates more state.


On Wed, Jun 3, 2026 at 6:15=E2=80=AFAM Tom Lendacky <thomas.lendacky@amd.co=
m> wrote:
>
> On 6/2/26 16:55, Atish Patra wrote:
> >
> > On 6/1/26 4:17 PM, sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 3 potential
> >> issue(s) to consider:
>
> Adding @Peter Gonda who knows this code better than I do!
>
> Thanks,
> Tom
> >>
> >> Pre-existing issues:
> >> - [High] Missing `kvm->arch.vm_type` validation in
> >> `sev_vm_copy_enc_context_from` allows creating structurally
> >> inconsistent mirror VMs.
> >> - [High] Missing `vmsa_features` copy in
> >> `sev_vm_copy_enc_context_from` breaks SEV-ES mirror VMs that use
> >> features like `DEBUG_SWAP`.
> >> - [High] Concurrent list modification of `owner_sev_info->mirror_vms`
> >> without holding the owner VM's lock during mirror VM migration.
> >> --
> >>
> >> commit 5adb8a893221b0569310f07fd9fc7abca8088651
> >> Author: Atish Patra <atishp@meta.com>
> >>
> >> KVM: SEV: Do not allow intra-host migration/mirroring of SNP VMs
> >>
> >> This commit rejects SNP source VMs in migration/mirroring until proper
> >> SNP
> >> state transfer is implemented.
> >>
> >>> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> >>> --- a/arch/x86/kvm/svm/sev.c
> >>> +++ b/arch/x86/kvm/svm/sev.c
> >>> @@ -2142,7 +2142,8 @@ int sev_vm_move_enc_context_from(struct kvm
> >>> *kvm, unsigned int source_fd)
> >>>           return ret;
> >>>         if (kvm->arch.vm_type !=3D source_kvm->arch.vm_type ||
> >>> -        sev_guest(kvm) || !sev_guest(source_kvm)) {
> >>> +        sev_guest(kvm) || !sev_guest(source_kvm) ||
> >>> +        sev_snp_guest(source_kvm)) {
> >> [Severity: High]
> >> This is a pre-existing issue, but I noticed a potential locking race w=
hen
> >> an existing mirror VM is migrated via sev_vm_move_enc_context_from().
> >>
> >> Locks are only acquired for the source mirror (source_kvm) and
> >> destination
> >> VM (kvm):
> >>
> >> arch/x86/kvm/svm/sev.c:sev_vm_move_enc_context_from() {
> >>      ...
> >>      ret =3D sev_lock_two_vms(kvm, source_kvm);
> >>      if (ret)
> >>          return ret;
> >>      ...
> >> }
> >>
> >> Later, in sev_migrate_from(), it updates its owner's list of mirrors:
> >>
> >> arch/x86/kvm/svm/sev.c:sev_migrate_from() {
> >>      ...
> >>      if (is_mirroring_enc_context(dst_kvm)) {
> >>          struct kvm_sev_info *owner_sev_info =3D
> >>              to_kvm_sev_info(dst->enc_context_owner);
> >>
> >>          list_del(&src->mirror_entry);
> >>          list_add_tail(&dst->mirror_entry, &owner_sev_info->mirror_vms=
);
> >>      }
> >>      ...
> >> }
> >>
> >> Since the required lock for enc_context_owner is omitted entirely, cou=
ld
> >> this concurrently modify the owner_sev_info->mirror_vms linked list if
> >> userspace creates a new mirror via sev_vm_copy_enc_context_from(), whi=
ch
> >> locks the owner VM? Would this result in kernel list corruption?
> >
> > It looks possible for SEV VMs looking at the code but I don't the know
> > code path
> > or the mirroring/migration use case well enough to judge how likely thi=
s
> > scenario
> > in real world.
> >
> >>>           ret =3D -EINVAL;
> >>>           goto out_unlock;
> >>>       }
> >>> @@ -2865,6 +2866,7 @@ int sev_vm_copy_enc_context_from(struct kvm
> >>> *kvm, unsigned int source_fd)
> >>>        * created after SEV/SEV-ES initialization, e.g. to init
> >>> intercepts.
> >>>        */
> >>>       if (sev_guest(kvm) || !sev_guest(source_kvm) ||
> >>> +        sev_snp_guest(source_kvm) ||
> >>>           is_mirroring_enc_context(source_kvm) || kvm->created_vcpus)=
 {
> >> [Severity: High]
> >> This isn't a bug introduced by this patch, but this block seems to be
> >> missing the kvm->arch.vm_type !=3D source_kvm->arch.vm_type check that
> >> exists in sev_vm_move_enc_context_from().
> >>
> >> Does this omission allow creating structurally inconsistent mirror VMs=
?
> >> Userspace could potentially create a destination VM as KVM_X86_SNP_VM =
and
> >> mirror a source VM of type KVM_X86_SEV_VM into it. Since KVM's core MM=
U
> >> would treat the new VM as an SNP VM (due to arch.vm_type), but the SEV
> >> code treats it as a legacy SEV VM (because ____sev_snp_guest evaluates
> >> to false), could this produce an inconsistent internal state and allow
> >> attaching guest_memfd to standard SEV VMs?
> > NA. They don't have to be same vm type as per my understanding from the
> > selftest code.
> >>>           ret =3D -EINVAL;
> >>>           goto e_unlock;
> >> [Severity: High]
> >> This is a pre-existing issue, but I noticed another detail in
> >> sev_vm_copy_enc_context_from() just below this diff.
> >>
> >> The initialization block for the mirror VM omits copying vmsa_features=
:
> >>
> >> arch/x86/kvm/svm/sev.c:sev_vm_copy_enc_context_from() {
> >>      ...
> >>      mirror_sev->enc_context_owner =3D source_kvm;
> >>      mirror_sev->active =3D true;
> >>      mirror_sev->asid =3D source_sev->asid;
> >>      mirror_sev->fd =3D source_sev->fd;
> >>      mirror_sev->es_active =3D source_sev->es_active;
> >>      mirror_sev->need_init =3D false;
> >>      mirror_sev->handle =3D source_sev->handle;
> >>      ...
> >> }
> >>
> >> This omits mirror_sev->vmsa_features =3D source_sev->vmsa_features.
> >>
> >> Since SEV-ES VMs use vmsa_features to track capabilities like
> >> SVM_SEV_FEAT_DEBUG_SWAP, would a mirrored SEV-ES VM incorrectly
> >> initialize its vmsa_features to 0? When vCPUs are instantiated,
> >> sev_es_init_vmcb() checks sev_vcpu_has_debug_swap(), which would evalu=
ate
> >> to false, resulting in misconfigured VMCB intercepts. Could this silen=
tly
> >> drop important execution features for SEV-ES mirrors?
> >
> > As per my understanding, that is intentional as well.
> > Is it common to mirror SEV VMs with SVM_SEV_FEAT_DEBUG_SWAP enabled ?
> >
> > @tom: Please let me know if any of the above statements are not true.
> >
> >
>
>
